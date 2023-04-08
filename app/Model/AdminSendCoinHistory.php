<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AdminSendCoinHistory extends Model
{
    protected $fillable = [
        'user_id',
        'wallet_id',
        'amount',
        'updated_by'
    ];
}
