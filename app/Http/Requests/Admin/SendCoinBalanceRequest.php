<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class SendCoinBalanceRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->role == USER_ROLE_ADMIN ? true : false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
            'amount' => 'required|numeric|gt:0|max:99999999',
            'wallet_id' => 'required'
        ];

        return $rules;
    }

    public function messages()
    {
        $messages = [
            'amount.required'=>__('Amount field is required'),
            'wallet_id.required'=> __('Select minimum one user wallet')
        ];
        
        return $messages;
    }
}
