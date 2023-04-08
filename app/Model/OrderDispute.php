<?php

namespace App\Model;

use App\User;
use Illuminate\Database\Eloquent\Model;

class OrderDispute extends Model
{
    protected $fillable = [
        'order_id',
        'user_id',
        'reported_user',
        'reason_heading',
        'details',
        'status',
        'updated_by',
        'image',
        'type',
        'unique_code',
        'assigned_admin',
        'expired_at'
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function reporting_user()
    {
        return $this->belongsTo(User::class,'reported_user');
    }

    public function admin()
    {
        return $this->belongsTo(User::class, 'assigned_admin');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

}
