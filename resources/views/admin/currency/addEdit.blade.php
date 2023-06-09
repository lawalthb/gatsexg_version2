@extends('admin.master',['menu'=>'setting', 'sub_menu'=>'currency_list'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-12">
                <ul>
                    <li>{{__('Currency Management')}}</li>
                    <li class="active-item">{{ $title }}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->

    <!-- User Management -->
    <div class="user-management">
        <div class="row">
            <div class="col-12">
                <div class="profile-info-form">
                    <div class="card-body">
                        <form action="{{route('adminCurrencyStore')}}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-6 mt-20">
                                    <div class="form-group">
                                        <label for="firstname">{{__('Currency Name')}}</label>
                                        <input type="text" name="name" class="form-control" id="firstname" placeholder="{{__('Currency name')}}"
                                               @if(isset($item)) value="{{$item->name}}" @else value="{{old('name')}}" @endif>
                                        <span class="text-danger"><strong>{{ $errors->first('name') }}</strong></span>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-20">
                                    <div class="form-group">
                                        <label for="lastname">{{__('Currency Code')}}</label>
                                        <select name="code" class="selectpicker" data-width="100%" data-live-search="true" title="{{ __('Choose one currency code')}}">
                                            @foreach(currency_symbol_text() as $key => $currency_name)
                                                <option value="{{ $key }}"> {{ $key }} </option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger"><strong>{{ $errors->first('code') }}</strong></span>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-20">
                                    <div class="form-group">
                                        <label for="email">{{__('Currency Symbol')}}</label>
                                        <input type="text" name="symbol" class="form-control" id="email" placeholder="{{__('Currency symbol')}}"
                                               @if(isset($item)) value="{{$item->symbol}}" @else value="{{old('symbol')}}" @endif>
                                        <span class="text-danger"><strong>{{ $errors->first('symbol') }}</strong></span>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-20">
                                    <label for="bank_address">{{__('Rate ( USD )')}}</label>
                                    <div class="input-group mb-3 w-85 ">
                                        <input type="text" class="form-control" id="bank_address" name="rate"  placeholder="{{__('Rate')}}"
                                               @if(isset($item)) value="{{$item->rate}}" @else value="{{old('rate')}}" @endif>
                                        <div class="input-group-append">
                                            <span class="input-group-text px-4"><span class="currency text-warning">USD</span></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-20">
                                    <div class="form-group">
                                        <label class="switch" style="width: 150px;height: 42px;">
                                            <input {{ isset($item) && $item->status ? 'checked' : ''}} type="checkbox" name="status">
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>
                                @if(isset($item))
                                    <input type="hidden" name="id" value="{{$item->id}}">
                                @endif
                                <div class="col-md-12">
                                    @if(isset($item))
                                        <input type="hidden" name="edit_id" value="{{$item->id}}">
                                    @endif
                                    <button class="button-primary theme-btn">@if(isset($item)) {{__('Update')}} @else {{__('Save')}} @endif</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /User Management -->

@endsection

@section('script')
    <script>
         $('select[name="code"]').selectpicker('val', '@if(isset($item)){{$item->code}}@endif');
    </script>
@endsection
