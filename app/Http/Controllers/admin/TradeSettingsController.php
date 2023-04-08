<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repository\SettingRepository;

class TradeSettingsController extends Controller
{
    private $settingRepo;
    public function __construct()
    {
        $this->settingRepo = new SettingRepository();
    }
    public function tradeSettings()
    {
        $data['title'] = __('Trade Setting');
        return view('admin.settings.trade-setting.settings',$data);
    }

    public function tradeSettingsSave(Request $request)
    {
        if (($request->kyc_enable_for_trade == STATUS_ACTIVE) &&
            ($request->kyc_nid_enable_for_trade != STATUS_ACTIVE && $request->kyc_passport_enable_for_trade != STATUS_ACTIVE && 
                $request->kyc_driving_enable_for_trade != STATUS_ACTIVE && $request->phone_verification_trade != STATUS_ACTIVE
            )
            ) {
            return redirect()->route('tradeSettings')->withInput()->with('dismiss', __('Minimum one type of verification should be enabled for trade'));
        }
        $response = $this->settingRepo->saveAdminSetting($request);
        if ($response['success'] == true) {
            return redirect()->route('tradeSettings')->with('success', __('Trade Settings updated successfully'));
        } else {
            return redirect()->route('tradeSettings')->withInput()->with('dismiss', $response['message']);
        }
    }
}
