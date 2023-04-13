<?php

namespace App\Http\Controllers;

use App\Model\Wallet;
use App\Jobs\MailSend;
use Illuminate\Http\Request;
use App\Model\DepositeTransaction;
use Illuminate\Support\Facades\DB;
use App\Model\WalletAddressHistory;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;

class WebhookController extends Controller
{
    //

    public function coin_remitter_webhook(Request $request)
    {
        // return $request->all();

        Log::info($request->all());
        $coin_type = $request->coin_short_name;
        $transaction_type = $request->type;
        $trans_id = $request->txid;
        $address = $request->address;
        $amount = $request->amount;
        $confirmations = $request->confirmations;
        $transaction_type = $request->type;
        $transaction_status = $confirmations == 3 ? STATUS_SUCCESS : STATUS_PENDING;

        $wallet_exists = WalletAddressHistory::where(['address' => $address, 'coin_type' => $coin_type ]);

        if($transaction_type == 'receive'){
            // return     $wallet_data = $wallet_exists->first();
            if($wallet_exists->exists()){
                $transaction_exists = DepositeTransaction::where('transaction_id', $trans_id);
                $wallet_data = $wallet_exists->first();
                if($transaction_exists->exists()){
                    $wallet = Wallet::join('coins', 'coins.id', '=', 'wallets.coin_id')
                    ->where(['wallets.id' => $wallet_data->wallet_id])
                    ->select('wallets.*', 'coins.name as coin_name', 'coins.status as coin_status', 'coins.is_withdrawal', 'coins.minimum_withdrawal',
                        'coins.maximum_withdrawal', 'coins.withdrawal_fees', 'coins.max_withdrawal_per_day')
                    ->first();

                    $receiverUser = $wallet->user;
                    
                    $transaction_exists =$transaction_exists->first();

                    $transaction = DepositeTransaction::find($transaction_exists->id);
                    $transaction->confirmations = $confirmations;
                    $transaction->status = $transaction_status;
                    $transaction->save();

                    if($confirmations == 3 && $transaction_exists->confirmations != 3){

                        $wallet->increment('balance', $amount);
                        $this->wallet_function( $receiverUser, $amount, $wallet->coin_name, $address, $trans_id );
                    }
                    return 'receive processed existing';
                }else{

                    $wallet = Wallet::join('coins', 'coins.id', '=', 'wallets.coin_id')
                        ->where(['wallets.id' => $wallet_data->wallet_id])
                        ->select('wallets.*', 'coins.name as coin_name', 'coins.status as coin_status', 'coins.is_withdrawal', 'coins.minimum_withdrawal',
                            'coins.maximum_withdrawal', 'coins.withdrawal_fees', 'coins.max_withdrawal_per_day')
                        ->first();
                   $receiverUser = $wallet->user;
                    $receiverWallet = Wallet::find($wallet->id);
    
                    $coin_name = $wallet->coin_name;
                    
                    $address_type = ADDRESS_TYPE_EXTERNAL;
    
                    $fees = 0;//check_withdrawal_fees($amount, $wallet->withdrawal_fees);
    
                    // DB::beginTransaction();
    
    
                    try {
    
                        $transactionArray = [
                            'address' => $address,
                            'address_type' => $address_type,
                            'amount' => $amount,
                            'fees' => $fees,
                            'type' => $wallet->coin_type,
                            'coin_id' => $wallet->coin_id,
                            'transaction_id' => $trans_id,
                            'confirmations' => $confirmations,
                            'status' => $transaction_status,
                            'sender_wallet_id' => 0,
                            'receiver_wallet_id' => $wallet->id
                        ];
                        $receive_tr =  DepositeTransaction::create($transactionArray);
                        
                        if($confirmations == 3){

                            $wallet->increment('balance', $amount);
                            $this->wallet_function( $receiverUser, $amount, $coin_name,$address, $trans_id );
                        }
    
                    } catch (\Exception $e) {
                        // DB::rollBack();
                        Log::info($e->getMessage());
                    }
                    return 'receive processed new';
                }
            }
            return 'receive';
        }
        return 'send';
    }

    public function wallet_function($receiverUser, $amount, $coin_name, $address,  $trans_id)
    {
        try{
            $mail_info = [];
            $mail_info['mailTemplate'] = 'email.transaction_mail';
            $mail_info['to'] = $receiverUser->email;
            $mail_info['name'] = $receiverUser->first_name.' '.$receiverUser->last_name;
            $mail_info_address_type = 'External';
            $withdraw_status = 'Successful';
            $mail_info['email_message']="$amount $coin_name deposit placed successfully. Transaction Information given below:";
            $mail_info['email_message_table'] = "<table>
                <tbody>
                    <tr>
                        <td>Receiver Address</td>
                        <td>$address</td>
                    </tr>
                    <tr>
                        <td>Address Type</td>
                        <td>$mail_info_address_type</td>
                    </tr>
                    <tr>
                        <td>TransactionID</td>
                        <td>$trans_id</td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>$amount $coin_name</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>$withdraw_status</td>
                    </tr>
                </tbody>
            </table>";


            $short_trxid = substr($trans_id, 0, 10) . '...';
            $mail_info['subject'] = "TransactionID:<$trans_id> Deposit ($amount $coin_name) placed successfully.";
            dispatch(new MailSend($mail_info))->onQueue('send-mail-deposit');
        }catch(\Exception $e){
            Log::info($e->getMessage());
        }
    }
}