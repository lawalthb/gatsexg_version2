<?php
/**
 * Created by PhpStorm.
 * User: bacchu
 * Date: 9/12/19
 * Time: 12:56 PM
 */

namespace App\Http\Services;

use App\Model\AffiliationCode;
use App\Model\Buy;
use App\Model\Coin;
use App\Model\Escrow;
use App\Model\Order;
use App\Model\OrderDispute;
use App\Model\Sell;
use App\Model\UserPaymentMethod;
use App\Model\Wallet;
use App\Repository\AffiliateRepository;
use App\Repository\ChatRepository;
use App\Repository\MarketRepository;
use App\Repository\OfferRepository;
use App\Services\Logger;
use App\Services\MailService;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\View;
use Pusher\Pusher;

class TradeService
{

    public $logger;
    public $marketRepo;
    public $offerRepo;
    public $chatRepo;
    function __construct()
    {
        $this->logger = new Logger();
        $this->marketRepo = new MarketRepository();
        $this->offerRepo = new OfferRepository();
        $this->chatRepo = new ChatRepository();
    }

    /**
     * @param $request
     * @return array
     */
    public function userTradeDetails($order_id,$userId)
    {
        $response = ['success' => false, 'message' => __('Something went wrong')];
        try {
            $data['title'] = __('Order Details');
            $id = $order_id;
            $order = Order::where(['order_id' => $id])->first();

            if ($order) {
                $this->cancelTradeWhenPaymentTimeExpired($order->id);
            } else {
                $response = ['success' => false, 'message' => __('Order not found')];
            }
            $coin = Coin::where('type', $order->coin_type)->first();
            if (isset($order) && ($order->buyer_id == $userId)) {
                $sender_id = $order->seller_id;
                $data['type'] = 'buyer';
                $data['title'] = __('Buy ').check_default_coin_type($order->coin_type).__(' from '). $order->seller->username;
                $data['type_text'] = __('Buy ').check_default_coin_type($order->coin_type).__(' from ');

            } elseif (isset($order) && ($order->seller_id == $userId)) {
                $sender_id = $order->buyer_id;
                $data['type'] = 'seller';
                $data['title'] = __('Sell ').check_default_coin_type($order->coin_type).__(' to '). $order->buyer->username ;
                $data['type_text'] = __('Sell ').check_default_coin_type($order->coin_type).__(' to ');
                $data['check_balance'] = $this->marketRepo->check_wallet_balance_for_escrow(Auth::id(),$order, $coin);

            } else {
                return ['success' => false, 'message' => __('Order not found'),'data' => []];
            }

            $data['item'] = $this->userOrderDataDetails($order);

            if($order->is_reported == STATUS_ACTIVE) {
                $data['report'] = OrderDispute::where('order_id', $order->id)->where('status', '<>', STATUS_DELETED)->first();
                $data['cancelTimeCheck'] = date('Y-m-d H:i:s') < date('Y-m-d H:i:s',strtotime($data['report']->expired_at ?? ''));
            }
            if(isset($data['report'])) {
                $data['dispute_status'] = STATUS_ACTIVE;
            } else {
                $data['dispute_status'] = STATUS_DEACTIVE;
            }
            $chartData = $this->chatData($sender_id,$order);
            $data['chat_list'] = $chartData['chat_list'];
            $data['selected_user'] = $chartData['selected_user'];

            $data['feedback_array'] = feedback_status_api();
            $data['feedback'] = $data['type'] == 'seller' ?
                get_user_feedback_rate($data['item']->buyer_id) :
                get_user_feedback_rate($data['item']->seller_id);


            $response = ['success' => true, 'message' => __('Trade details'),'data' => $data];
        } catch (\Exception $exception) {
            $this->logger->log('userTradeDetails', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }

    public function userdisputTradeCancel($order_id,$userId)
    {
        $response = ['success' => false, 'message' => __('Something went wrong')];
        DB::beginTransaction();  
        try {
            $id = $order_id;
            $order = Order::where(['unique_code' => $id, 'is_reported' => STATUS_ACTIVE]);
            if ($orderData = $order->first()) {
                $report = OrderDispute::whereOrderId($orderData->id ?? 0)->whereReportedUser($userId);
                if($report->first()){
                    $order->update(['is_reported' => STATUS_DEACTIVE]);
                    $report->delete();
                    $response = ['success' => true, 'message' => __('Order disput canceled')];
                }else{
                    $response = ['success' => false, 'message' => __('Order disput record not found')];
                }
            } else {
                $response = ['success' => false, 'message' => __('Disput order not found')];
            }
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollback();
            $this->logger->log('userdisputTradeCancel', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }

    // user open offer
    public function userOrderDataDetails($order)
    {
        $order->payment_method_name = $order->payment_method->name;
        $order->payment_method_image = $order->payment_method->image;
        $order->status_text = $order->payment_method->image;
        $order->encrypted_id = encrypt($order->id);
        $order->count_buyer_trades = count_orders($order->buyer_id);
        $order->count_buyer_success = trade_percent($order->buyer_id);
        $order->count_seller_trades = count_orders($order->seller_id);
        $order->count_seller_success = trade_percent($order->seller_id);
        $order->payment_sleep_path = asset(path_image().$order->payment_sleep);
        $order->buyer_username = $order->buyer->username;
        $order->buyer_user_code = $order->buyer->unique_code;
        $order->seller_username = $order->seller->username;
        $order->seller_user_code = $order->seller->unique_code;
        $order->seller_registered = date('M Y', strtotime($order->seller->created_at));
        $order->buyer_registered = date('M Y', strtotime($order->buyer->created_at));
        $order->payment_details = $this->paymentMethodDetails($order->seller_id, $order->payment_id);

        return $order;
    }

    // chat related thing
    public function chatData($sender_id,$order)
    {
        $data['chat_list'] = $this->chatRepo->messageList($sender_id, $order->id)['chat_list'];
        $data['selected_user'] = User::find($sender_id);
        $data['selected_user']->encrypted_receiver_id = encrypt($data['selected_user']->id);
        if(!empty($data['selected_user']->photo)){
            $img = asset(IMG_USER_PATH.$data['selected_user']->photo);
        }
        if(Cache::has('is_online' . $data['selected_user']->id)) {
            $data['selected_user']->online_status = 'online';
        } else {
            $data['selected_user']->online_status = 'offline';
        }
        if($data['selected_user']->last_seen != null) {
            $data['selected_user']->last_seen = Carbon::parse($data['selected_user']->last_seen)->diffForHumans();
        } else {
            $data['selected_user']->last_seen = __('No data');
        }
        $data['selected_user']->encrypted_receiver_id = encrypt($data['selected_user']->id);
        $data['selected_user']->photo = $img ?? asset('assets/common/img/avater.png');

        return $data;
    }

    //
    public function getMarketOfferPrice($request)
    {
        $response = responseData(false);
        try {
            $data['offer_type'] = $request->offer_type;
            $data['coin_type'] = $request->coin_type;
            $data['currency'] = $request->currency;
            $data['rate'] = 0;
            if ($request->offer_type == BUY) {
                $order = Order::where(['coin_type' => $request->coin_type, 'currency' => $request->currency])->orderBy('rate','desc')->first();
            } else {
                $order = Order::where(['coin_type' => $request->coin_type, 'currency' => $request->currency])->orderBy('rate','asc')->first();
            }
            if (isset($order)) {
                $data['rate'] = $order->rate;
            }
            $response = responseData(true,__('Success'),$data);
        } catch (\Exception $e) {
            storeException('getMarketOfferPrice', $e->getMessage());
        }
        return $response;
    }

    // time expired and cancel the trade automatically
    public function cancelTradeWhenPaymentTimeExpired($orderId)
    {
        try {
            $order = Order::where('payment_expired_time', '<', now())
                ->where(['status' => TRADE_STATUS_ESCROW, 'id' => $orderId])
                ->first();
            if ($order) {
                $this->logger->log('cancelTradeWhenPaymentTimeExpired', 'order  payment time expired');
                //                $update = $this->escrowRefundedWhenPaymentTimeExpired($order);

                $order->update(['payment_expired_time' => NULL]);
                $response = ['success' => true, 'message' => __('Order payment time expired, so the order cancelled automatically')];
            } else {
                $response = ['success' => false, 'message' => __('Order is still active')];
            }
        } catch (\Exception $e) {
            $this->logger->log('cancelTradeWhenPaymentTimeExpired', $e->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong')];
        }
        return $response;
    }

    // cancel trade when payment time expired
    public function escrowRefundedWhenPaymentTimeExpired($order)
    {
        try {
            $reason_heading = __('The payment time expired');
            $reason = __('The payment time already expired, so the order has been cancelled');
            $this->logger->log('Order canceled and escrow refunded start');
            $escrow = Escrow::where(['order_id' => $order->id, 'user_id' => $order->seller_id, 'status' => ESCROW_STATUS_PENDING])->first();
            if (isset($escrow)) {
                $this->logger->log(json_encode($escrow));
                $this->logger->log('Escrow found when WhenPaymentTimeExpired');
                $wallet = Wallet::where(['id' => $escrow->wallet_id])->first();
                $this->logger->log(json_encode($wallet));
                if (isset($wallet)) {
                    $wallet->increment('balance', $escrow->amount);
                }
                $this->logger->log(json_encode($wallet));
                $escrow->update(['amount' => 0, 'status' => ESCROW_STATUS_RETURN]);
            }
            $this->commonService->sendNotificationToUser($order->buyer_id, $reason_heading, $reason);
            $this->commonService->sendNotificationToUser($order->seller_id, $reason_heading, $reason);
            $this->sendPageNotificationWhenStatusChange($order, $order->buyer_id);
            $this->sendPageNotificationWhenStatusChange($order, $order->seller_id);
            $this->logger->log('Order canceled and escrow refunded done');
            $response = [
                'success' => true,
                'message' => __('Order canceled and escrow refunded')
            ];
        } catch (\Exception $e) {
            $this->logger->log('escrowRefundedWhenPaymentTimeExpired', $e->getMessage());
            $response = [
                'success' => false,
                'message' => __('Something went wrong')
            ];
        }
        return $response;
    }

    // send push status
    public function sendPageNotificationWhenStatusChange($order, $user_id)
    {
        try {
            $channel = 'sendorderstatus_' . $user_id . '_' . $order->id;
            $config = config('broadcasting.connections.pusher');
            $pusher = new Pusher($config['key'], $config['secret'], $config['app_id'], $config['options']);
            $data['html'] = $this->testGetDetails($order);
            $test =  $pusher->trigger($channel, 'receive_order_status', $data);
        } catch (\Exception $exception) {
        }
    }

    public function testGetDetails($order)
    {
        $data = [];
        $id = $order->id;
        $coin = Coin::where('type', $order->coin_type)->first();
        if ($order->buyer_id == Auth::id()) {
            $sender_id = $order->seller_id;
            $data['type'] = 'seller';
            $data['title'] = __('Sell ') . check_default_coin_type($order->coin_type) . __(' to ') . $order->buyer->first_name . ' ' . $order->buyer->last_name;
            $data['type_text'] = __('Sell ') . check_default_coin_type($order->coin_type) . __(' to ');
            $data['check_balance'] = $this->check_wallet_balance_for_escrow(Auth::id(), $order, $coin);
        } else {
            $sender_id = $order->buyer_id;
            $data['type'] = 'buyer';
            $data['title'] = __('Buy ') . check_default_coin_type($order->coin_type) . __(' from ') . $order->seller->first_name . ' ' . $order->seller->last_name;
            $data['type_text'] = __('Buy ') . check_default_coin_type($order->coin_type) . __(' from ');
        }
        $data['item'] = $order;
        if ($order->is_reported == STATUS_ACTIVE) {
            $data['report'] = OrderDispute::where('order_id', $order->id)->first();
        }
        $data['selected_user'] = User::find($sender_id);
        $html = '';
        $html .= View::make('user.marketplace.market.order.rightside', $data);
        return $html;
    }

    // check wallet balance
    public function check_wallet_balance_for_escrow($user_id, $order, $coin)
    {
        $wallet = Wallet::where(['id' => $order->seller_wallet_id, 'user_id' => $user_id])->first();
        if (isset($wallet)) {
            if (($order->amount + escrow_fees($order->amount, $coin)) > $wallet->balance) {
                $response = [
                    'success' => false,
                    'message' => __('You do not have enough coin to escrow. Please Deposit enough to your wallet first. ')
                ];
            } else {
                $response = [
                    'success' => true,
                    'message' => __('Enough balance to escrow'),
                    'wallet' => $wallet
                ];
            }
        } else {
            $response = [
                'success' => false,
                'message' => __('Wallet not found')
            ];
        }

        return $response;
    }

    // dispute details
    public function tradeDisputeDetails($request, $dispute_id, $userId)
    {
        $response = ['success' => false, 'message' => __('Something went wrong')];
        try {
            $data['title'] = __('Dispute Details');
            $id = $dispute_id;

            $data['report'] = OrderDispute::where(['unique_code' => $id])->first();
            $data['report']->dispute_img = !empty($data['report']->image) ? asset(path_image() . $data['report']->image) : '';
            $data['assigned_admin'] = '';
            if (isset($data['report'])) {
                $data['report']->partner_name = $data['report']->user->username;
                $data['report']->reported_user_name = $data['report']->reporting_user->username;
                if (!empty($data['report']->assigned_admin)) {
                    $data['assigned_admin_name'] = $data['report']->admin->username;
                    $data['users'] = User::orderBy('id', 'ASC')
                        ->where(['status' => STATUS_ACTIVE, 'is_verified' => STATUS_ACTIVE])
                        ->where('id', $data['report']->assigned_admin)
                        ->first();
                    if ($data['users']) {
                        $userId = $data['users']->id;
                    }
                    if (isset($request->uId)) {
                        $user = User::where(['unique_code' => $request->uId])->first();
                        if ($user) {
                            $userId = $user->id;
                        }
                    }
                    if (isset($userId)) {
                        $data['assigned_admin'] = $data['report']->assigned_admin;
                        // $response = $this->chatService->messageList($userId, '', 'dispute', $data['report']->id);
                        // $data['selected_user'] = $response['selected_user'];
                        // $data['data'] = isset($response['data']) ? $response['data'] : [];
                    }
                }

                $response = [
                    'success' => true,
                    'message' => __('Data get'),
                    'data' => $data
                ];
            } else {
                $response = [
                    'success' => false,
                    'message' => __('Data not found'),
                    'data' => []
                ];
                return $response;
            }
        } catch (\Exception $exception) {
            storeException('userTradeDetails', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'), 'data' => []];
        }
        return $response;
    }

    public function paymentMethodDetails($seller_id, $paymentMethodID)
    {
        $paymentMethodDetails = UserPaymentMethod::where('user_id', $seller_id)->where('payment_method_id', $paymentMethodID)->first();
        return $paymentMethodDetails;
    }
}
