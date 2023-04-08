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
                                            <h4 id="list_title2"><a href="{{route('marketPlace')}}">{{__(' My Trades ')}}</a> ->
                                                <span>{{__('Order Id ')}} -> <a href="{{ route('tradeDetails', $report->order->order_id) }}">{{$report->order->order_id}}</a></span>
                                            </h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-5">
                                            <h3 class="mt-3">
                                                <a href="{{ route('userTradeProfile',$report->reporting_user->unique_code) }}">{{ $report->reported_user_name }}</a>
                                                {{__(' created dispute against order.')}}
                                            </h3>
                                            <h4 class="mt-2">{{__('Assigned Admin : ')}} {{  $assigned_admin_name ?? __('Pending for assigning admin') }}</h4>
                                            <h4 class="mt-2">{{__('Order Status : ')}} {!!  trade_order_status_web($report->order->status) !!}</h4>
                                            <h4 class="mt-2">{{__('Dispute Status : ')}} {!!  trade_dispute_status_web($report->status) !!}</h4>
                                        </div>
                                        <div class="col-xl-7">
                                            <div class="dispute-details">
                                                <h4 class="mt-3">{{__('Reason :')}}</h4>
                                                <h6 class="mt-1">{{$report->reason_heading}}</h6>
                                                <p class="mt-3">{{$report->details}}</p>
                                                <p class="pb-0 mb-0 border-0"><strong>{{__('Attachment')}}</strong></p>
                                                @if(!empty($report->image))
                                                    <img src="{{asset(path_image().$report->image)}}" alt="" width="400">
                                                @endif
                                            </div>
                                        </div>
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

@endsection
