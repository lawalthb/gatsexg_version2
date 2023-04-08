<tr>
    <td>
        <h4><a href="{{route('userTradeProfile',$buy->user->unique_code)}}">{{$buy->user->username}}</a></h4>
        <p class="mute"> {{count_orders($buy->user->id)}} {{__(' orders')}}</p>
        <p class="mute"> {{trade_percent($buy->user->id)}} {{__(' % success rate')}}</p>
    </td>

    <td>
        <p class="normal">{{__('Location')}}</p>
        <p class="mute">{{countrylist($buy->country)}}</p>
    </td>
    <td>
        <p class="normal">  {{__('Available')}}</p>
        <p class="mute">  {{bcsub($buy->amount,$buy->sold_amount,8)}} {{ check_default_coin_type($buy->coin_type) }}</p>
        <p class="normal">  {{__('Limit')}}</p>
        <p class="mute">{{number_format($buy->minimum_trade_size,2). ' '.$buy->currency }} {{__(' to ')}} {{number_format($buy->maximum_trade_size,2). ' '.$buy->currency }}</p>
    </td>
    <td>
        <p class="normal">{{__('Price')}}</p>
        @if($buy->rate_type == RATE_TYPE_DYNAMIC)
            <p class="mute">{{number_format($buy->coin_rate,2).' '.$buy->currency}}</p>
            <p class="mute"> {{number_format($buy->rate_percentage,2)}} % {{price_rate_type($buy->price_type)}} {{__(' Market')}}</p>

        @else
            <p class="normal">{{number_format($buy->coin_rate,2).' '.$buy->currency}}</p>
            <p class="mute">  {{__(' Static Rate')}}</p>
        @endif
    </td>
    <td>
        <p class="normal">{{__('Payment')}}</p>
        @if(isset($buy->payment($buy->id)[0]))
            <ul class="payment-system-list">
                @foreach($buy->payment($buy->id) as $buy_payment)
                    @if($country == 'any')
                        <li>
                            <p class="mute"><span><img width="20" src="{{$buy_payment->payment_method->image}}" alt=""></span>{{ $buy_payment->payment_method->name}}</p>
                        </li>
                    @elseif(is_accept_payment_method($buy_payment->payment_method_id,$country))
                        <li>
                            <p class="mute"><span><img width="20" src="{{$buy_payment->payment_method->image}}" alt=""></span>{{ $buy_payment->payment_method->name}}</p>
                        </li>
                    @endif
                @endforeach
            </ul>
        @endif
    </td>
    <td class="text-right">
        <a href="{{route('openTrade',['sell',$buy->unique_code])}}"><button class="btn theme-btn">{{__('Sell Now')}}</button></a>
    </td>
</tr>
