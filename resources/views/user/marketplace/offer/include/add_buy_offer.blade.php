<div class="cp-user-coin-info">
    <form action="{{route('offerSaveProcess')}}" method="POST" enctype="multipart/form-data"
          id="buy_coin">
        @csrf
        <input type="hidden" value="{{BUY}}" id="offer_type" name="offer_type">
        <div class="row" id="row1st">
            <div class="col-xl-12">
                <div class="row">
                    <div class="col-xl-12 mb-xl-0">
                        <div class="cp-user-payment-type cp-user-payment-type2  mb-3">
                            <h3>{{__('Select Asset ')}}:</h3>
                            <div class="form-groups">
                                @if(isset($coins[0]))
                                    @foreach($coins as $coin)
                                        <div class="form-group">
                                            <input type="radio" onclick="call_coin_payment('{{$coin->type}}');"   value="{{$coin->type}}" id='{{"coin-option".$coin->id}}' name="coin_type">
                                            <label for='{{"coin-option".$coin->id}}'>{{check_default_coin_type($coin->type)}}</label>
                                        </div>
                                    @endforeach
                                @else
                                    <p>{{__('No coin available right now')}}</p>
                                @endif
                            </div>
                            <span class="text-danger"><strong>{{ $errors->first('coin_type') }}</strong></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type mb-3">
                            <h3>{{__('Select country')}}:</h3>
                            <select name="country" class=" selectpicker form-control" id="country" data-container="body" data-live-search="true" title="" data-hide-disabled="true" data-actions-box="true" data-virtual-scroll="false">
                                <option value="">{{__('Select country')}}</option>
                                @foreach($countries as $key => $value)
                                    <option @if(old('country') == $key) selected @endif value="{{$key}}">{{$value}}</option>
                                @endforeach
                            </select>
                            <span class="text-danger"><strong>{{ $errors->first('country') }}</strong></span>
                        </div>
                    </div>
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type mb-3">
                            <h3>{{__('Select currency')}}:</h3>
                            <select name="currency" class=" selectpicker form-control" id="currency" data-container="body" data-live-search="true" title="" data-hide-disabled="true" data-actions-box="true" data-virtual-scroll="false">
                                <option value="">{{__('Select currency')}}</option>
                                @if(isset($currencies))
                                    @foreach($currencies as $key => $value)
                                        <option @if(old('currency') == $key) selected @endif value="{{$key}}">{{$value}}</option>
                                    @endforeach
                                @endif
                            </select>
                            <span class="text-danger"><strong>{{ $errors->first('currency') }}</strong></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type">
                            <h3>{{__('Select what you like to set your rate')}}</h3>
                            <small class="text-warning">{{__('Note : For the ').settings('coin_name').__(' coin , only you can select static rate type')}}</small>
                            <div class="form-group mt-1" id="dynamicRates">
                                <input type="radio"
                                       onchange="$('.dynamic_coin_rate').addClass('d-none');$('.static_coin_rate').addClass('d-none');$('.static_coin_rate').removeClass('d-block');$('.dynamic_rate').toggleClass('d-none');"
                                       value="{{RATE_TYPE_DYNAMIC}}" id="rate_type_dynamic" name="rate_type">
                                <label for="rate_type_dynamic">{{__('Dynamic Rate')}}</label>
                            </div>
                            <div class="form-group">
                                <input type="radio"
                                       onchange="$('.dynamic_coin_rate').addClass('d-none');$('.static_coin_rate').addClass('d-block');$('.static_coin_rate').removeClass('d-none');$('.static_rate').toggleClass('d-none');"
                                       value="{{RATE_TYPE_STATIC}}" id="rate_type_static" name="rate_type">
                                <label for="rate_type_static">{{__('Static Rate')}}</label>
                            </div>
                            <span class="text-danger"><strong>{{ $errors->first('rate_type') }}</strong></span>
                            <div>
                                <h3><span class="highestOrderText">{{__('Highest')}}</span>{{__(' Order Price')}}</h3>
                                <h3><span id="highestOrderPrice">0</span> <span class="currency" >USD</span></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type dynamic_rate dynamic_coin_rate d-none">
                            <h3>{{__('Dynamic market price')}}</h3>
                            <div class="form-group">
                                <input type="radio" value="{{RATE_ABOVE}}" id="rate_above" name="price_type">
                                <label for="rate_above">{{__('Above')}}</label>
                            </div>
                            <div class="form-group">
                                <input type="radio" value="{{RATE_BELOW}}" id="rate_below" name="price_type">
                                <label for="rate_below">{{__('Below')}}</label>
                            </div>
                            <span class="text-danger"><strong>{{ $errors->first('price_type') }}</strong></span>
                            <div class="input-group mb-3 w-85 ">
                                <input type="number" name="rate_percentage" value="{{old('rate_percentage')}}" id="rate_percentage" 
                                    class="form-control" placeholder="{{__('Rate % e.g 1.4 %')}}">
                                <div class="input-group-append">
                                    <span class="input-group-text px-4"><span class="currency text-warning">{{'USD'}}</span></span>
                                </div>
                            </div>
                            <span>{{__('Dynamic Market Price: ')}}<span id="dynamic_coin_price">0</span></span>
                            <span class="text-danger"><strong>{{ $errors->first('rate_percentage') }}</strong></span>
                            <p>{{__('Buyers typically choose a margin of roughly 2% below market price.')}}</p>
                        </div>

                        <div class="cp-user-payment-type static_coin_rate static_rate d-none">
                            <h3>{{__('Static market price')}}</h3>
                            <div class="input-group mb-3 w-85 ">
                                <input name="coin_rate" value="{{old('coin_rate')}}" id="" class="form-control" >
                                <div class="input-group-append">
                                    <span class="input-group-text px-4"><span class="currency text-warning">{{'USD'}}</span></span>
                                </div>
                            </div>

                            <span class="text-danger"><strong>{{ $errors->first('coin_rate') }}</strong></span>
                            <p>{{__('Analysis different kinds of market place and set your price rate. e.g. ')}} 1 </p>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-xl-12 text-center">
                        <button type="button" class="btn btn-primary" id="next1st">{{__('Next')}} <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="loaderDiv">
            <div class="col-md-12 text-center">
                <div class="spinner-border" role="status"></div>
            </div>
        </div>
        <div class="row mt-5" id="row2nd">
            <div class="col-xl-12">
                <div class="row">
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type">
                            <h3>{{__('Total Amount')}} <span class="float-right">{{__('Total Price')}}: <span id="converted_price_in_currency">0</span> </span></h3>
                            
                            <div class="input-group mb-3 w-85 ">
                                <input name="total_amount" value="{{old('total_amount')}}" id="total_amount" class="form-control">
                                <div class="input-group-append">
                                    <span class="input-group-text px-4" id="basic-addon2"><span class="coinType text-warning">{{'BTC'}}</span></span>
                                </div>
                            </div>
                            <span class="text-danger"><strong>{{ $errors->first('total_amount') }}</strong></span>
                        </div>
                    </div>
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type">
                            <h3>{{__('Order Limit')}}</h3>
                        </div>
                        <div class="row">
                            <div class="col-xl-6 mb-xl-0">
                                <div class="cp-user-payment-type">
                                    <div class="input-group mb-3 w-85 ">
                                        <input name="minimum_trade_size" value="{{old('minimum_trade_size')}}" id="" class="form-control">
                                        <div class="input-group-append">
                                            <span class="input-group-text px-4" id="basic-addon2"><span class="currency text-warning">{{'BDT'}}</span></span>
                                        </div>
                                    </div>
                                    <span class="text-danger"><strong>{{ $errors->first('minimum_trade_size') }}</strong></span>
                                </div>
                            </div>
                            <div class="col-xl-6 mb-xl-0">
                                <div class="cp-user-payment-type">
                                    <div class="cp-user-payment-type">
                                        <div class="input-group mb-3 w-85 ">
                                            <input name="maximum_trade_size" value="{{old('maximum_trade_size')}}" id="" class="form-control">
                                            <div class="input-group-append">
                                                <span class="input-group-text px-4" id="basic-addon2"><span class="currency text-warning">{{'BDT'}}</span></span>
                                            </div>
                                        </div>
                                        <span class="text-danger"><strong>{{ $errors->first('maximum_trade_size') }}</strong></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type">
                            <h3>{{__('Select payment method')}}</h3>
                            <select multiple name="payment_methods[]" class="selectpicker form-control" id="select_payment_method" data-container="body" data-live-search="true" title="" data-hide-disabled="true" data-actions-box="true" data-virtual-scroll="false">
                                {{-- @if(isset($payment_methods[0]))
                                    @foreach($payment_methods as $payment_method)
                                        <option value="{{ $payment_method->id }}">{{ $payment_method->name }}</option>
                                    @endforeach
                                @endif --}}
                            </select>
                            <span class="text-danger"><strong>{{ $errors->first('payment_methods') }}</strong></span>
                        </div>
                    </div>
                    <div class="col-xl-6 mb-xl-0">
                        <div class="cp-user-payment-type">
                            <h3>{{__('Payment time limit')}}</h3>
                            <select id="select-payment-method" name="payment_time" class="form-control"> 
                                <option value="">{{__('Select')}}</option>
                                @if(isset($payment_window[0]))
                                    @foreach($payment_window as $window)
                                    <option value="{{$window->payment_time}}">{{$window->payment_time}}</option>
                                    @endforeach
                                @endif
                            </select>
                            <span class="text-danger"><strong>{{ $errors->first('payment_time') }}</strong></span>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-xl-12 text-center">
                        <button type="button" class="btn btn-primary" id="previous1st">{{__('Previous')}} <i class="fa fa-arrow-circle-left" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-primary" id="next2nd">{{__('Next')}} <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5" id="row3rd">
            <div class="col-xl-12">
                <div class="row">
                    <div class="col-xl-12 mb-xl-0">
                        <div class="cp-user-payment-type mb-3">
                            <h3>{{__('Offer Headline')}}</h3>
                            <input name="headline" value="{{old('headline')}}" id="headline" class="form-control" placeholder="{{__('Offer headline')}}">
                            <span class="text-danger"><strong>{{ $errors->first('headline') }}</strong></span>
                        </div>
                        <div class="cp-user-payment-type mb-3">
                            <h3>{{__('Terms of the trade (Optional)')}}</h3>
                            <textarea name="terms" class="form-control" id="" cols="30" rows="10">{{old('terms')}}</textarea>
                        </div>
                        <div class="cp-user-payment-type mb-3">
                            <h3>{{__('Auto-reply (Optional)')}}</h3>
                            <textarea name="instruction" class="form-control" id="" cols="30" rows="10">{{old('instruction')}}</textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 mb-xl-0">
                        <div class="cp-user-payment-type mb-3">
                            <h3>{{__('Counterparty Conditions')}}</h3>
                            <p>{{__('Adding counterparty conditions would reduce your chance of trading successfully.')}}</p>
                        </div>
                        <div class="cp-user-payment-type mt-3">
                            <div class="form-group ml-0 ml-lg-5">
                                <input type="checkbox" value="1"
                                id="user_kyc_check" name="user_kyc_check">
                                <label class="text-dark" for="user_kyc_check">
                                    {{__('Completed KYC')}}
                                </label>
                            </div>
                            <div class="form-group ml-0 ml-lg-5">
                                <input type="checkbox" value="1"
                                id="user_register_past_day_check" name="user_register_past_day_check">
                                <label class="text-dark" for="user_register_past_day_check">
                                    {{__('Register')}}
                                    <input class="label-inner-input" type="number" name="user_register_past_days" value="{{$item->user_register_past_days ?? ''}}"/>
                                    {{__('days ago')}}
                                </label>
                            </div>
                            <div class="form-group ml-0 ml-lg-5">
                                <input type="checkbox" value="1"
                                id="user_holding_amount_check" name="user_holding_amount_check">
                                <label class="text-dark" for="user_holding_amount_check">
                                    {{__('Holdings more than')}}
                                    <input class="label-inner-input" type="number" name="user_holding_amount" value="{{$item->user_holding_amount ?? ''}}">
                                    <span class="coinType">BTC</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-xl-12 text-center">
                        <button type="button" class="btn btn-primary" id="previous2nd">{{__('Previous')}} <i class="fa fa-arrow-circle-left" aria-hidden="true"></i></button>
                        <button id="buy_button" type="button" onclick="submitBuyForm();" class="btn theme-btn">{{__('Create Offer')}}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

