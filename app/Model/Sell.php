<?php

namespace App\Model;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Sell extends Model
{
    protected $fillable = [
        'user_id',
        'coin_type',
        'wallet_id',
        'country',
        'address',
        'currency',
        'ip',
        'coin_rate',
        'rate_percentage',
        'status',
        'market_price',
        'rate_type',
        'price_type',
        'minimum_trade_size',
        'maximum_trade_size',
        'headline',
        'terms',
        'instruction',
        'unique_code',
        'coin_id',
        'amount',
        'sold_amount',
        'payment_time_limit',
        'registered_days',
        'kyc_completed',
        'auto_reply',
        'holding_amount',
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public static function payment($buy_id)
    {
        return OfferPaymentMethod::where(['offer_id' => $buy_id, 'offer_type' => SELL])->get();
    }
}
