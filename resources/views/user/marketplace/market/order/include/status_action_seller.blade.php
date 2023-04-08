@if($item->status == TRADE_STATUS_PAYMENT_DONE)
    <li class="deleteuser mr-3 payment-data-order">
        <p class=" mt-2 mb-4">{{__('Buyer has made a payment, please release the crypto')}}</p>
        <a title="{{__('Confirm release')}}" href="#escrow_{{($item->id)}}" data-toggle="modal">
            <button class="btn theme-btn">{{__('Confirm release')}}</button>
        </a>
        <a title="{{__('Open Dispute')}}" href="#report_{{($item->id)}}" data-toggle="modal">
            <button class="btn btn-default text-warning">{{__('Appeal')}}</button>
        </a>

        <p class="mt-5"><i class="fa fa-hand-o-right"></i> {{__("Please make sure to log in to your account to confirm the payment is received. this can avoid financial losses caused by wrongly clicking on the release button.")}}</p>
        <p><i class="fa fa-hand-o-right"></i> {{__('The digital assets you are selling has been frozen by the platform. Please confirm the receipt of the payment from the buyer and click "release" to release the crypto')}}</p>
        <p><i class="fa fa-hand-o-right"></i> {{__('Please do not agree to any request to release the crypto before confirming the receipt of the payment to avoid financial losses.')}}</p>

    </li>
    <div id="escrow_{{($item->id)}}" class="modal fade delete" role="dialog">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header"><h6 class="modal-title">{{__('Release Escrow')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
                <div class="modal-body"><p>{{__('Do you want to release escrow ?')}}</p></div>
                <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__("Close")}}</button>
                    <a class="btn btn-danger" href="{{route('releasedEscrow', encrypt($item->id))}}">{{__('Confirm')}}</a>
                </div>
            </div>
        </div>
    </div>
@endif
@if($item->status == TRADE_STATUS_ESCROW)
    <li class="deleteuser mr-3 payment-data-order">
        <div class="row">
            <div class="col-md-12">
                @if($item->payment_expired_time !== NULL)
                    <h5>
                        <span class="time_count_here font-weight-bold"></span><span class="seconds_spam"></span>

                        <span id="seller_counter"></span>
                    </h5>
                @endif
                <p class=" mt-2">{{__('Buyer has not paid, please wait patiently')}}</p>
            </div>
        </div>
        @if($item->payment_expired_time !== NULL)
            <a class="disabled disabled-btnn">
                <button class="btn theme-btn">{{__('Confirm release')}}</button>
            </a>
            <a class="disabled disabled-btnn">
                <button class="btn theme-btn">{{__('Cancel')}}</button>
            </a>
            <a class="disabled disabled-btnn">
                <button class="btn btn-default text-warning">{{__('Appeal')}}</button>
            </a>
        @else
            <a title="{{__('Cancel Trade')}}" href="#cancel_{{($item->id)}}" data-toggle="modal">
                <button class="btn theme-btn text-warning">{{__('Cancel')}}</button>
            </a>
            <a title="{{__('Open Dispute')}}" href="#report_{{($item->id)}}" data-toggle="modal">
                <button class="btn btn-default text-warning">{{__('Appeal')}}</button>
            </a>
        @endif
    </li>
@endif
