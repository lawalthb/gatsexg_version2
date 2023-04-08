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
use App\Model\CurrencyList;
use App\Model\Sell;
use App\Model\UserVerificationCode;
use App\Model\Wallet;
use App\Repository\AffiliateRepository;
use App\Repository\MarketRepository;
use App\Repository\OfferRepository;
use App\Services\CryptocompareSercvice;
use App\Services\Logger;
use App\Services\MailService;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use PHPUnit\Exception;

class CurrencyService
{

    public $logger;
    public $marketRepo;
    public $offerRepo;
    public $response;
    public $cryptoCompare;
    function __construct()
    {
        $this->logger = new Logger();
        $this->marketRepo = new MarketRepository();
        $this->offerRepo = new OfferRepository();
        $this->cryptoCompare = new CryptocompareSercvice();
    }

    /**
     * @param $request
     * @return array
     */
    // marketplace data
    public function currencyList()
    {
        return CurrencyList::orderBy('id', 'desc')->get();
    }

    // user trade profile
    public function userTradeProfile($userCode,$country,$paginate=10)
    {
        $response = ['success' => false, 'message' => __('Something went wrong')];
        try {
            $img = asset('assets/common/img/avater.png');
            $user = User::where(['unique_code' => $userCode])->first();
            if ($user) {
                if (!empty($user->photo)) {
                    $img = asset(IMG_USER_PATH.$user->photo);
                }
                $data['user'] = $user;
                $data['user']->online_status = check_online_status($user)['online_status'];
                $data['user']->last_seen = check_online_status($user)['last_seen'];
                $data['user']->photo = $img;
                $data['user_trading_info'] =$this->userTradingInfo($user);

                $buys = Buy::where(['status' => STATUS_ACTIVE, 'user_id' => $user->id])->orderBy('id', 'DESC')->paginate($paginate);
                $data['buys'] = $this->offerList($buys,$country);
                $sells = Sell::where(['status' => STATUS_ACTIVE, 'user_id' => $user->id])->orderBy('id', 'DESC')->paginate($paginate);
                $data['sells'] = $this->offerList($sells,$country);

                $response =  ['success' => true, 'message' => __('Data get successfully'), 'data' => $data];
            } else {
                $response = ['success' => false, 'message' => __('User not found'),'data' => []];
            }

        } catch (\Exception $exception) {
            $this->logger->log('userTradeProfile', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }

    // user open offer
    public function userOpenOffer($type, $offer_id, $country)
    {
        try {
            $checkKyc = $this->marketRepo->kycValidationCheckTrade(Auth::id());
            if ($checkKyc['success'] == false) {
                return ['success' => false, 'message' => $checkKyc['message'],'data' => []];
            }
            $this->offerRepo->checkOfferWithDynamicRate($type,$offer_id);

            if($type == 'buy') {
                $offer = Sell::where(['unique_code' => $offer_id])->first();
                if (isset($offer)) {
                    $data['title'] = __('Buy ').$offer->coin_type.__(' from '). $offer->user->first_name.' '.$offer->user->last_name ;
                    $data['offer'] = $this->offerDetailsData($offer,$country);
                    $data['type'] = $type;
                    $data['type_text'] = __('Buy ').$offer->coin_type.__(' from ');
                } else {
                    return ['success' => false, 'message' => __('Offer not found'),'data' => []];
                }
            } elseif($type == 'sell') {
                $offer = Buy::where(['unique_code' => $offer_id])->first();
                if (isset($offer)) {
                    $data['title'] = __('Sell ').$offer->coin_type.__(' to '). $offer->user->first_name.' '.$offer->user->last_name ;
                    $data['offer'] = $this->offerDetailsData($offer,$country);
                    $data['type'] = $type;
                    $data['type_text'] = __('Sell ').$offer->coin_type.__(' to ');
                } else {
                    return ['success' => false, 'message' => __('Offer not found'),'data' => []];
                }
            } else {
                return ['success' => false, 'message' => __('Offer not found'),'data' => []];
            }
            $response =  ['success' => true, 'message' => __('Data get successfully'), 'data' => $data];
        } catch (\Exception $e) {
            $this->logger->log('userOpenOffer', $e->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }

    // user trading info
    public function userTradingInfo($user)
    {
        $data['total_trades'] = user_trades_count($user->id,'total');
        $data['successful_trades'] = user_trades_count($user->id, TRADE_STATUS_TRANSFER_DONE);
        $data['ongoing_trades'] = $data['total_trades']-($data['successful_trades']+user_trades_count($user->id, TRADE_STATUS_CANCEL));
        $data['cancelled_trades'] = user_trades_count($user->id, TRADE_STATUS_CANCEL);
        $data['disputed_trades'] = user_disputed_trades($user->id);
        return $data;
    }

    //  offer list
    public function offerList($offers,$country)
    {
        if (isset($offers[0])) {
            foreach ($offers as $offer) {
                $this->offerDetailsData($offer,$country);
            }
        }
        return $offers;
    }

    // offer details
    public function offerDetailsData($offer,$country)
    {
        $offer->user_registered = date('M Y', strtotime($offer->user->created_at));
        $offer->user_trade_feedback = get_user_feedback_rate($offer->user_id);
        $offer->user_trades = count_trades($offer->user_id);
        $offer->user_code = $offer->user->unique_code;
        $offer->user_name = $offer->user->username;
        $offer->coin_type = check_default_coin_type($offer->coin_type);
        $offer->payment_method_details = $this->offerPaymentMethod($offer,$country);
        $offer->country = countrylist($offer->country);
        $offer->size = number_format($offer->minimum_trade_size,2). ' '.$offer->currency . __(' to '). number_format($offer->maximum_trade_size,2). ' '.$offer->currency;
        $offer->rate_details = $this->offerRateDetails($offer);
        return $offer;
    }

    // offer payment method
    public function offerPaymentMethod($offer,$country)
    {
        $data = [];
        if (isset($offer->payment($offer->id)[0])) {
            foreach ($offer->payment($offer->id) as $offer_payment) {
                if ($country == 'any') {
                    $data []= [
                        'payment_image' => $offer_payment->payment_method->image,
                        'payment_name' => $offer_payment->payment_method->name,
                        'payment_id' => $offer_payment->payment_method_id,
                    ];
                } elseif(is_accept_payment_method($offer_payment->payment_method_id,$country)) {
                    $data []= [
                        'payment_image' => $offer_payment->payment_method->image,
                        'payment_name' => $offer_payment->payment_method->name,
                        'payment_id' => $offer_payment->payment_method_id,
                    ];
                }
            }
        }
        return $data;
    }

    // offer rate details
    public function offerRateDetails($offer)
    {
        $data['offer_rate'] = number_format($offer->coin_rate,2).' '.$offer->currency;
        if($offer->rate_type == RATE_TYPE_DYNAMIC) {
            $data['rate_text'] = number_format($offer->rate_percentage,2) .' % ' .price_rate_type($offer->price_type) .__(' Market');
        } else {
            $data['rate_text'] = __('Static Rate');
        }
        return $data;
    }

    public function currencyAddEdit($request,$auto = false){
        DB::beginTransaction();
        try {
            $response = isset($request->id) ? __("Currency updated ") : __("Currency created ") ;
            $id = $request->id ?? 0;
            $status =  isset($request->status) ? true : false;
            $check = $auto ? [ 'code' => $request->code ] : [ 'id' => $id ] ;
            CurrencyList::updateOrCreate($check,[
                'name' => $request->name,
                'code' => $request->code,
                'symbol' => $request->symbol,
                'rate' => $request->rate,
                'status' => $status,
            ]);
        }catch (Exception $e){
            DB::rollBack();
            $this->logger->logger($e,"Currency Add Edit",$e->getMessage());
            return ["success" => false, "message" => $response . __("failed")];
        }
        DB::commit();
        return ["success" => true, "message" => $response . __("successfully")];
    }

    public function saveAllCurrency(){
        $currency = fiat_currency_array();
        $rates = $this->getCurrencyRateData();
        foreach ($rates['rates'] as $type => $rate){
            foreach ($currency as $index => $item){
                if($item['code'] == $type)
                    $currency[$index]['rate'] = $rate;
            }
        }
        foreach ($currency as $item){
            if(!isset($item['rate']))
                $item['rate'] = 1;
                $item['status'] = 1;
            $respose = $this->currencyAddEdit((object)$item, true);
        }
    }

    public function currencyStatusUpdate($id){
        DB::beginTransaction();
        try{
            $c = CurrencyList::find($id);
            $status = !$c->status;
            $c->update(['status' => $status]);
        }catch (\Exception $e){
            DB::rollBack();
            $this->logger->logger($e,"Currency Status Changed",$e->getMessage());
            return false;
        }
        DB::commit();
        return true;
    }

    public function currencyRateSave(){
        $data = $this->getCurrencyRateData();
        DB::beginTransaction();
        try{
            foreach ($data['rates'] as $type => $rate)
                CurrencyList::where('code',$type)->update([ 'rate' => $rate ]);
        }catch (\Exception $e){
            DB::rollBack();
            $this->response = [ 'success' => false, 'message' => __('Currency Rate Update failed') ];
        }
        DB::commit();
        $this->response = [ 'success' => true, 'message' => __('Currency Rate Update') ];
    }
    public function getCurrencyRateData(){
        $headers = ['Content-Type: application/json'] ;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://api.exchangerate.host/latest?base=USD');
        curl_setopt($ch, CURLOPT_POST, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $result = curl_exec($ch);
        curl_close($ch);
        return json_decode($result,true);
    }

    public function updateCoinRate(){
        try{
            $coins = Coin::where(['status' => STATUS_ACTIVE])->get();
            if(isset($coins[0])) {
                foreach ($coins as $coin){
                    $pair = explode('.',$coin->type)[0];
                    if( $pair == 'USDT') continue;
                    $pair = $pair.'USDT';
                    $res = getPriceFromApi($pair);
                    if($res['success']){
                        $coin->rate = $res['data']['price'];
                        $coin->save();
                    }
                }
            }
        }catch (\Exception $e){
            storeException("updateCoinRate ex ",$e->getMessage());
            return [ "success" => false, "message" => __("Coins rate updated Failed") ];
        }

        storeException('updateCoinRate',"Update Coin Rate updated successfully");
        return [ "success" => true, "message" => __("Coins rate updated successfully") ];
    }
    private function getArrayString($coin){
        $coin_array = [];
        $coinString = [];
        $counter = 0;
        foreach ($coin as $coin){
            $coin_array[] = check_default_coin_type($coin);
            $counter++;
            if($counter == 15) {
                $coinString[] = implode(",", array_values($coin_array));
                $counter = 0;
                $coin_array=[];
            }
        }
        if(!empty($coin_array))
            $coinString[] = implode(",", array_values($coin_array));
        return $coinString;
    }
    private function saveCoinsRate($coins,$rate){
        foreach ($coins as $item) {
            if (isset($rate[check_default_coin_type($item->type)])) {
                $item->rate = $rate[check_default_coin_type($item->type)]['USD'];
                $item->save();
            }
        }
    }
}
