<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    protected $fillable = ['name', 'payment_type', 'details', 'image', 'status','unique_code'];

    public function getImageAttribute($img){
        $p = asset('assets/img/payment.svg');
        if(!empty($img)){
            $p = asset(path_image().$img);
        }
        return $p;
    }
}
