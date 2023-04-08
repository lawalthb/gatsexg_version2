<?php

namespace App\Http\Controllers\user;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\UserPaymentMethodRequest;
use App\Http\Services\UserPaymentMethodService;
use App\Model\PaymentMethod;
use App\Model\CountryPaymentMethod;
use Illuminate\Support\Facades\Auth;

class UserPaymentMethodController extends Controller
{
    private $userPaymentMethodService;

    public function __construct()
    {
        $this->userPaymentMethodService = new UserPaymentMethodService;
    }

    public function userPaymentMethodList()
    {
        $user = Auth::user();
        $data['title'] = __('Payment Method List');
        $data['user_payment_method_list'] = $this->userPaymentMethodService->getPaymentMethodList();
        $accessPaymentMethodIDs = CountryPaymentMethod::where('country', $user->country)->pluck('payment_method_id')->toArray();
        
        $data['admin_payment_method_list'] = PaymentMethod::where('status', STATUS_ACTIVE)->whereIn('id',$accessPaymentMethodIDs)->orderBy('id','Desc')->get();
        return view('user.payment-method.settings', $data);
    }
    public function userPaymentMethodSave(UserPaymentMethodRequest $request)
    {
        $response = $this->userPaymentMethodService->userPaymentMethodSave($request);
        if($response['success'] == true)
        {
           return redirect()->route('userPaymentMethodList')->with(['success' => $response['message']]);
        }else{
            return back()->with(['dismiss' => $response['message']]);
        }
    }

    public function userPaymentMethodEdit($id)
    {   
        $user = Auth::user();
        $data['title'] = __('Update Payment Method');
        $data['user_payment_method_list'] = $this->userPaymentMethodService->getPaymentMethodList();
        $accessPaymentMethodIDs = CountryPaymentMethod::where('country', $user->country)->pluck('payment_method_id')->toArray();
        
        $data['admin_payment_method_list'] = PaymentMethod::where('status', STATUS_ACTIVE)->whereIn('id',$accessPaymentMethodIDs)->orderBy('id','Desc')->get();
        $data['payment_method_details'] = $this->userPaymentMethodService->userPaymentMethodEdit(decrypt($id));

        return view('user.payment-method.settings', $data);
       
    }

    public function userPaymentMethodDelete($id)
    {
        $response = $this->userPaymentMethodService->userPaymentMethodDeleteByID(decrypt($id));
        return redirect()->route('userPaymentMethodList')->with(['success' => $response['message']]);
    }

    public function getPaymentMethodType(Request $request)
    {
        $paymentMethod = PaymentMethod::find($request->id);
        if(isset($paymentMethod))
        {
            $data['paymentMethodType'] = $paymentMethod->payment_type;
            $data['paymentMethodName'] = $paymentMethod->name;
            $response = ['success'=>true,'message'=>__('Payment Method Type'),'data'=>$data];
            
        }else{
            $response = ['success'=>false,'message'=>__('Payment Method not found')];
            
        }
        return response()->json($response);
    }

}
