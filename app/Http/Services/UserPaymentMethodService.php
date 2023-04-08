<?php


namespace App\Http\Services;

use App\Repository\UserPaymentMethodRepository;

class UserPaymentMethodService{
    private $userPaymentMethodRepository;
    public function __construct()
    {
        $this->userPaymentMethodRepository = new UserPaymentMethodRepository;
    }

    public function getPaymentMethodList()
    {
        $response = $this->userPaymentMethodRepository->getPaymentMethodList();
        return $response;
    }
    public function userPaymentMethodSave($request)
    {
        $response = $this->userPaymentMethodRepository->userPaymentMethodSave($request);
        return $response;
    }
    public function userPaymentMethodEdit($id)
    {
        $response = $this->userPaymentMethodRepository->userPaymentMethodEdit($id);
        return $response;
    }

    public function userPaymentMethodDeleteByID($id)
    {
        $response = $this->userPaymentMethodRepository->userPaymentMethodDeleteByID($id);
        return $response;
    }

}