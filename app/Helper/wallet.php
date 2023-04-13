<?php

use \GuzzleHttp\Client as ApiClient;
use Illuminate\Support\Facades\Log;

const coin_remitter_api_base_url = 'https://coinremitter.com/api/v3/';

const coin_remitter_btc_api_key = '$2y$10$872RlKvZqpemYLJJYqll/u6rzAiHzBee8Af8Cxox0HAF/H6q1569i';
const coin_remitter_btc_password = 'GatsExgBTC9229@';

const coin_remitter_tcn_api_key = '$2y$10$weMXU88NRLYTn4Yj9CFPQuHy93JK4K6cyEFKJtU7/.C0OShQAeJDu';
const coin_remitter_tcn_password = 'GatsExgBaba';

const coin_remitter_eth_api_key = '$2y$10$YR.rCljb291HoREyK1OS4.pDUF78/wDYfznmasTKjV.M6nhBnhxJW';
const coin_remitter_eth_password = 'GatsExgEth9229@';

const coin_remitter_usdttrc20_api_key = '$2y$10$/.D4HXy2WYNBQHymuDBNxOWCh7XQGrNHS/QXBK/ObpbiZtSzS3W';
const coin_remitter_usdttrc20_password = 'GatsExgUSDT20@';

const coin_remitter_usdterc20_api_key = '$2y$10$ESK7AcaEpVpZ4lyVpiQJ1.KbfFHwR8nAPJJj0CGdWtdSCpgCVLLGC';
const coin_remitter_usdterc20_password = 'GatsExgUSDE20@';


if (!function_exists('coin_remitter_api_client')) {
    function coin_remitter_api_client($url, $params, $type)
    {
        ini_set('memory_limit', '8192M');
        $custom_response = new StdClass;
        $allowed_types = ['btc', 'tcn', 'eth', 'usdttrc20', 'usdterc20'];

        if (!in_array($type, $allowed_types)) {
            $custom_response->status = false;
            $custom_response->message = 'Unable to perform actions for this coin yet';
            return $custom_response;
        }

        if ($type == 'btc') {
            $params['api_key'] = coin_remitter_btc_api_key;
            $params['password'] = coin_remitter_btc_password;
        }

        if ($type == 'tcn') {
            $params['api_key'] = coin_remitter_tcn_api_key;
            $params['password'] = coin_remitter_tcn_password;
        }

        if ($type == 'eth') {
            $params['api_key'] = coin_remitter_eth_api_key;
            $params['password'] = coin_remitter_eth_password;
        }

        if ($type == 'usdttrc20') {
            $params['api_key'] = coin_remitter_usdttrc20_api_key;
            $params['password'] = coin_remitter_usdttrc20_password;
        }

        if ($type == 'usdterc20') {
            $params['api_key'] = coin_remitter_usdterc20_api_key;
            $params['password'] = coin_remitter_usdterc20_password;
        }

        // print_r($params);
        $api_client = new ApiClient();
        try {
            // $api_client->setDefaultOption('headers', array('Accept' => 'application/json'));
            $response = $api_client->post($url, ['form_params' => $params]);
            if ($response->getStatusCode() === 200) {
                $res = json_decode($response->getBody()->getContents());
                if ($res->flag === 1) {
                    $custom_response->status = true;
                    $custom_response->message = $res->msg;
                    $custom_response->data = $res->data;
                } else {
                    $custom_response->status = false;
                    $custom_response->message = $res->msg;
                    $custom_response->data = $res->data;
                }
            } else {
                $custom_response->status = false;
                $custom_response->message = 'Request failed!';
            }
        } catch (\Exception $e) {
            $custom_response->status = false;
            $custom_response->message = env('APP_DEBUG') == true ? $e->getMessage() : 'Error making this request';
            Log::debug([
                'triggered_by' => 'coin remitter api request', 'exception' => $e
            ]);
        }

        return $custom_response;
    }
}


if (!function_exists('coin_remitter_validate_wallet')) {
    function coin_remitter_validate_wallet($type, $address)
    {
        $url = coin_remitter_api_base_url . strtoupper($type) . '/validate-address';
        $params = [
            'address' => $address
        ];

        $response =  coin_remitter_api_client($url, $params, $type);

        if ($response->status == true && $response->data->valid == true) {
            $response->valid_wallet = true;
        } else {
            $response->valid_wallet = false;
        }

        return $response;
    }
}

if (!function_exists('coin_remitter_create_wallet')) {
    function coin_remitter_create_wallet($type, $label = '')
    {
        $url = coin_remitter_api_base_url . strtoupper($type) . '/get-new-address';
        $params = [
            'label' => $label
        ];

        $response =  coin_remitter_api_client($url, $params, $type);

        if ($response->status == true) {
            $response->address = $response->data->address;
            $response->label = $response->data->label;
        } else {
            $response->address = false;
        }

        return $response;
    }
}

if (!function_exists('coin_remitter_withdraw')) {
    function coin_remitter_withdraw($type, $amount, $receiver_wallet_address)
    {
        $url = coin_remitter_api_base_url . strtoupper($type) . '/withdraw';
        $params = [
            'to_address' => $receiver_wallet_address,
            'amount' => $amount
        ];

        $response =  coin_remitter_api_client($url, $params, $type);

        if ($response->status == true) {
            $response->txid = $response->data->txid;
        } else {
            Log::debug([
                'triggered_by' => 'coin remitter withdraw request', 'error' => $response
            ]);
        }

        return $response;
    }
}

if (!function_exists('coin_remitter_get_wallet_balance')) {
    function coin_remitter_get_wallet_balance($type)
    {
        $url = coin_remitter_api_base_url . strtoupper($type) . '/get-balance';
        $params = [];

        $response =  coin_remitter_api_client($url, $params, $type);

        return $response;
    }
}

if (!function_exists('coin_remitter_get_wallet_transactions')) {
    function coin_remitter_get_wallet_transactions($type, $address, $password)
    {
        $url = coin_remitter_api_base_url . strtoupper($type) . '/get-transaction-by-address';
        $params = [
            'address' => $address,
            'password' => $password
        ];

        $response =  coin_remitter_api_client($url, $params, $type);

        return $response;
    }
}

if (!function_exists('coin_remitter_get_wallet_single_transactions')) {
    function coin_remitter_get_wallet_single_transactions($type, $transaction_id, $password)
    {
        $url = coin_remitter_api_base_url . strtoupper($type) . '/get-transaction';
        $params = [
            'id' => $transaction_id,
            'password' => $password
        ];

        $response =  coin_remitter_api_client($url, $params, $type);

        return $response;
    }
}