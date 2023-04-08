<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TradeCancelRequest extends FormRequest
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
        return [
            'order_id' => 'required',
            'type' => 'required',
            'reason' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'order_id.required' => __('Order id can not be empty'),
            'type.required' => __('Type can not be empty'),
            'reason.required' => __('Reason can not be empty'),
        ];
    }
}
