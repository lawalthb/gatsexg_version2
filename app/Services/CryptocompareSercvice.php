<?php

namespace App\Services;

class CryptocompareSercvice
{
    private $logger;
    private $apiKey;
    private $url;
    public function __construct()
    {
        $this->logger = new Logger();
        $this->apiKey = allsetting()['cryptoCompare'] ?? "";
        $this->url = "https://min-api.cryptocompare.com/data/";
    }


    public function getSinglePrice($coin,$fiat = "USD"){
        $query = [
            "fsym" => $coin,
            "tsyms" => $fiat,
            "api_key" => $this->apiKey
        ];
        $this->url .= "price?".http_build_query($query);
        return $this->__api($this->url);
    }


    public function getMultiplePrice($coins,$fiats = "USD"){
        $query = [
            "fsyms" => $coins,
            "tsyms" => $fiats,
            "api_key" => $this->apiKey
        ];
        $this->url .= "pricemulti?".http_build_query($query);
        return $this->__api($this->url);
    }


    public function __api($url)
    {
        $json = file_get_contents($url);
        return json_decode($json, TRUE);
    }
}
