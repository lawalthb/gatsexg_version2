@include('user.marketplace.market.order.status_header')
<div class="row">
    <div class="col-12">
        @if($item->status == TRADE_STATUS_PAYMENT_EXPIRED)
            <div class="cp-user-card-header-area">
                <div class="title">
                    <h3 id="list_title2" class="text-danger">{{__('Payment Time expired, the order cancelled')}}</h3>
                </div>
            </div>
        @endif
        @if($item->status == TRADE_STATUS_TRANSFER_DONE)
            <div class="cp-user-card-header-area">
                <div class="title">
                    <h3 id="list_title2" class="text-success">{{__('Transaction Successful')}}</h3>
                </div>
            </div>
            @include('user.marketplace.market.order.feedback')
        @endif

        @if($item->is_reported == STATUS_ACTIVE)
            @if(isset($report))
                <div class="cp-user-card-header-area mt-1">
                    <div class="row w-100 dispute-area">
                        <div class="col-md-8">
                            <div class="title">
                                <h4 id="list_title2" class="text-danger">
                                    @if($report->type == BUYER) {{__('The buyer ')}} @else {{__('The seller ')}} @endif {{__(' reported against order.')}}
                                </h4>
                                @if(!empty($item->transaction_id))
                                    <h5 class="text-warning">{{ $item->transaction_id }}</h5>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-4">
                                <a href="{{route('disputeDetails', $report->unique_code)}}" class="btn btn-sm btn-info">{{__('View Dispute')}}</a>
                                @if($report->reported_user == Auth::id() && $cancelTimeCheck)
                                    <a href="{{route('disputTradeCancel', $item->unique_code)}}" class="btn btn-sm btn-danger">{{__('Cancel Dispute')}}</a>
                                @endif
                        </div>
                    </div>
                </div>           
            @endif
        @else
            <ul class="">
                @if($type == 'seller')
                   @include('user.marketplace.market.order.include.status_action_seller')
                @endif
                @if($type == 'buyer')
                    @include('user.marketplace.market.order.include.status_action_buyer')
                @endif
            </ul>
        @endif
    </div>
</div>
@include('user.marketplace.market.order.include.status_action_modal')


@push('custom-scripts')
<script>

</script>
@endpush
