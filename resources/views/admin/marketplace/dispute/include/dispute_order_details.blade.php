<div class="col-12">
                <div class="header-bar p-4">
                    <div class="table-title">
                        <h3>{{ __('Order Details') }}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-info-table">
                    <ul>
                        <li>
                            <span>{{__('Buyer')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{$item->buyer->first_name.' '.$item->buyer->last_name}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Order Id')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{$item->order_id}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Order Type')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{buy_sell($item->type)}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Crypto Coin Type')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{check_default_coin_type($item->coin_type)}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Payment method')}}</span>
                            <span class="dot">:</span>
                            <span>
                                <img width="25" src="{{$item->payment_method->image}}" alt="">
                                {{ $item->payment_method->name}}
                            </span>
                        </li>
                        <li>
                            <span>{{__('Payment Status')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{paymentStatus($item->payment_status)}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Payment Sleep')}}</span>
                            <span class="dot">:</span>
                            <span>
                                @if($item->payment_status == STATUS_ACTIVE)
                                    <a href="{{asset(path_image().$item->payment_sleep)}}" target="_blank">
                                        <img src="{{asset(path_image().$item->payment_sleep)}}" alt="" width="50">
                                    </a>
                                @else
                                    {{__('Not submited')}}
                                @endif
                            </span>
                        </li>
                        <li>
                            <span>{{__('Dispute Status')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{trade_order_dispute($item->is_reported)}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Transaction id')}}</span>
                            <span class="dot">:</span>
                            <span>{{$item->transaction_id}}</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-info-table">
                    <ul>
                        <li>
                            <span>{{__('Seller')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{$item->seller->first_name.' '.$item->seller->last_name}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Current Status')}}</span>
                            <span class="dot">:</span>
                            <span>{{trade_order_status($item->status)}}</span>
                        </li>
                        <li>
                            <span>{{__('Coin Rate ')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{number_format($item->rate,2).' '.$item->currency}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Coin Amount ')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{$item->amount.' '.check_default_coin_type($item->coin_type)}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Coin Price ')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{number_format($item->price,8).' '.$item->currency}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Coin Fees ')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{$item->fees.' '.check_default_coin_type($item->coin_type)}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Escrowed Amount')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{trade_escrow($item->id)['amount']}}</strong></span>
                        </li>
                        <li>
                            <span>{{__('Escrowed Fees')}}</span>
                            <span class="dot">:</span>
                            <span><strong>{{trade_escrow($item->id)['fees']}}</strong></span>
                        </li>
                    </ul>
                </div>
            </div>
