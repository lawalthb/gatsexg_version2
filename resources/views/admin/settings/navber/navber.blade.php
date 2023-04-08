@extends('admin.master',['menu'=>'theme-setting', 'sub_menu'=>'navber'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-12">
                <ul>
                    <li>{{__('Landing')}}</li>
                    <li class="active-item">{{__('User Navbar')}}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->

    <!-- User Management -->
    <div class="user-management padding-30">
        <form action="{{ route('userNavberSettingSave') }}" method="post">
            @csrf
            <div class="row">
                <div class="col-6" style="overflow:hidden;">
                    <div class="form-group">
                        <input type="text" name="user_nav_dashboard" value="{{ $navber['user_nav_dashboard'] ?? 'Dashboard' }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="user_nav_wallet" value="{{ $navber['user_nav_wallet'] ?? 'My Wallet' }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="user_nav_exchange" value="{{ $navber['user_nav_exchange'] ?? 'Crypto Exchange' }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="user_nav_offer" value="{{ $navber['user_nav_offer'] ?? 'My Offer' }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="user_nav_trade_list" value="{{ $navber['user_nav_trade_list'] ??  'My Trade List' }}" class="form-control" />
                    </div>
                    @if(admin_feature_enable('buy_coin_feature'))
                        <div class="form-group">
                            <input type="text" name="user_nav_buy_coin" value="{{ $navber['user_nav_buy_coin'] ?? 'Buy Coin' }}" class="form-control" />
                        </div>
                        <div class="form-group ml-5">
                            <input type="text" name="user_navSub_buy_coin" value="{{ $navber['user_navSub_buy_coin'] ??  'Buy Coin' }}" class="form-control" />
                        </div>
                        <div class="form-group ml-5">
                            <input type="text" name="user_navSub_buy_coin_history" value="{{ $navber['user_navSub_buy_coin_history'] ?? 'Buy Coin History' }}" class="form-control" />
                        </div>
                    @endif
                    <div class="form-group">
                        <input type="text" name="user_nav_referral" value="{{ $navber['user_nav_referral'] ?? 'My Referral' }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="user_nav_setting" value="{{ $navber['user_nav_setting'] ?? 'Settings' }}" class="form-control" />
                    </div>
                    <div class="form-group ml-5">
                        <input type="text" name="user_navSub_setting" value="{{ $navber['user_navSub_setting'] ?? 'My Settings' }}" class="form-control" />
                    </div>
                    <div class="form-group ml-5">
                        <input type="text" name="user_navSub_faq" value="{{ $navber['user_navSub_faq'] ?? __('FAQ') }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="user_nav_login" value="{{ $navber['user_nav_login'] ?? __('Login') }}" class="form-control" />
                    </div>
                </div>
                <div class="col-6">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <input type="submit" value="{{ __('Update') }}" class=" btn-primary form-control" />
                    </div>
                </div>
                <div class="col-6"></div>
            </div>
        </form>
    </div>
    <!-- /User Management -->


@endsection

@section('script')
    <script>

    </script>
@endsection
