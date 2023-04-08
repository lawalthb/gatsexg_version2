<?php
namespace App\Repository;

use App\Model\UserPaymentMethod;
use Illuminate\Support\Facades\Auth;

class UserPaymentMethodRepository{

    public function getPaymentMethodList()
    {
        $user = Auth::user();
        $userPaymentMethodList = UserPaymentMethod::where('user_id',$user->id)->get();
        return $userPaymentMethodList;
    }
    public function userPaymentMethodSave($request)
    {
        $user = Auth::user();
        $checkPaymentMethod = UserPaymentMethod::where('user_id',$user->id)->where('payment_method_id',$request->payment_method_id)->first();
        if(isset($checkPaymentMethod))
        {
            $response = ['success' => false, 'message' => __('You have already this payment method!')];
            return $response;
        }

        if(isset($request->id))
        {
            $userPaymentMethod = UserPaymentMethod::where('user_id',$user->id)->where('id',$request->id)->first();
            $response = ['success' => true, 'message' => __('Payment method updated successfully!')];
        }else{
            $userPaymentMethod = new UserPaymentMethod; 
            $response = ['success' => true, 'message' => __('New Payment method created successfully!')];
        }
        $userPaymentMethod->user_id = $user->id;
        $userPaymentMethod->user_name = $request->user_name;
        $userPaymentMethod->payment_method_id = $request->payment_method_id;
        $userPaymentMethod->payment_type = $request->payment_type;
        $userPaymentMethod->payment_method_name = $request->payment_method_name;
        $userPaymentMethod->bank_name = $request->bank_name;
        $userPaymentMethod->bank_account_number = $request->bank_account_number;
        $userPaymentMethod->bank_opening_branch_name = $request->bank_opening_branch_name;
        $userPaymentMethod->transaction_reference = $request->transaction_reference;
        $userPaymentMethod->mobile_account_number = $request->mobile_account_number;
        $userPaymentMethod->card_number = $request->card_number;
        $userPaymentMethod->card_type = $request->card_type;
        $userPaymentMethod->status = $request->status;
        $userPaymentMethod->save();

        
        return $response;
    }

    public function userPaymentMethodEdit($id)
    {
        $user = Auth::user();
        $userPaymentMethodDetails = UserPaymentMethod::where('user_id',$user->id)->where('id',$id)->first();

        return $userPaymentMethodDetails;
    }

    public function userPaymentMethodDeleteByID($id)
    {
        $user = Auth::user();
        $userPaymentMethodDetails = UserPaymentMethod::where('user_id',$user->id)->where('id',$id)->first();
        $userPaymentMethodDetails->delete();
        $response = ['success' => true, 'message' => __('Payment method deleted successfully!')];
        return $response;
    }

}