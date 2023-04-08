<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UploadSleepRequest extends FormRequest
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
            'payment_sleep' => 'required|mimes:jpeg,png,jpg,JPG,PNG,JPEG|max:2048',
        ];
    }

    public function messages()
    {
        return [
            'payment_sleep.required' => __('Payment Sleep is required'),
            'payment_sleep.mimes' => __('Payment Sleep must be ( jpeg,png,jpg,JPG,PNG,JPEG )'),
            'payment_sleep.max' => __('Payment Sleep max size is 2048'),
        ];
    }

}
