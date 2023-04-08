<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserPaymentMethod extends Model
{
    protected $fillable = [
        'user_id', 'user_name', 'payment_method_id', 'payment_type', 'payment_method_name', 'bank_name', 'bank_account_number',
        'bank_opening_branch_name', 'transaction_reference', 'mobile_account_number', 'card_number', 'card_type',
        'status'
    ];

    public function adminPaymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class, 'payment_method_id');
    }
}
