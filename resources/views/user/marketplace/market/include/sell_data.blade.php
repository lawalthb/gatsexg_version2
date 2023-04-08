<tr>
    <td>
        <h4><a href="{{route('userTradeProfile',$sell->user->unique_code)}}">{{$sell->user->username}}</a></h4>
        <p class="mute"> {{count_orders($sell->user->id)}} {{__(' orders')}}</p>
        <p class="mute"> {{trade_percent($sell->user->id)}} {{__('% success rate')}}</p>
    </td>

    <td>
        <p class="normal">{{__('Location')}}</p>
        <p class="mute">{{countrylist($sell->country)}}</p>
    </td>
    <td>
        <p class="normal">  {{__('Available')}}</p>
        <p class="mute">  {{bcsub($sell->amount,$sell->sold_amount,8)}} {{ check_default_coin_type($sell->coin_type) }}</p>
        <p class="normal">  {{__('Limit')}}</p>
        <p class="mute">{{number_format($sell->minimum_trade_size,2). ' '.$sell->currency }} {{__(' to ')}} {{number_format($sell->maximum_trade_size,2). ' '.$sell->currency }}</p>
    </td>
    <td>
        <p class="normal">{{__('Price')}}</p>
        @if($sell->rate_type == RATE_TYPE_DYNAMIC)
            <p class="mute">{{number_format($sell->coin_rate,2).' '.$sell->currency}}</p>
            <p class="mute"> {{number_format($sell->rate_percentage,2)}} % {{price_rate_type($sell->price_type)}} {{__(' Market')}}</p>

        @else
            <p class="normal">{{number_format($sell->coin_rate,2).' '.$sell->currency}}</p>
            <p class="mute">  {{__(' Static Rate')}}</p>
        @endif
    </td>
    <td>
        <p class="normal">{{__('Payment')}}</p>
        @if(isset($sell->payment($sell->id)[0]))
            <ul class="payment-system-list">
                @foreach($sell->payment($sell->id) as $sell_payment)
                    @if($country == 'any')
                        <li>
                            <p class="mute"><span><img width="20" src="{{$sell_payment->payment_method->image}}" alt=""></span>{{ $sell_payment->payment_method->name}}</p>
                        </li>
                    @elseif(is_accept_payment_method($sell_payment->payment_method_id,$country))
                        <li>
                            <p class="mute"><span><img width="20" src="{{$sell_payment->payment_method->image}}" alt=""></span>{{ $sell_payment->payment_method->name}}</p>
                        </li>
                    @endif
                @endforeach
            </ul>
        @endif
    </td>
    <td class="text-right">
        <a href="{{route('openTrade',['buy',$sell->unique_code])}}"><button class="btn theme-btn">{{__('Buy Now')}}</button></a>
    </td>
</tr>
