@extends('admin.master',['menu'=>'setting', 'sub_menu'=>'trade_setting'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-12">
                <ul>
                    <li>{{__('Settings')}}</li>
                    <li class="active-item">{{ $title }}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
    <!-- User Management -->
    <div class="user-management padding-30">
        
            <div class="row">
                <div class="profile-info-form col-12">
                    <form action="{{route('tradeSettingsSave')}}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="header-bar">
                                    <div class="table-title">
                                        <h3>{{__('Trade Section')}}</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12  mt-20">
                                <div class="form-group">
                                    <label>{{__('KYC mandatory for trade')}}</label>
                                    <div class="cp-select-area">
                                        <select name="kyc_enable_for_trade" class="form-control">
                                            <option @if(settings('kyc_enable_for_trade') != STATUS_ACTIVE) selected @endif value={{STATUS_PENDING}}>{{__('Disabled')}}</option>
                                            <option @if(settings('kyc_enable_for_trade') == STATUS_ACTIVE) selected @endif value={{STATUS_ACTIVE}}>{{__('Enabled')}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12  mt-20">
                                <div class="form-group">
                                    <label>{{__('NID verification mandatory for trade')}}</label>
                                    <div class="cp-select-area">
                                        <select name="kyc_nid_enable_for_trade" class="form-control">
                                            <option @if(settings('kyc_nid_enable_for_trade') != STATUS_ACTIVE) selected @endif value={{STATUS_PENDING}}>{{__('Disabled')}}</option>
                                            <option @if(settings('kyc_nid_enable_for_trade') == STATUS_ACTIVE) selected @endif value={{STATUS_ACTIVE}}>{{__('Enabled')}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12  mt-20">
                                <div class="form-group">
                                    <label>{{__('Driving licence verification mandatory for withdrawal')}}</label>
                                    <div class="cp-select-area">
                                        <select name="kyc_driving_enable_for_trade" class="form-control">
                                            <option @if(settings('kyc_driving_enable_for_trade') != STATUS_ACTIVE) selected @endif value={{STATUS_PENDING}}>{{__('Disabled')}}</option>
                                            <option @if(settings('kyc_driving_enable_for_trade') == STATUS_ACTIVE) selected @endif value={{STATUS_ACTIVE}}>{{__('Enabled')}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12  mt-20">
                                <div class="form-group">
                                    <label>{{__('Passport verification mandatory for trade')}}</label>
                                    <div class="cp-select-area">
                                        <select name="kyc_passport_enable_for_trade" class="form-control">
                                            <option @if(settings('kyc_passport_enable_for_trade') != STATUS_ACTIVE) selected @endif value={{STATUS_PENDING}}>{{__('Disabled')}}</option>
                                            <option @if(settings('kyc_passport_enable_for_trade') == STATUS_ACTIVE) selected @endif value={{STATUS_ACTIVE}}>{{__('Enabled')}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12  mt-20">
                                <div class="form-group">
                                    <label>{{__('User Phone verification for trade')}}</label>
                                    <div class="cp-select-area">
                                        <select name="phone_verification_trade" class="form-control">
                                            <option @if(settings('phone_verification_trade') != STATUS_ACTIVE) selected @endif value={{STATUS_PENDING}}>{{__('Disabled')}}</option>
                                            <option @if(settings('phone_verification_trade') == STATUS_ACTIVE) selected @endif value={{STATUS_ACTIVE}}>{{__('Enabled')}}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-12 mt-20">
                                <button type="submit" class="button-primary theme-btn">{{__('Update')}}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
       
    </div>
    <!-- /User Management -->

@endsection

@section('script')
   
@endsection
