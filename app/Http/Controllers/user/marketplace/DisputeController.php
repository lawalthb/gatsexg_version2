<?php

namespace App\Http\Controllers\user\marketplace;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Services\TradeService;
use Illuminate\Support\Facades\Auth;

class DisputeController extends Controller
{
    private $service;
    function __construct()
    {
        $this->service = new TradeService();
    }
    // dispute details
    public function disputeDetails(Request $request, $id)
    {
        $response = $this->service->tradeDisputeDetails($request, $id, Auth::id());
        // dd($response);
        if ($response['success'] == true) {
            return view('user.marketplace.market.dispute.details', $response['data']);
        } else {
            return redirect()->back()->with('dismiss', $response['message']);
        }
    }
}
