<?php

namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Console\ClientCommand;
use Laravel\Passport\Console\InstallCommand;
use Laravel\Passport\Console\KeysCommand;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        Validator::extend('strong_pass', function($attribute, $value, $parameters, $validator) {
            return is_string($value);
        });

        Passport::routes();

        /*ADD THIS LINES*/
        $this->commands([
            InstallCommand::class,
            ClientCommand::class,
            KeysCommand::class,
        ]);

        if (Schema::hasTable('admin_settings')) {
            $adm_setting = allsetting();

            $capcha_site_key = isset($adm_setting['NOCAPTCHA_SITEKEY']) ? $adm_setting['NOCAPTCHA_SITEKEY'] : env('NOCAPTCHA_SITEKEY');
            $capcha_secret_key = isset($adm_setting['NOCAPTCHA_SECRET']) ? $adm_setting['NOCAPTCHA_SECRET'] : env('NOCAPTCHA_SECRET');

            config(['captcha.sitekey' => $capcha_site_key]);
            config(['captcha.secret' => $capcha_secret_key]);

            $userThemeColor = [
                'user_theme_navbar_menu_text_color' => isset($adm_setting['user_theme_navbar_menu_text_color'])?$adm_setting['user_theme_navbar_menu_text_color']:'#5B5B5B',
                'user_theme_navbar_active_menu_text_color' => isset($adm_setting['user_theme_navbar_active_menu_text_color'])?$adm_setting['user_theme_navbar_active_menu_text_color']:'#FC541F',
                'user_theme_navbar_background_color' => isset($adm_setting['user_theme_navbar_background_color'])?$adm_setting['user_theme_navbar_background_color']:'#ffffff',
                'user_theme_body_background_color' => isset($adm_setting['user_theme_body_background_color'])?$adm_setting['user_theme_body_background_color']:'#EEF0F8',
                'user_theme_card_body_background_color' => isset($adm_setting['user_theme_card_body_background_color'])?$adm_setting['user_theme_card_body_background_color']:'#ffffff',
                'user_theme_primary_text_color' => isset($adm_setting['user_theme_primary_text_color'])?$adm_setting['user_theme_primary_text_color']:'#575a63',
                'user_theme_secondary_text_color' => isset($adm_setting['user_theme_secondary_text_color'])?$adm_setting['user_theme_secondary_text_color']:'#656b96',
                'user_theme_warning_text_color' => isset($adm_setting['user_theme_warning_text_color'])?$adm_setting['user_theme_warning_text_color']:'#ffc107',
                'user_theme_link_text_color' => isset($adm_setting['user_theme_link_text_color'])?$adm_setting['user_theme_link_text_color']:'#dc8725',
                'user_theme_button_text_color' => isset($adm_setting['user_theme_button_text_color'])?$adm_setting['user_theme_button_text_color']:'#ffffff',
                'user_theme_button_background_color' => isset($adm_setting['user_theme_button_background_color'])?$adm_setting['user_theme_button_background_color']:'#50525a',
                'user_theme_active_button_background_color' => isset($adm_setting['user_theme_active_button_background_color'])?$adm_setting['user_theme_active_button_background_color']:'#474747'
            ];

            View::share(['userThemeColor' => $userThemeColor]);
        }
    }
}
