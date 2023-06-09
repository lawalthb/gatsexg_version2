@extends('user.master',['menu'=>'offer'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <div class="row">
        <div class="col-xl-12 mb-xl-0 mb-4">
            <div class="card cp-user-custom-card">
                <div class="card-body">
                    <div class="cp-user-card-header-area">
                        <h4>{{__('Update Offer')}}</h4>
                    </div>
                    <div class="cp-user-buy-coin-content-area">
                        <div class="cp-user-coin-info">
                            <form action="{{route('offerSaveProcess')}}" method="POST" enctype="multipart/form-data"
                                  id="buy_coin">
                                @csrf
                                <div class="row">
                                    <div class="col-xl-4 mb-xl-0">
                                        <div class="cp-user-payment-type">
                                            <h3>{{__('You want to : ')}}</h3>
                                            <input type="hidden" name="edit_id" value="{{$item->id}}">

                                            <div class="form-groups">
                                                @if ($offer_type == BUY)
                                                    <div class="form-group">
                                                        <input type="radio" value="{{BUY}}" @if($offer_type == BUY) checked @endif id="buy-option" name="offer_type">
                                                        <label for="buy-option">{{__('Buy')}}</label>
                                                    </div>
                                                @endif
                                                @if ($offer_type == SELL)
                                                    <div class="form-group">
                                                        <input type="radio" value="{{SELL}}"  @if($offer_type == SELL) checked @endif id="sell-option" name="offer_type">
                                                        <label for="sell-option">{{__('Sell')}}</label>
                                                    </div>
                                                @endif
                                            </div>
                                            <span class="text-danger"><strong>{{ $errors->first('offer_type') }}</strong></span>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 mb-xl-0">
                                        <div class="cp-user-payment-type">
                                            <h3>{{__('Select Coin')}}</h3>
                                            <div class="form-groups">
                                                @if(isset($coins[0]))
                                                    @foreach($coins as $coin)
                                                        @if ($item->coin_type == $coin->type)
                                                            <div class="form-group">
                                                                <input type="radio" onclick="call_coin_payment('{{$coin->type}}');" @if($item->coin_type == $coin->type) checked @endif  value="{{$coin->type}}" id='{{"coin-option".$coin->id}}' name="coin_type">
                                                                <label for='{{"coin-option".$coin->id}}'>{{check_default_coin_type($coin->type)}}</label>
                                                            </div>
                                                        @endif
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
                                            <h3>{{__('Select country which you want to show')}}</h3>
                                            <select name="country" class=" selectpicker form-control" id="country" data-container="body" data-live-search="true" title="" data-hide-disabled="true" data-actions-box="true" data-virtual-scroll="false">
                                                <option value="">{{__('Select country')}}</option>
                                                @foreach($countries as $key => $value)
                                                    <option @if($item->country == $key) selected @endif value="{{$key}}">{{$value}}</option>
                                                @endforeach
                                            </select>
                                            <span class="text-danger"><strong>{{ $errors->first('country') }}</strong></span>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 mb-xl-0">
                                        <div class="cp-user-payment-type mb-3">
                                            <h3>{{__('Select payment methods that you want to accept')}}</h3>
                                            <select multiple name="payment_methods[]" class=" selectpicker form-control" id="select-payment-method" data-container="body" data-live-search="true" title="" data-hide-disabled="true" data-actions-box="true" data-virtual-scroll="false">
                                                @if(isset($payment_methods[0]))
                                                    @foreach($payment_methods as $payment_method)
                                                        <option @if(in_array($payment_method->id,$selected_payments)) selected @endif  value="{{$payment_method->id}}">{{$payment_method->name}}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <span class="text-danger"><strong>{{ $errors->first('payment_methods') }}</strong></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6 mb-xl-0">
                                        <div class="cp-user-payment-type mb-3">
                                            <h3>{{__('Full Address (Optional)')}}</h3>
                                            <input name="address" id="address" value="{{$item->address}}" class="form-control" placeholder="{{__('Address details')}}">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 mb-xl-0">
                                        <div class="cp-user-payment-type mb-3">
                                            <h3>{{__('Select currency that you want to accept')}}</h3>
                                            <select name="currency" class=" selectpicker form-control" id="number-multiple" data-container="body" data-live-search="true" title="" data-hide-disabled="true" data-actions-box="true" data-virtual-scroll="false">
                                                <option value="">{{__('Select currency')}}</option>
                                                @if(isset($currencies))
                                                    @foreach($currencies as $key => $value)
                                                        <option @if($item->currency == $key) selected @endif value="{{$key}}">{{$value}}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <span class="text-danger"><strong>{{ $errors->first('currency') }}</strong></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6 mb-xl-0">
                                        <div class="cp-user-payment-type mb-3">
                                            <h3>{{__('Select what you like to set your rate')}}</h3>
                                            <small class="text-warning">{{__('Note : For the ').settings('coin_name').__(' coin , only you can select static rate type')}}</small>
                                            <div class="form-group mt-1" id="dynamicRates" >
                                                <input type="radio" @if($item->rate_type == RATE_TYPE_DYNAMIC) checked @endif
                                                       onchange="$('.dynamic_coin_rate').addClass('d-none');$('.static_coin_rate').addClass('d-none');$('.static_coin_rate').removeClass('d-block');$('.dynamic_rate').toggleClass('d-none');"
                                                       value="{{RATE_TYPE_DYNAMIC}}" id="rate_type_dynamic" name="rate_type">
                                                <label for="rate_type_dynamic">{{__('Dynamic Rate')}}</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="radio" @if($item->rate_type == RATE_TYPE_STATIC) checked @endif
                                                       onchange="$('.dynamic_coin_rate').addClass('d-none');$('.static_coin_rate').addClass('d-block');$('.static_coin_rate').removeClass('d-none');$('.static_rate').toggleClass('d-none');"
                                                       value="{{RATE_TYPE_STATIC}}" id="rate_type_static" name="rate_type">
                                                <label for="rate_type_static">{{__('Static Rate')}}</label>
                                            </div>
                                            <span class="text-danger"><strong>{{ $errors->first('rate_type') }}</strong></span>
                                        </div>
                                        <div class="cp-user-payment-type dynamic_rate dynamic_coin_rate  @if($item->rate_type == RATE_TYPE_STATIC) d-none @endif">
                                            <h3>{{__('Dynamic market price')}}</h3>
                                            <div class="form-group">
                                                <input type="radio" @if($item->price_type == RATE_ABOVE) checked @endif value="{{RATE_ABOVE}}" id="rate_above" name="price_type">
                                                <label for="rate_above">{{__('Above')}}</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="radio" @if($item->price_type == RATE_BELOW) checked @endif value="{{RATE_BELOW}}" id="rate_below" name="price_type">
                                                <label for="rate_below">{{__('Below')}}</label>
                                            </div>
                                            <span class="text-danger"><strong>{{ $errors->first('price_type') }}</strong></span>
                                            <input name="rate_percentage" value="{{$item->rate_percentage}}" id="" class="form-control" placeholder="{{__('Rate % e.g 1.4 %')}}">
                                            <span class="text-danger"><strong>{{ $errors->first('rate_percentage') }}</strong></span>
                                            <p>{{__('Buyers typically choose a margin of roughly 2% below market price.')}}</p>
                                        </div>

                                        <div class="cp-user-payment-type mt-3 static_coin_rate static_rate @if($item->rate_type == RATE_TYPE_DYNAMIC) d-none @endif">
                                            <h3>{{__('Static market price')}}</h3>
                                            <input name="coin_rate" value="{{$item->coin_rate}}" id="" class="form-control" placeholder="{{__('')}}">
                                            <span class="text-danger"><strong>{{ $errors->first('coin_rate') }}</strong></span>
                                            <p>{{__('Analysis different kinds of market place and set your price rate. e.g. ')}} 1 <span class="cointype">BTC</span> = ? <span class="currency">USD</span></p>
                                        </div>

                                    </div>
                                    <div class="col-xl-6 mb-xl-0">
                                        <div class="row">
                                            <div class="col-xl-12 mb-xl-0">
                                                <div class="cp-user-payment-type">
                                                    <h3>{{__('Total Amount')}} <span class="float-right">{{__('Total Price')}}: <span id="converted_price_in_currency">0</span> </span></h3>
                                                    
                                                    <div class="input-group mb-3 w-85 ">
                                                        <input name="total_amount" value="{{$item->amount}}" id="total_amount" class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text px-4" id="basic-addon2"><span class="coinType text-warning">{{$item->coin_type}}</span></span>
                                                        </div>
                                                    </div>
                                                    <span class="text-danger"><strong>{{ $errors->first('total_amount') }}</strong></span>
                                                </div>
                                            </div>
                                            <div class="col-xl-12 mb-xl-0">
                                                <div class="cp-user-payment-type">
                                                    <h3>{{__('Sold Amount')}} </h3>
                                                    <div class="input-group mb-3 w-85 ">
                                                        <input name="" value="{{$item->sold_amount}}" id="" class="form-control">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text px-4" id="basic-addon2"><span class="coinType text-warning">{{$item->coin_type}}</span></span>
                                                        </div>
                                                    </div>
                                                    <span class="text-danger"><strong>{{ $errors->first('total_amount') }}</strong></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cp-user-payment-type">
                                            <h3>{{__('Set your trade limit size ')}} (in <span class="currency">USD</span>)</h3>
                                        </div>
                                        <div class="row">
                                            <div class="col-xl-6 mb-xl-0">
                                                <div class="cp-user-payment-type mb-3">
                                                    <h3>{{__('Minimum trade size')}}</h3>
                                                    <input name="minimum_trade_size" value="{{$item->minimum_trade_size}}" id="" class="form-control" placeholder="{{__('')}}">
                                                    <span class="text-danger"><strong>{{ $errors->first('minimum_trade_size') }}</strong></span>
                                                </div>
                                            </div>
                                            <div class="col-xl-6 mb-xl-0">
                                                <div class="cp-user-payment-type mb-3">
                                                    <h3>{{__('Maximum trade size')}}</h3>
                                                    <input name="maximum_trade_size" value="{{$item->maximum_trade_size}}" id="" class="form-control" placeholder="{{__('')}}">
                                                    <span class="text-danger"><strong>{{ $errors->first('maximum_trade_size') }}</strong></span>
                                                </div>
                                            </div>
                                            <div class="col-xl-12 mb-xl-0">
                                                <div class="cp-user-payment-type mb-3">
                                                    <h3>{{__('Offer Headline')}}</h3>
                                                    <input name="headline" value="{{$item->headline}}" id="headline" class="form-control" placeholder="{{__('Offer headline')}}">
                                                    <span class="text-danger"><strong>{{ $errors->first('headline') }}</strong></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-xl-12 mb-xl-0">
                                        <div class="cp-user-payment-type mb-3">
                                            <h3>{{__('Terms of the trade (Optional)')}}</h3>
                                            <textarea name="terms" class="form-control" id="" cols="30" rows="10">{{$item->terms}}</textarea>
                                        </div>
                                        <div class="cp-user-payment-type mb-3">
                                            <h3>{{__('Trading instructions (Optional)')}}</h3>
                                            <textarea name="instruction" class="form-control" id="" cols="30" rows="10">{{$item->instruction}}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <button id="buy_button" type="submit" class="btn theme-btn">{{__('Update')}}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script>
        $(document).ready(function(){
            converted_price_in_currency();
        })
        $('#country').on('change', function () {
            var country_id = $(this).val();

            $.ajax({
                type: "POST",
                url: "{{route('getCountryPaymentMethod')}}",
                data: {
                    '_token': "{{csrf_token()}}",
                    'country': country_id
                },
                dataType: 'JSON',

                success: function (data) {
                    $('#select-payment-method').html("<option value=''>{{__('Select Payment Method')}}</option>" + data.data)
                    $('#select-payment-method').selectpicker('refresh');
                }
            })
        });

        function call_coin_payment(coin_type)
        {
            if(coin_type == '{{DEFAULT_COIN_TYPE}}') {
                $('#dynamicRates').hide();
            } else {
                $('#dynamicRates').show();
            }
        }

        $('#total_amount').keyup(function(){
            converted_price_in_currency();
        });

        function converted_price_in_currency()
        {
            var coinType = $("input[name='coin_type']:checked").val();
            var currency = $('#number-multiple').find(":selected").val();
            var total_amount = $('#total_amount').val();

            $.ajax({
                    type: "POST",
                    url: "{{route('getDynamicCoinPriceInCurrency')}}",
                    data: {
                        '_token': "{{csrf_token()}}",
                        'total_amount': total_amount,
                        'coin_type': coinType,
                        'currency': currency
                    },
                    dataType: 'JSON',

                    success: function (data) {
                        if(data.success == true) {
                            $('#converted_price_in_currency').text(data.data);
                        }
                    }
            });
        }
    </script>
@endsection
