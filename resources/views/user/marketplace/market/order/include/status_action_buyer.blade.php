
@if($item->status == TRADE_STATUS_ESCROW)
    <li class="deleteuser mr-3 payment-data-order">
        <p><i class="fa fa-hand-o-right"></i> {{__("Transfer the funds to the sellers account")}}</p>
        <p><i class="fa fa-hand-o-right"></i> {{__('After transferring the funds, click on the "Transferred, notify seller" button')}}</p>
        <p class="font-weight-bold mt-2">{{__('Please confirm that you have successfully transferred the money to the seller through the following payment method')}}</p>

        <div class="row mt-5 mb-5">

                @if(isset($payment_details))
                <div class="col-md-6">
                    <p class="font-weight-bold"><i class="fa fa-hand-o-right"></i> {{__('Name ')}} : <span class="text-warning">{{$payment_details->name}}</span></p>
                    <p class="font-weight-bold"><i class="fa fa-hand-o-right"></i> {{__('Account Name ')}} : <span class="text-warning">{{$payment_details->account_name}}</span></p>
                    <p class="font-weight-bold"><i class="fa fa-hand-o-right"></i> {{__('Account Number ')}} : <span class="text-warning">{{$payment_details->account_number}}</span></p>
                </div>
                @endif

            <div class="col-md-6">
                @if($item->payment_expired_time !== NULL)
                    <h5>
                        <span class="time_count_here text-danger"></span><span class="seconds_spam text-danger"></span>

                    </h5>
                    {{-- <p class="text-warning mt-2">{{__('Please make a payment within 15:00 mins, otherwise the order will be cancelled')}}</p> --}}
                    <p class="text-warning mt-2"><span id="buyer_counter"></span></p>
                @endif
            </div>
            <div class="col-md-12">
                <div class="cp-user-card-header-area">
                <div class="title margin_h">
                    <h4 id="list_title2"><b>{{__('Payment Method Details')}}</b>:</h4>
                    @if (isset($item->payment_details))
                        <h4 id="list_title2"> <span>{{__('User Name')}} :</span> <span id="user_name">{{$item->payment_details->user_name}}</span>
                            <span class="ml-2"><a class="btn btn-warning" title="{{__('copy')}}" href="javascript:" onclick="copyBankDetails('user_name')"><i class="fa fa-copy"></i></a></span>
                        </h4>
                        @if ($item->payment_details->payment_type == PAYMENT_TYPE_BANK)
                            <h4 id="list_title2"> <span>{{__('Bank Name')}} :</span> <span id="bank_name">{{$item->payment_details->bank_name}}</span>
                                <span class="ml-2"><a class="btn btn-warning" title="{{__('copy')}}" href="javascript:" onclick="copyBankDetails('bank_name')"><i class="fa fa-copy"></i></a></span>
                            </h4>
                            <h4 id="list_title2"> <span>{{__('Bank Accounnt Number')}} :</span> <span id="bank_account_number">{{$item->payment_details->bank_account_number}}</span>
                                <span class="ml-2"><a class="btn btn-warning" title="{{__('copy')}}" href="javascript:" onclick="copyBankDetails('bank_account_number')"><i class="fa fa-copy"></i></a></span>
                            </h4>
                            <h4 id="list_title2"> <span>{{__('Bank Branch')}} :</span> {{$item->payment_details->bank_opening_branch_name}}</h4>
                        @elseif($item->payment_details->payment_type == PAYMENT_TYPE_MOBILE_ACCOUNT)
                            <h4 id="list_title2"><span>{{__('Mobile Account Number')}} :</span> <span id="mobile_account_number">{{$item->payment_details->mobile_account_number}}</span> 
                                <span class="ml-2"><a class="btn btn-warning" title="{{__('copy')}}" href="javascript:" onclick="copyBankDetails('mobile_account_number')"><i class="fa fa-copy"></i></a></span>
                            </h4>
                            
                        @elseif($item->payment_details->payment_type == PAYMENT_TYPE_CARD)
                            <h4 id="list_title2"><span>{{__('Card Type')}} :</span> {{$item->payment_details->card_type}}</h4>
                            <h4 id="list_title2"><span>{{__('Card Number')}} :</span> <span id="card_number">{{$item->payment_details->card_number}}</span>
                                <span class="ml-2"><a class="btn btn-warning" title="{{__('copy')}}" href="javascript:" onclick="copyBankDetails('card_number')"><i class="fa fa-copy"></i></a></span>
                            </h4>
                        @endif
                    @else
                        <h4 id="list_title2" class="text-warning">{{__('Payment details not found')}}</h4>
                    @endif
                </div>
                </div>
            </div>
        </div>
        <a title="{{__('Upload Payment Slip')}}" href="#upload_{{($item->id)}}" data-toggle="modal">
            <button class="btn theme-btn">{{__('Transferred, notify seller')}}</button>
        </a>
        
        @if($item->payment_expired_time !== NULL)
            <a title="{{__('Cancel Trade')}}" href="#cancel_{{($item->id)}}" data-toggle="modal">
                <button class="btn theme-btn text-warning">{{__('Cancel')}}</button>
            </a>

            <a class="disabled disabled-btnn">
                <button class="btn btn-default text-warning">{{__('Appeal')}}</button>
            </a>
        @else
            <a title="{{__('Open Dispute')}}" href="#report_{{($item->id)}}" data-toggle="modal">
                <button class="btn btn-default text-warning">{{__('Appeal')}}</button>
            </a>
        @endif
    </li>
@endif
@if($item->status == TRADE_STATUS_PAYMENT_DONE)
    <li class="deleteuser mr-3">
        <a title="{{__('Open Dispute')}}" href="#report_{{($item->id)}}" data-toggle="modal">
            <button class="btn btn-default text-warning">{{__('Appeal')}}</button>
        </a>
    </li>
@endif
