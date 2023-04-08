<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\SendCoinBalanceRequest;
use App\Model\Wallet;
use App\Http\Services\WalletService;
use App\Model\AdminSendCoinHistory;

class WalletController extends Controller
{
    private $service;
    function __construct()
    {
        $this->service =  new WalletService();
    }
    public function adminSendWallet()
    {
        $data['title'] = __('Send Wallet Coin'); 
        $data['wallets'] = Wallet::join('users','users.id','=','wallets.user_id')
                ->join('coins', 'coins.id', '=', 'wallets.coin_id')
                ->where(['wallets.type'=>PERSONAL_WALLET, 'coins.status' => STATUS_ACTIVE])
                ->select(
                    'wallets.*'
                    ,'users.first_name'
                    ,'users.last_name'
                    ,'users.email'
                )
                ->get();   

        return view('admin.wallet.send-wallet-coin',$data);
    }
    // admin send coin process
    public function adminSendBalanceProcess(SendCoinBalanceRequest $request)
    {
        $response = $this->service->sendCoinBalanceToUser($request);
        if($response['success'] == true) {
            return redirect()->back()->with('success', $response['message']);
        } else {
            return redirect()->back()->with('dismiss', $response['message']);
        }
    }

    // send coin wallet list
    public function adminWalletSendcoinHistory(Request $request)
    {
        $data['title'] = __('Send Coin List');
        $data['sub_menu'] = __('send_coin_list');
        if($request->ajax()){
            $data['wallets'] = AdminSendCoinHistory::join('wallets','wallets.id','=','admin_send_coin_histories.wallet_id')
                ->join('users', 'users.id', '=', 'admin_send_coin_histories.user_id')
                ->orderBy('admin_send_coin_histories.id', 'desc')
                ->select(
                    'wallets.name'
                    ,'wallets.coin_type'
                    ,'wallets.balance'
                    ,'admin_send_coin_histories.created_at'
                    ,'users.first_name'
                    ,'users.last_name'
                    ,'users.email',
                    'admin_send_coin_histories.amount'
                );

            return datatables()->of($data['wallets'])
                ->addColumn('coin_type', function ($item) {return $item->coin_type;})
                ->addColumn('user_name',function ($item){return $item->first_name.' '.$item->last_name;})
                ->addColumn('created_at', function ($item) {return $item->created_at;})
                ->make(true);
        }

        return view('admin.wallet.send_coin_history',$data);
    }
}
