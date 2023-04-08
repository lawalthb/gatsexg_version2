<?php
/**
 * Created by PhpStorm.
 * User: bacchu
 * Date: 9/12/19
 * Time: 12:56 PM
 */

namespace App\Http\Services;

use App\Model\Order;
use App\Model\OrderDispute;
use App\Repository\MarketRepository;
use App\User;
use Illuminate\Support\Facades\Auth;

class MarketplaceService
{

    public $marketRepo;
    function __construct()
    {
        $this->marketRepo = new MarketRepository();
    }

    /**
     * @param $request
     * @return array
     */
    public function assignAdminToDispute($request)
    {
        $response = ['success' => false, 'message' => __('Something went wrong')];
        try {
            if (isset($request->dispute_id) && isset($request->assigned_admin)) {
                $dispute = OrderDispute::where(['unique_code' => $request->dispute_id])->first();
                if ($dispute) {
                    $admin = User::where(['id' => $request->assigned_admin])
                        ->where('default_module_id','<>',USER_ROLE_USER)
                        ->first();
                    if ($admin) {
                        if (empty($dispute->assigned_admin)) {
                            $dispute->update(['assigned_admin' => $admin->id]);
                            $response = ['success' => true, 'message' => __('Admin assigned to dispute successfully'), 'data' => []];

                        } else {
                            $response = ['success' => false, 'message' => __('Admin already assigned'), 'data' => []];
                        }
                    } else {
                        $response = ['success' => false, 'message' => __('Selected admin not found'), 'data' => []];
                    }
                } else {
                    $response = ['success' => false, 'message' => __('Dispute not found'), 'data' => []];
                }
            } else {
                $response = ['success' => false, 'message' => __('Please select an admin to assign'), 'data' => []];
            }
        } catch (\Exception $exception) {
            storeException('userTradeDetails', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }

    // admin cancel dispute
    public function adminCancelDisputeProcess($id)
    {
        $response = ['success' => false, 'message' => __('Something went wrong')];
        try {
            $order = Order::where(['id' => decrypt($id), 'is_reported' => STATUS_ACTIVE])->first();
            if ($order) {
                $dispute = OrderDispute::where(['order_id' => $order->id])->first();
                if ($dispute) {
                    if ($order->status ==TRADE_STATUS_ESCROW || $order->status == TRADE_STATUS_PAYMENT_DONE) {
                        $dispute->update(['status' => STATUS_DELETED, 'updated_by' => Auth::id()]);
                        $order->update(['is_reported' => STATUS_PENDING]);

                        $response = ['success' => true, 'message' => __('Dispute cancelled successfully'), 'data' => []];
                    } else {
                        $response = ['success' => false, 'message' => __('You can not cancel this dispute'), 'data' => []];
                    }
                } else {
                    $response = ['success' => false, 'message' => __('Dispute not found'), 'data' => []];
                }
            } else {
                $response = ['success' => false, 'message' => __('Order not found'), 'data' => []];
            }
        } catch (\Exception $exception) {
            storeException('userTradeDetails', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }


}
