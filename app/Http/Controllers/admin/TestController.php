<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class TestController extends Controller
{
    //
    public function adminTest()
    {
        $a = convert_currency(1,'BDT','BTC');
        dd($a);
    }
}
