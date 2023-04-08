<?php

namespace App\Repository;

use App\Model\AdminSetting;

class UserThemeColorRepository {

    public function getUserThemeColor()
    {
        $theme_colors = AdminSetting::where('slug', 'like', '%user_theme_%')->get();
        if ($theme_colors) {
            $output = [];
            foreach ($theme_colors as $setting) {
                $output[$setting->slug] = $setting->value;
            }
        }

        return $output;
    }
    public function userThemeColorSave($request)
    {
        try{
            foreach($request->except('_token') as $key=>$value)
            {
                AdminSetting::updateOrCreate(['slug' => $key], ['value' => $value]);
            }
            $response = ['success' => true, 'message' => __('User Theme Color Updated successfully')];
        } catch (\Exception $exception) {
            storeException('userThemeColorSave ', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
        
    }

    public function resetUserThemeColor()
    {
        try{
            
            AdminSetting::updateOrCreate(['slug' => 'user_theme_navbar_menu_text_color'], ['value' => '#5B5B5B']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_navbar_active_menu_text_color'], ['value' => '#FC541F']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_navbar_background_color'], ['value' => '#ffffff']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_body_background_color'], ['value' => '#EEF0F8']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_card_body_background_color'], ['value' => '#ffffff']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_primary_text_color'], ['value' => '#575a63']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_secondary_text_color'], ['value' => '#656b96']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_warning_text_color'], ['value' => '#ffc107']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_link_text_color'], ['value' => '#dc8725']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_button_text_color'], ['value' => '#ffffff']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_button_background_color'], ['value' => '#50525a']);
            AdminSetting::updateOrCreate(['slug' => 'user_theme_active_button_background_color'], ['value' => '#28a745']);
            
            $response = ['success' => true, 'message' => __('User Theme Color reset successfully')];
        } catch (\Exception $exception) {
            storeException('userThemeColorSave ', $exception->getMessage());
            $response = ['success' => false, 'message' => __('Something went wrong'),'data' => []];
        }
        return $response;
    }
}