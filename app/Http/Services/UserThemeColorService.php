<?php

namespace App\Http\Services;

use App\Repository\UserThemeColorRepository;

class UserThemeColorService {

    private $userThemeColorRepository;
    public function __construct()
    {   
        $this->userThemeColorRepository = new UserThemeColorRepository();
    }

    public function getUserThemeColor()
    {
        $response = $this->userThemeColorRepository->getUserThemeColor();
        return $response;
    }
    public function userThemeColorSave($request)
    {
        $response = $this->userThemeColorRepository->userThemeColorSave($request);
        return $response;
    }

    public function resetUserThemeColor()
    {
        $response = $this->userThemeColorRepository->resetUserThemeColor();
        return $response;
    }
}