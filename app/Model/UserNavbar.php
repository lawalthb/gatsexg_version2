<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserNavbar extends Model
{
    protected $fillable = ['default_name', 'custom_name', 'status'];
}
