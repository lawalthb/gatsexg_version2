<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Services\UserThemeColorService;

class UserThemeColorController extends Controller
{
    private $userThemeColorService;
    public function __construct()
    {
        $this->userThemeColorService = new UserThemeColorService();
    }
    public function userThemeColor()
    {
        $data['title'] = __('User Theme Color Setting');
        $data['item'] = $this->userThemeColorService->getUserThemeColor();
        return view('admin.theme-setting.user-theme-color', $data);
    }

    public function userThemeColorSave(Request $request)
    {
        $response = $this->userThemeColorService->userThemeColorSave($request);

        if($response['success'] == true)
        {
            return back()->with(['success' => $response['message']]);
        }else{
            return back()->with(['dismiss' => $response['message']]);
        }
    }

    public function resetUserThemeColor()
    {
        $response = $this->userThemeColorService->resetUserThemeColor();

        return back()->with(['success' => $response['message']]);
    }
}
