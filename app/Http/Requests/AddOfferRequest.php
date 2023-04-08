<?php

namespace App\Http\Requests;

use App\Model\Coin;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Log;

class AddOfferRequest extends FormRequest
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
        $rule = [
            'offer_type' => 'required|in:1,2',
            'coin_type' => 'required|exists:coins,type',
            'country' => 'required',
            'currency' => 'required',
            'rate_type' => 'required|in:1,2',
            'payment_methods' => 'required_without:edit_id',
            'total_amount' => 'required|gt:0|numeric'
        ];

        if ($this->rate_type == RATE_TYPE_DYNAMIC) {
            $rule['price_type'] = 'required|in:1,2';
            $rule['rate_percentage'] = 'required|numeric|min:0.0001|max:100';
        } else {
            $rule['coin_rate'] = 'required|numeric|min:0.00000001';
        }
        if($this->coin_type) {
            $coin = Coin::where('type', $this->coin_type)->first();
            $rule['minimum_trade_size'] = 'required|integer|min:'.$coin->minimum_trade_size;
            $rule['maximum_trade_size'] = 'required|integer|max:'.$coin->maximum_trade_size;
            if($this->coin_type == DEFAULT_COIN_TYPE && $this->rate_type == RATE_TYPE_DYNAMIC) {
                $rule['rate_type'] = 'required|in:2';
            }
        }
        $rule['headline'] = 'required';
        if($this->payment_time) {
            $rule['payment_time'] = 'integer|gt:0';
        }
        if($this->user_register_past_day_check) {
            $rule['user_register_past_days'] = 'required|integer|gt:0';
        }
        if($this->user_holding_amount_check) {
            $rule['user_holding_amount'] = 'required|numeric|gt:0';
        }

        return $rule;
    }

    public function messages()
    {
        $message = [
            'offer_type.required' => __('Please select a trade type Buy or Sell'),
            'coin_type.required' => __('Please select a coin type'),
            'country.required' => __('Please select a country'),
            'payment_methods.required_without' => __('Please select at least one payment method'),
            'currency.required' => __('Please select a currency'),
            'rate_type.required' => __('Please select coin rate type, dynamic or static'),
            'price_type.required' => __('Please select percentage type above or below'),
            'rate_percentage.required' => __('Percentage is required'),
            'market_price.required' => __('Static market price is required'),
        ];
        if($this->coin_type == DEFAULT_COIN_TYPE && $this->rate_type == RATE_TYPE_DYNAMIC) {
            $message['rate_type'] = __('For the ').settings('coin_name').__(' coin , only you can select static rate type');
        }

        return $message;
    }
}
