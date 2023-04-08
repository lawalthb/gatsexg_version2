@extends('user.master',[ 'menu'=>'trade'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <div class="row">
        <div class="col-xl-12 mb-xl-0 mb-4">
            <div class="card cp-user-custom-card">
                <div class="card-body">
                    <div class="cp-user-buy-coin-content-area">
                        <div class="cp-user-coin-info">
                            <div class="row mt-4">
                                <div class="col-sm-12">
                                    <div class="cp-user-card-header-area">
                                        <div class="title">
                                            <h4 id="list_title">{{__('My Trade List')}}</h4>
                                        </div>
                                    </div>
                                    <div class="cp-user-wallet-table table-responsive buy-table">
                                        <div id="button_lists">
                                            <button class="btn theme-btn-active" onclick="getOrderListByType('{{ TRADE_STATUS_TRANSFER_DONE }}',this)">{{ __("Success List") }}</button>
                                            <button class="btn theme-btn" onclick="getOrderListByType('{{ TRADE_STATUS_PAYMENT_DONE }}',this)">{{ __("Pending List") }}</button>
                                            <button class="btn theme-btn" onclick="getOrderListByType('{{ TRADE_STATUS_CANCEL }}',this)">{{ __("Cancel List") }}</button>
                                            <button class="btn theme-btn" onclick="getOrderListByType('{{ TRADE_STATUS_REPORT }}',this)">{{ __("Disput List") }}</button>
                                        </div><hr>
                                        <table id="table">
                                            <thead>
                                            <tr>
                                                <th scope="col">{{__('Date Opened')}}</th>
                                                <th scope="col">{{__('Type')}}</th>
                                                <th scope="col">{{__('Crypto')}}</th>
                                                <th scope="col">{{__('Rate')}}</th>
                                                <th scope="col">{{__('Amount')}}</th>
                                                <th scope="col">{{__('Trade Partner')}}</th>
                                                <th scope="col">{{__('State')}}</th>
                                                <th scope="col">{{__('Action')}}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {{-- @if(isset($items[0]))
                                                @foreach($items as $item)
                                                    <tr>
                                                        <td>{{ date('d M y', strtotime($item->created_at)) }}</td>
                                                        <td>
                                                            @if($item->buyer_id == Auth::id())
                                                                {{__('Buying')}}
                                                            @elseif($item->seller_id == Auth::id())
                                                                {{__('Selling')}}
                                                            @endif
                                                        </td>
                                                        <td>{{ $item->amount.' '.check_default_coin_type($item->coin_type) }}</td>
                                                        <td>{{ $item->fees.' '.check_default_coin_type($item->coin_type) }}</td>
                                                        <td>{{ $item->price.' '.$item->currency }}</td>
                                                        <td>
                                                            @if($item->buyer_id == Auth::id())
                                                                <a href="{{route('userTradeProfile',$item->seller_id)}}"> {{$item->seller->username}} </a>
                                                            @elseif($item->seller_id == Auth::id())
                                                                <a href="{{route('userTradeProfile',$item->buyer_id)}}"> {{$item->buyer->username}} </a>
                                                            @endif
                                                        </td>
                                                        <td>
                                                            @if($item->is_reported == STATUS_ACTIVE)
                                                                <span class="badge badge-danger">{{ __('Disputed') }}</span>
                                                            @else
                                                                {!! trade_order_status_web($item->status) !!}
                                                            @endif
                                                        </td>

                                                        <td>
                                                            <a href="{{route('tradeDetails', ($item->order_id))}}"><button class="btn deme-btn">{{__('View')}}</button></a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            @else
                                                <tr>
                                                    <td colspan="7" class="text-center">{{__('No data available')}}</td>
                                                </tr>
                                            @endif --}}
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
<script>
        
           function getOrderListByType(type,thiss = null) {
                if(thiss){
                    var a = $("#button_lists").children();
                    console.log(a);
                    a.each((c,e) => {
                        $(e).removeAttr("class");
                        $(e).attr("class","btn theme-btn");
                    });
                    $(thiss).removeAttr("class");
                    $(thiss).attr("class","btn theme-btn-active");
                }
                $('#table').DataTable().clear().destroy();
                $('#table').DataTable({
                processing: true,
                serverSide: true,
                pageLength: 10,
                retrieve: true,
                bLengthChange: true,
                responsive: true,
                ajax: '{{route('myTradeList').'?type='}}'+type,
                order: [0, 'desc'],
                autoWidth: false,
                language: {
                    paginate: {
                        next: 'Next &#8250;',
                        previous: '&#8249; Previous'
                    }
                },
                columns: [
                    {"data": "created_at", "orderable": true},
                    {"data": "seller_id", "orderable": false},
                    {"data": "coin_type", "orderable": false},
                    {"data": "rate", "orderable": true},
                    {"data": "amount", "orderable": true},
                    {"data": "buyer_id", "orderable": false},
                    {"data": "status", "orderable": false},
                    {"data": "activity", "orderable": false}
                ],
        });
            }
            getOrderListByType({{ TRADE_STATUS_TRANSFER_DONE }});
        
    </script>
@endsection
