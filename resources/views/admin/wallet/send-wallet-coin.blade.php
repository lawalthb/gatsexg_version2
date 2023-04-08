@extends('admin.master',['menu'=>'pocket','sub_menu'=>'send_wallet_coin'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-12">
                <ul>
                    <li>{{__('Wallet Management')}}</li>
                    <li class="active-item">{{__('Send Coin to User')}}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
    <div class="user-management add-custom-page">
        <div class="row">
            <div class="col-12">
                <div class="header-bar">
                    <div class="table-title">
                        <h3>{{$title}}</h3>
                    </div>
                </div>
                <div class="profile-info-form">
                    <form action="{{route('adminSendBalanceProcess')}}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-xl-6 mb-xl-0 mb-4">
                                <div class="form-group">
                                    <label>{{__('Amount')}} </label>
                                    <input type="text" name="amount" class="form-control" value="{{old('amount')}}" >
                                </div>
                            </div>
                            <div class="col-xl-6 mb-xl-0 mb-4">
                                <div class="form-group">
                                    <label>{{__('Select User Wallet')}}</label>
                                    <select name="wallet_id[]" id="" class="selectpicker" title="{{ __('User Wallet') }}" data-live-search="true" data-width="100%" data-style="btn-info" data-actions-box="true" data-selected-text-format="count > 4" multiple>
                                        @if(!empty($wallets))
                                            @foreach($wallets as $key => $value)
                                                <option value="{{$value->id}}" >
                                                    {{ $value->name .' ('. $value->first_name .' '. $value->last_name.')' }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <button type="submit" class="btn add-faq-btn">{{__('Send Coin')}}</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')

@endsection
