<div id="upload_{{($item->id)}}" class="modal fade delete" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header"><h6 class="modal-title">{{__('Upload Payment Slip')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
            <div class="modal-body">
                <p>{{__('If your payment has done then upload your Payment Slip')}}</p>
                <form action="{{route('uploadPaymentSleep')}}" method="POST" enctype="multipart/form-data"
                      id="">
                    @csrf
                    <input type="hidden" name="order_id" value="{{encrypt($item->id)}}">
                    <div class="cp-user-payment-type">
                        <h3>{{__('Payment Slip ')}} </h3>
                        <div id="file-upload" class="section-p">
                            <input type="file" placeholder="0.00" required name="payment_sleep" value=""
                                   id="file" ref="file" class="dropify" />
                        </div>
                    </div>

                    <button type="submit" class=" mt-4 btn theme-btn">{{__('Upload')}}</button>
                </form>
            </div>
            <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__("Close")}}</button>
            </div>
        </div>
    </div>
</div>
<div id="cancel_{{($item->id)}}" class="modal fade delete" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header"><h6 class="modal-title">{{__('Cancel')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
            <div class="modal-body">
                <p>{{__('Do you want to cancel order ?')}}</p>
                <form action="{{route('tradeCancel')}}" method="POST" enctype="multipart/form-data"
                      id="">
                    @csrf
                    <input type="hidden" name="order_id" value="{{encrypt($item->id)}}">
                    <input type="hidden" name="type" @if($type =='seller') value="{{SELLER}}" @else value="{{BUYER}}" @endif>
                    <div class="cp-user-payment-type">
                        <h3>{{__('Reason')}} </h3>
                        <textarea name="reason" required class="form-control"></textarea>
                    </div>
                    <button type="submit" class=" mt-4 btn theme-btn">{{__('Submit')}}</button>
                </form>
            </div>
            <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__("Close")}}</button>
            </div>
        </div>
    </div>
</div>
<div id="report_{{($item->id)}}" class="modal fade delete" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header"><h6 class="modal-title">{{__('Report User')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
            <div class="modal-body">
                <p>{{__('Do you want to report this order ?')}}</p>
                <p class="text-info">
                    {{__('Note : You can able cancel your created report in 15 minutes.')}}
                </p>
                <form action="{{route('reportUserOrder')}}" method="POST" enctype="multipart/form-data"
                      id="">
                    @csrf
                    <input type="hidden" name="order_id" value="{{encrypt($item->id)}}">
                    <input type="hidden" name="type" @if($type =='seller') value="{{SELLER}}" @else value="{{BUYER}}" @endif>
                    <div class="cp-user-payment-type">
                        <h3>{{__('Reason')}} </h3>
                        <textarea name="reason"  class="form-control"></textarea>
                    </div>
                    <div class="cp-user-payment-type mt-3">
                        <h3>{{__('Attachment (if any) ')}} </h3>
                        <div id="file-upload" class="section-p">
                            <input type="file" placeholder="0.00"  name="attach_file" value=""
                                   id="file" ref="file" class="dropify" />
                        </div>
                    </div>
                    <button type="submit" class=" mt-4 btn theme-btn">{{__('Submit')}}</button>
                </form>
            </div>
            <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__("Close")}}</button>
            </div>
        </div>
    </div>
</div>
