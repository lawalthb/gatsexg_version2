<?php
/**
 * Created by PhpStorm.
 * User: bacchu
 * Date: 1/25/22
 * Time: 5:19 PM
 */

namespace App\Repository;

use App\Model\AdminReceiveTokenTransactionHistory;
use App\Model\DepositeTransaction;
use App\Model\EstimateGasFeesTransactionHistory;
use App\Model\Wallet;
use App\Model\WalletAddressHistory;
use App\Services\ERC20TokenApi;
use App\Services\Logger;
use App\User;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;


class CustomTokenRepository
{
    private $tokenApi;
    private $logger;
    private $settings;
    private $walletAddress;
    private $walletPk;
    private $contractCoinName;

    public function __construct()
    {
        $this->tokenApi = new ERC20TokenApi();
        $this->logger = new Logger();
        $this->settings = allsetting();
        $this->walletAddress = $this->settings['wallet_address'] ?? '';
        $this->walletPk = $this->settings['private_key'] ?? '';
        $this->contractCoinName = $this->settings['contract_coin_name'] ?? 'ETH';
    }

    public function depositCustomToken()
    {
//        DB::beginTransaction();
        try {
            $latestTransactions = $this->getLatestTransactionFromBlock();
            if ($latestTransactions['success'] == true) {
//                $count = sizeof($latestTransactions['data']);
                foreach($latestTransactions['data'] as $transaction) {
//                    $this->logger->log('$transaction ',json_encode($transaction));
                    $checkDeposit = $this->checkAddressAndDeposit($transaction->to_address,$transaction->tx_hash,$transaction->amount,$transaction->from_address);
                    if ($checkDeposit['success'] == true) {
                        // $deposit = $checkDeposit['data'];
                        // $userPk = get_wallet_personal_add($transaction->to_address,$checkDeposit['pk']);
                        // $checkGasFees = $this->checkEstimateGasFees($transaction->to_address,$transaction->amount);
                        // if($checkGasFees['success'] == true) {
                        //     $this->logger->log('Estimate gas ',$checkGasFees['data']->estimateGasFees);
                        //     $estimateFees = $checkGasFees['data']->estimateGasFees;
                        //     $gas = bcadd($estimateFees , (bcdiv(bcmul($estimateFees, 30,8),100,8)),8);
                        //     $this->logger->log('Gas',$gas);

                        //     $checkAddressBalance = $this->checkWalletAddressBalance($transaction->to_address);
                        //     if ($checkAddressBalance['success'] == true) {
                        //         $walletNetBalance = $checkAddressBalance['data']->net_balance;
                        //         $this->logger->log('$walletNetBalance',$walletNetBalance);
                        //         if ($walletNetBalance >= $gas) {
                        //             $estimateGas = 0;
                        //             $this->logger->log('$estimateGas 0 ',$estimateGas);
                        //         } else {
                        //             $estimateGas = bcsub($gas, $walletNetBalance,8);
                        //             $this->logger->log('$estimateGas have ',$estimateGas);
                        //         }
                        //         if ($estimateGas > 0) {
                        //             $this->logger->log('sendFeesToUserAddress ',$estimateGas);
                        //             $sendFees = $this->sendFeesToUserAddress($transaction->to_address,$estimateGas,$deposit->receiver_wallet_id,$deposit->id);
                        //             if ($sendFees['success'] == true) {

                        //                 $this->logger->log('depositCustomToken -> ', 'sendFeesToUserAddress success . the next process will held on getDepositBalanceFromUserJob');
                        //             } else {
                        //                 $this->logger->log('depositCustomToken', 'send fees process failed');
                        //             }
                        //         } else {
                        //             $this->logger->log('sendFeesToUserAddress ', 'no gas needed');
                        //             $checkAddressBalanceAgain2 = $this->checkWalletAddressBalance($transaction->to_address);
                        //             $this->logger->log('depositCustomToken  $checkAddressBalanceAgain2',$checkAddressBalanceAgain2);
                        //             if ($checkAddressBalanceAgain2['success'] == true) {
                        //                 $receiveToken = $this->receiveTokenFromUserAddress($transaction->to_address, $transaction->amount, $userPk, $deposit->id);
                        //                 if ($receiveToken['success'] == true) {
                        //                     $this->updateUserWallet($deposit, $receiveToken['data']->hash);
                        //                 } else {
                        //                     $this->logger->log('depositCustomToken', 'token received process failed');
                        //                 }
                        //             } else {
                        //                 $this->logger->log('depositCustomToken', 'again 2 get balance failed');
                        //             }
                        //         }
                        //     } else {
                        //         $this->logger->log('depositCustomToken', 'get balance failed');
                        //     }
                        // } else {
                        //     $this->logger->log('depositCustomToken', 'check gas fees calculate failed');
                        // }
                    }
                }
            } else {
                $this->logger->log('depositCustomToken', $latestTransactions['message']);
            }
            return $latestTransactions;
        } catch (\Exception $e) {
//            DB::rollBack();
            $this->logger->log('depositCustomToken', $e->getMessage());
        }
    }

    // update wallet
    public function updateUserWallet($deposit,$hash)
    {
        try {
            DepositeTransaction::where(['id' => $deposit->id])
                ->update([
                    'status' => STATUS_SUCCESS,
//                    'transaction_id' => $hash
                ]);
            $userWallet = $deposit->receiverWallet;
            $this->logger->log('depositCustomToken', 'before update wallet balance => '. $userWallet->balance);
            $userWallet->increment('balance',$deposit->amount);
            $this->logger->log('depositCustomToken', 'after update wallet balance => '. $userWallet->balance);
            $this->logger->log('depositCustomToken', 'update one wallet id => '. $deposit->receiver_wallet_id);
            $this->logger->log('depositCustomToken', 'Deposit process success');
        } catch (\Exception $e) {
            $this->logger->log('updateUserWallet', $e->getMessage());
        }
    }

    // check address and deposit
    public function checkAddressAndDeposit($address,$hash,$amount,$fromAddress)
    {
        try {
            $checkAddress = WalletAddressHistory::where(['address' => $address, 'coin_type' => DEFAULT_COIN_TYPE])->first();
            if(!empty($checkAddress)) {
                $checkDeposit = DepositeTransaction::where(['address' => $address, 'transaction_id' => $hash])->first();
                if ($checkDeposit) {
                    // $this->logger->log('checkAddressAndDeposit', 'deposit already in db '.$hash);
                    $response = ['success' => false, 'message' => __('This hash already in db'), 'data' => []];
                } else {
                    $amount = floatval($amount);
                    $createDeposit = DepositeTransaction::create([
                        'address' => $address,
                        'from_address' => $fromAddress,
                        'receiver_wallet_id' => $checkAddress->wallet_id,
                        'address_type' => ADDRESS_TYPE_EXTERNAL,
                        'type' => $checkAddress->coin_type,
                        'amount' => $amount,
                        'doller' => bcmul($amount,settings('coin_price'),8),
                        'transaction_id' => $hash,
                        'unique_code' => uniqid().date('').time(),
                        'coin_id' => $checkAddress->wallet->coin_id
                    ]);
                    if ($createDeposit) {
                        storeException('deposit', $createDeposit);
                        $wallet = Wallet::where(['id' => $createDeposit->receiver_wallet_id])->first();
                        if ($wallet) {
                            storeException('deposit amount', ($amount));
                            storeException('balance before', $wallet->balance);
                            $wallet->increment('balance', $amount);
                            $createDeposit->status = STATUS_ACTIVE;
                            $createDeposit->save();
                            storeException('balance after', $wallet->balance);
                        }
                        $response = ['success' => true, 'message' => __('New deposit'), 'data' => $createDeposit, 'pk' => $checkAddress->wallet_key];
                    } else {
                        $response = ['success' => false, 'message' => 'deposit credited failed', 'data' => []];
                    }
                }
            } else {
                $this->logger->log('checkAddressAndDeposit', 'address not found in db '.$address);
                $response = ['success' => false, 'message' => __('This address not found in db'), 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('checkAddressAndDeposit', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // get latest transaction block data
    public function getLatestTransactionFromBlock()
    {
        $response = ['success' => false, 'message' => 'failed', 'data' => []];
        try {
            $result = $this->tokenApi->getContractTransferEvent();
            if ($result['success'] == true) {
                $response = ['success' => $result['success'], 'message' => $result['message'], 'data' => $result['data']->result];
            } else {
                $response = ['success' => false, 'message' => __('No transaction found'), 'data' => []];
            }

        } catch (\Exception $e) {
            $this->logger->log('getLatestTransactionFromBlock', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // check estimate gas for sending token
    public function checkEstimateGasFees($address,$amount)
    {
        $response = ['success' => false, 'message' => 'failed', 'data' => []];
        try {
            $requestData = [
                "amount_value" => $amount,
                "from_address" => $address,
                "to_address" => $this->walletAddress
            ];
            $this->logger->log('checkEstimateGasFees', json_encode($requestData));

            $check = $this->tokenApi->checkEstimateGas($requestData);
            $this->logger->log('checkEstimateGasFees', $check);
            if ($check['success'] == true) {
                $response = ['success' => true, 'message' => $check['message'], 'data' => $check['data']];
            } else {
                $response = ['success' => false, 'message' => $check['message'], 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('checkEstimateGasFees', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }

        return $response;
    }

    // send estimate gas fees to address
    public function sendFeesToUserAddress($address,$amount,$wallet_id,$depositId)
    {
        try {
            $requestData = [
                "amount_value" => $amount,
                "from_address" => $this->walletAddress,
                "to_address" => $address,
                "contracts" => $this->walletPk
            ];

            $result = $this->tokenApi->sendEth($requestData);
            $this->logger->log('sendFeesToUserAddress result ', $result);
            if ($result['success'] == true) {
                $this->saveEstimateGasFeesTransaction($wallet_id,$result['data']->hash,$amount,$this->walletAddress,$address,$depositId);
                $response = ['success' => true, 'message' => __('Fess send successfully'), 'data' => []];
            } else {
                $this->logger->log('sendFeesToUserAddress', $result['message']);
                $response = ['success' => false, 'message' => $result['message'], 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('sendFeesToUserAddress', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // save estimate gas fees transaction
    public function saveEstimateGasFeesTransaction($wallet_id,$hash,$amount,$adminAddress,$userAddress,$depositId)
    {
        try {
            $data = EstimateGasFeesTransactionHistory::create([
                'unique_code' => uniqid().date('').time(),
                'wallet_id' => $wallet_id,
                'deposit_id' => $depositId,
                'amount' => $amount,
                'coin_type' => $this->contractCoinName,
                'admin_address' => $adminAddress,
                'user_address' => $userAddress,
                'transaction_hash' => $hash,
                'status' => STATUS_PENDING
            ]);
            $this->logger->log('saveEstimateGasFeesTransaction', json_encode($data));
        } catch (\Exception $e) {
            $this->logger->log('saveEstimateGasFeesTransaction', $e->getMessage());
        }
    }

    // receive token from user address
    public function receiveTokenFromUserAddress($address,$amount,$userPk,$depositId)
    {
        try {
            $requestData = [
                "amount_value" => $amount,
                "from_address" => $address,
                "to_address" => $this->walletAddress,
                "contracts" => $userPk
            ];

            $checkAddressBalanceAgain = $this->checkWalletAddressAllBalance($address);
            $this->logger->log('receiveTokenFromUserAddress  $check Address All Balance ',$checkAddressBalanceAgain);

            $result = $this->tokenApi->sendCustomToken($requestData);
            $this->logger->log('receiveTokenFromUserAddress $result', $result);
            if ($result['success'] == true) {
                $this->saveReceiveTransaction($result['data']->used_gas,$result['data']->hash,$amount,$this->walletAddress,$address,$depositId);
                $response = ['success' => true, 'message' => __('Token received successfully'), 'data' => $result['data']];
            } else {
                $this->logger->log('receiveTokenFromUserAddress', $result['message']);
                $response = ['success' => false, 'message' => $result['message'], 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('receiveTokenFromUserAddress', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // save receive token transaction
    public function saveReceiveTransaction($fees,$hash,$amount,$adminAddress,$userAddress,$depositId)
    {
        try {
            $data = AdminReceiveTokenTransactionHistory::create([
                'unique_code' => uniqid().date('').time(),
                'amount' => $amount,
                'deposit_id' => $depositId,
                'fees' => $fees,
                'to_address' => $adminAddress,
                'from_address' => $userAddress,
                'transaction_hash' => $hash,
                'status' => STATUS_SUCCESS
            ]);
            $this->logger->log('saveReceiveTransaction', json_encode($data));
        } catch (\Exception $e) {
            $this->logger->log('saveReceiveTransaction', $e->getMessage());
        }
    }

    // check wallet balance
    public function checkWalletAddressBalance($address)
    {
        try {
            $requestData = array(
                "type" => 1,
                "address" => $address,
            );
            $result = $this->tokenApi->checkWalletBalance($requestData);
            if ($result['success'] == true) {
                $response = ['success' => true, 'message' => __('Get balance'), 'data' => $result['data'] ];
            } else {
                $this->logger->log('sendFeesToUserAddress', $result['message']);
                $response = ['success' => false, 'message' => $result['message'], 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('checkWalletAddressBalance', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // check wallet balance
    public function checkWalletAddressAllBalance($address)
    {
        try {
            $requestData = array(
                "type" => 3,
                "address" => $address,
            );
            $result = $this->tokenApi->checkWalletBalance($requestData);
            if ($result['success'] == true) {
                $response = ['success' => true, 'message' => __('Get balance'), 'data' => $result['data'] ];
            } else {
                $this->logger->log('sendFeesToUserAddress', $result['message']);
                $response = ['success' => false, 'message' => $result['message'], 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('checkWalletAddressBalance', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // token receive manually by admin
    public function tokenReceiveManuallyByAdmin($transaction,$adminId)
    {
        try {
            if ($transaction->is_admin_receive == STATUS_PENDING) {
                $this->tokenReceiveManuallyByAdminProcess($transaction,$adminId);
            }
        } catch (\Exception $e) {
            $this->logger->log('tokenReceiveManuallyByAdmin', $e->getMessage());
        }
    }

    // token Receive Manually By Admin process
    public function tokenReceiveManuallyByAdminProcess($transaction,$adminId)
    {
        try {
            if ($transaction->is_admin_receive == STATUS_PENDING) {
                $sendAmount = (float)$transaction->amount;
                $checkAddress = $this->checkAddress($transaction->address);
                $userPk = get_wallet_personal_add($transaction->address,$checkAddress->pk);
                if (settings('network_type') == TRC20_TOKEN) {
                    $checkGasFees['success'] = true;
                    $gas = TRC20ESTFEE;
                } else {
                    $checkGasFees = $this->checkEstimateGasFees($transaction->address, $sendAmount);
                }
                if($checkGasFees['success'] == true) {
                    if (settings('network_type') != TRC20_TOKEN) {
                        $this->logger->log('Estimate gas ',$checkGasFees['data']->estimateGasFees);
                        $estimateFees = $checkGasFees['data']->estimateGasFees;
                        $gas = bcadd($estimateFees , (bcdiv(bcmul($estimateFees, 10,8),100,8)),8);
                        $this->logger->log('Gas',$gas);
                    }
                    $checkAddressBalance = $this->checkWalletAddressBalance($transaction->address);
                    if ($checkAddressBalance['success'] == true) {
                        $walletNetBalance = $checkAddressBalance['data']->net_balance;
                        $this->logger->log('$walletNetBalance',$walletNetBalance);
                        if ($walletNetBalance >= $gas) {
                            $estimateGas = 0;
                            $this->logger->log('$estimateGas 0 ',$estimateGas);
                        } else {
                            $estimateGas = bcsub($gas, $walletNetBalance,8);
                            $this->logger->log('$estimateGas have ',$estimateGas);
                        }
                        if ($estimateGas > 0) {
                            $this->logger->log('sendFeesToUserAddress ',$estimateGas);
                            $sendFees = $this->sendFeesToUserAddress($transaction->address,$estimateGas,$checkAddress->wallet_id,$transaction->id);
                            if ($sendFees['success'] == true) {
                                $this->logger->log('tokenReceiveManuallyByAdminProcess -> ', 'sendFeesToUserAddress success . the next process will held on getDepositBalanceFromUserJob');

                            } else {
                                $this->logger->log('tokenReceiveManuallyByAdminProcess', 'send fees process failed');
                            }
                        } else {
                            $this->logger->log('sendFeesToUserAddress ', 'no gas needed');
                            $checkAddressBalanceAgain2 = $this->checkWalletAddressBalance($transaction->address);
                            $this->logger->log('tokenReceiveManuallyByAdminProcess  $checkAddressBalanceAgain2',$checkAddressBalanceAgain2);
                            if ($checkAddressBalanceAgain2['success'] == true) {
                                storeException('tokenReceiveManuallyByAdminProcess', 'next process goes to AdminTokenReceiveJob queue');
                            } else {
                                $this->logger->log('tokenReceiveManuallyByAdminProcess', 'again 2 get balance failed');
                            }
                        }

                        $receiveToken = $this->receiveTokenFromUserAddressByAdminPanel($transaction->address, $sendAmount, $userPk, $transaction->id);
                        if ($receiveToken['success'] == true) {
                            $this->updateUserWalletByAdmin($transaction, $adminId);
                        } else {
                            $this->logger->log('tokenReceiveManuallyByAdminProcess', 'token received process failed');
                        }

                    } else {
                        $this->logger->log('tokenReceiveManuallyByAdminProcess', 'get balance failed');
                    }
                } else {
                    $this->logger->log('tokenReceiveManuallyByAdminProcess', 'check gas fees calculate failed');
                }
            } else {
                $this->logger->log('tokenReceiveManuallyByAdminProcess', 'transaction is not pending');
            }
        } catch (\Exception $e) {
            $this->logger->log('tokenReceiveManuallyByAdminProcess', $e->getMessage());
        }
    }

    // check address
    public function checkAddress($address)
    {
        return WalletAddressHistory::where(['address' => $address, 'coin_type' => DEFAULT_COIN_TYPE])->first();
    }

    // receive token from user address by admin
    public function receiveTokenFromUserAddressByAdminPanel($address,$amount,$userPk,$depositId)
    {
        try {
            $requestData = [
                "amount_value" => $amount,
                "from_address" => $address,
                "to_address" => $this->walletAddress,
                "contracts" => $userPk
            ];

            $checkAddressBalanceAgain = $this->checkWalletAddressAllBalance($address);
            $this->logger->log('receiveTokenFromUserAddressByAdminPanel  $check Address All Balance ',$checkAddressBalanceAgain);

            $result = $this->tokenApi->sendCustomToken($requestData);
            $this->logger->log('receiveTokenFromUserAddressByAdminPanel $result', $result);
            if ($result['success'] == true) {
                $this->saveReceiveTransaction($result['data']->used_gas,$result['data']->hash,$amount,$this->walletAddress,$address,$depositId);
                $response = ['success' => true, 'message' => __('Token received successfully'), 'data' => $result['data']];
            } else {
                $this->logger->log('receiveTokenFromUserAddressByAdminPanel', $result['message']);
                $response = ['success' => false, 'message' => $result['message'], 'data' => []];
            }
        } catch (\Exception $e) {
            $this->logger->log('receiveTokenFromUserAddressByAdminPanel', $e->getMessage());
            $response = ['success' => false, 'message' => $e->getMessage(), 'data' => []];
        }
        return $response;
    }

    // update wallet
    public function updateUserWalletByAdmin($deposit,$adminId)
    {
        try {
            DepositeTransaction::where(['id' => $deposit->id])
                ->update([
                    'is_admin_receive' => STATUS_SUCCESS,
                    'received_amount' => $deposit->amount,
                    'updated_by' => $adminId
                ]);
            $this->logger->log('updateUserWalletByAdmin', 'Deposit process success');
        } catch (\Exception $e) {
            $this->logger->log('updateUserWalletByAdmin', $e->getMessage());
        }
    }


    // get deposit token balance from user
    public function getDepositTokenFromUser()
    {
        $this->logger->log('getDepositTokenFromUser', 'called');
        try {
            $adminId = 1;
            $admin = User::where(['role' => USER_ROLE_ADMIN])->orderBy('id', 'asc')->first();
            if ($admin) {
                $adminId = $admin->id;
            }
            $transactions = DepositeTransaction::where(['deposite_transactions.address_type' => ADDRESS_TYPE_EXTERNAL])
                ->where('deposite_transactions.is_admin_receive', STATUS_PENDING)
                ->where('deposite_transactions.type', DEFAULT_COIN_TYPE)
                ->select('deposite_transactions.*')
                ->get();
            if (isset($transactions[0])) {
                foreach ($transactions as $transaction) {
                    $this->tokenReceiveManuallyByAdmin($transaction, $adminId);
                }
            }
        } catch (\Exception $e) {
            $this->logger->log('getDepositTokenFromUser', $e->getMessage());
        }
    }

}
