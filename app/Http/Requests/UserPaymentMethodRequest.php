<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;
use Illuminate\Contracts\Validation\Validator;
use App\Model\PaymentMethod;
use App\Model\UserPaymentMethod;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class UserPaymentMethodRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        
        $rules = [
            'payment_method_id' => 'required',
            'payment_method_name' => 'required',
            'user_name' => 'required'
        ];
        
        
        if(!empty($this->payment_method_id)) {
            $paymentMethodType = PaymentMethod::find($this->payment_method_id);
            if($paymentMethodType->payment_type == PAYMENT_TYPE_BANK)
            {
                $rules['bank_name'] = 'required';
                $rules['bank_account_number'] = ['required',Rule::unique('user_payment_methods')->ignore($this->id, 'id')];
                $rules['bank_account_number'] = 'required';
            }else if($paymentMethodType->payment_type == PAYMENT_TYPE_MOBILE_ACCOUNT)
            {
                $rules['mobile_account_number'] = ['required',Rule::unique('user_payment_methods')->ignore($this->id, 'id')];
            }else if($paymentMethodType->payment_type == PAYMENT_TYPE_CARD)
            {
                $rules['card_number'] = ['required',Rule::unique('user_payment_methods')->ignore($this->id, 'id')];
                $rules['card_type'] = 'required';
            }
        }

        return $rules;
    }

    public function messages()
    {
        return  [
            'payment_method_id.required' => __('Please, choose a payment method type!')
            ];
    }

    protected function failedValidation(Validator $validator)
    {
        if ($this->header('accept') == "application/json") {
            $errors = [];
            if ($validator->fails()) {
                $e = $validator->errors()->all();
                foreach ($e as $error) {
                    $errors[] = $error;
                }
            }
            $json = [
                'success'=>false,
                'data'=>null,
                'message' => $errors[0],
            ];
            $response = new JsonResponse($json, 200);

            throw (new ValidationException($validator, $response))->errorBag($this->errorBag)->redirectTo($this->getRedirectUrl());
        } else {
            throw (new ValidationException($validator))
                ->errorBag($this->errorBag)
                ->redirectTo($this->getRedirectUrl());
        }

    }
}
