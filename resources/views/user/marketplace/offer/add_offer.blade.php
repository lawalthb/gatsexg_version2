@extends('user.master',[ 'menu'=>'offer'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <div class="row">
        <div class="col-xl-12 mb-xl-0 mb-4">
            <div class="card cp-user-custom-card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-8 offset-2">
                            <ul class="nav cp-user-profile-nav" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link {{($qr == 'buy-tab') ? 'active' : ''}}" data-id="buy-tab"
                                       id="buy-tab" data-toggle="pill" href="#pills-buy" role="tab"
                                       aria-controls="pills-buy" aria-selected="true">
                                        <span class="cp-user-img">
                                            <img src="{{asset('assets/user/images/profile-icons/profile.svg')}}"
                                                 class="img-fluid img-normal" alt="">
                                            <img src="{{asset('assets/user/images/profile-icons/active/profile.svg')}}"
                                                 class="img-fluid img-active" alt="">
                                        </span>
                                        {{__('Create BUY Offer')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{($qr == 'sell-tab') ? 'active' : ''}}" data-id="sell-tab"
                                       id="sell-tab" data-toggle="pill" href="#pills-sell" role="tab"
                                       aria-controls="pills-sell" aria-selected="true">
                                <span class="cp-user-img">
                                    <img src="{{asset('assets/user/images/profile-icons/phone-verify.svg')}}"
                                         class="img-fluid img-normal" alt="">
                                    <img src="{{asset('assets/user/images/profile-icons/active/phone-verify.svg')}}"
                                         class="img-fluid img-active" alt=""
                                    ></span>
                                        {{__('Create SELL Offer')}}
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content cp-invite-contact-tab-content" id="pills-tabContent">
                                @include('user.marketplace.offer.include.add_buy_offer')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script src="{{ asset('assets/user/js/validator.js') }}"></script>
    <script>
        $('#buy-tab').click(function(){
            $('#offer_type').val('{{BUY}}');
        })
        $('#sell-tab').click(function(){
            $('#offer_type').val('{{SELL}}');
            $('.highestOrderText').text("{{__('Lowest ')}}")
        })

        function call_coin_payment(coin_type)
        {
            showCoinType(coin_type)
            if(coin_type == '{{DEFAULT_COIN_TYPE}}') {
                $('#dynamicRates').hide();
                $('.static_coin_rate').removeClass('d-none');
                $('.static_coin_rate').addClass('d-block');
            } else {
                $('#dynamicRates').show();
                $('.static_coin_rate').removeClass('d-block');
                $('.static_coin_rate').addClass('d-none');
            }
            let offerType = $('#offer_type').val();
            let currency = $('#currency').find(":selected").val();
            var price_type = $("input[name='price_type']:checked").val();
            if (currency) {
                getMarketOfferPriceData(offerType,coin_type,currency)
                if(price_type == 1 || price_type == 2)
                {
                    getDynamicMarketPrice(price_type,coin_type,currency,0);
                    $('#rate_percentage').val(0);
                }
                
            }
        }
        function showCoinType(coinType){
            $('.coinType').text(coinType)
        }

        function getMarketOfferPriceData(offerType,coinType,currency) {
            $.ajax({
                type: "POST",
                url: "{{route('getMarketOfferPrice')}}",
                data: {
                    '_token': "{{csrf_token()}}",
                    'offer_type': offerType,
                    'coin_type': coinType,
                    'currency': currency,
                },
                dataType: 'JSON',

                success: function (data) {
                    if(data.success == true) {
                        if(data.data.offer_type == 1) {
                            $('#highestOrderPrice').text(data.data.rate);
                        } else {

                        }
                        $('.currency').text(data.data.currency);
                    } else {
                        console.log(data)
                    }
                }
            })
        }
        $("#currency").on('change',function(){
            var coin_type = $("input[name='coin_type']:checked").val();
            let currency = $('#currency').find(":selected").val();
            var price_type = $("input[name='price_type']:checked").val();
            
            if (currency && (price_type == 1 || price_type == 2)) {
                
                getDynamicMarketPrice(price_type,coin_type,currency,0);
                $('#rate_percentage').val(0);
            
            }
        });

        $("input[type=radio][name='price_type']").on('change',function(){
            var coin_type = $("input[name='coin_type']:checked").val();
            let currency = $('#currency').find(":selected").val();
            var price_type = $("input[name='price_type']:checked").val();
            if (currency && (price_type == 1 || price_type == 2)) {
                
                getDynamicMarketPrice(price_type,coin_type,currency,0);
                $('#rate_percentage').val(0);
            
            }
        });

        $('#rate_percentage').focusin(function(){
            var price_type = $("input[name='price_type']:checked").val();
            var coinType = $("input[name='coin_type']:checked").val();
            var currency = $('#currency').find(":selected").val();
            
            if(typeof coinType === "undefined")
            {
                VanillaToasts.create({
                        text: '{{__("Please, Select asset First!")}}',
                        type: 'warning',
                        timeout: 4000
                    });
                    $('#rate_percentage').blur();
            }else if(currency.length === 0 )
            {
                VanillaToasts.create({
                        text: '{{__("Please, Select currency First!")}}',
                        type: 'warning',
                        timeout: 4000
                    });
                    $('#rate_percentage').blur();

            }else if(price_type !=1 && price_type != 2)
            {
                VanillaToasts.create({
                    text: '{{__("Please, Select dynamic market price First!")}}',
                    type: 'warning',
                    timeout: 4000
                });
                $('#rate_percentage').blur();
            }

        });

        $('#rate_percentage').keyup(function(){
            var price_type = $("input[name='price_type']:checked").val();
            var coinType = $("input[name='coin_type']:checked").val();
            var currency = $('#currency').find(":selected").val();
            var rate_percentage = $('#rate_percentage').val();

            if(rate_percentage < 0)
            {
                VanillaToasts.create({
                    text: '{{__("Percentage can not be less than 0")}}',
                    type: 'warning',
                    timeout: 4000
                });
                $('#rate_percentage').val(0);
                rate_percentage = 0;
            }

            if(rate_percentage > 100)
            {
                VanillaToasts.create({
                    text: '{{__("Percentage can not be greater than 100")}}',
                    type: 'warning',
                    timeout: 4000
                });
                
                $('#rate_percentage').val(0);
                rate_percentage = 0;
            }

            if(
                (price_type == 1 || price_type == 2) &&
                typeof coinType !== "undefined" &&
                currency.length !== 0 &&
                rate_percentage.length !== 0 
            )
            { 
                getDynamicMarketPrice(price_type,coinType,currency,rate_percentage);
            }
            
        });

        function getDynamicMarketPrice(price_type,coinType,currency,rate_percentage)
        {
            $.ajax({
                    type: "POST",
                    url: "{{route('getDynamicCoinPrice')}}",
                    data: {
                        '_token': "{{csrf_token()}}",
                        'price_type': price_type,
                        'coin_type': coinType,
                        'currency': currency,
                        'rate_percentage': rate_percentage
                    },
                    dataType: 'JSON',

                    success: function (data) {
                        if(data.success == true) {
                            $('#dynamic_coin_price').text(data.data);
                        }
                    }
            });
        }

        $('#total_amount').keyup(function(){
            var coinType = $("input[name='coin_type']:checked").val();
            var currency = $('#currency').find(":selected").val();
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
        });
        
    </script>
    @include('user.marketplace.offer.include.add_buy_offer_validation')
    @include('user.marketplace.offer.include.add_buy_offer_js')
@endsection
