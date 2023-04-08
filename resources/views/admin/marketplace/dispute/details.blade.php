@extends('admin.master',['menu'=>'order', 'sub_menu'=>$sub_menu])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-9">
                <ul>
                    <li>{{__('Crypto Exchange')}}</li>
                    <li class="active-item">{{ $title }}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->

    <!-- User Management -->
    <div class="user-management">
        <div class="row">
            @include('admin.marketplace.dispute.include.assign_admin')
        </div>
        <div class="row mt-2">
            @include('admin.marketplace.dispute.include.dispute_order_details')
        </div>

        <div class="row">
            @if(isset($dispute) && ($dispute->assigned_admin == Auth::id()))
            <div class="col-12">
                <div class="header-bar p-4">
                    <div class="table-title">
                        <h3>{{ __('Dispute Details') }}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-info-table ml-5">
                    <p class="pb-0 mb-0 border-0"><strong>{{__('Reported User')}}</strong></p>
                    <p class="pb-0 mb-0 border-0">{{$dispute->reporting_user->first_name.' '.$dispute->reporting_user->last_name}}</p>

                    <p class="pb-0 mb-0 border-0"><strong>{{__('Reason')}}</strong></p>
                    <p class="pb-0 mb-0 border-0">
                        {{$dispute->reason_heading}}<br>
                        {{$dispute->details}}
                    </p>
                    <p class="pb-0 mb-0 border-0"><strong>{{__('Attachment')}}</strong></p>
                    <p class="pb-0 mb-0 border-0">
                        <img src="{{asset(path_image().$dispute->image)}}" alt="" width="400">
                    </p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row dispute-status-btn">
                    @if($item->status == TRADE_STATUS_ESCROW || $item->status == TRADE_STATUS_PAYMENT_DONE)
                        <div class="col-md-4">
                            <p class="text-danger text-justify">{{__(" Analysis the current situation you can cancel this dispute, then again buyer and seller can take action")}}</p><br>
                            <a href="#cancel" data-toggle="modal" class="btn btn-danger" >{{__('Cancel Dispute')}}</a>
                        </div>
                        <div class="col-md-4">
                            <p class="text-danger text-justify">{{__(" Analysis the current situation you can refund the escrow amount to seller.")}}</p><br>
                            <a href="#refund" data-toggle="modal" class="btn btn-warning" >{{__('Refund Escrow')}}</a>

                        </div>
                    @endif
                    @if($item->status == TRADE_STATUS_PAYMENT_DONE)
                        <div class="col-md-4">
                            <p class="text-danger text-justify">{{__("Analysis the current situation you can release the escrow amount to buyer.")}}</p><br>
                            <a href="#release" data-toggle="modal"class="btn btn-success" >{{__('Release Escrow')}}</a>
                        </div>
                    @endif
                </div>
            </div>
            @endif
        </div>
    </div>
    <!-- /User Management -->
    <div id="cancel" class="modal fade delete" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header"><h6 class="modal-title">{{__('Cancel Dispute')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
                <div class="modal-body"><p>{{__('Are you sure to cancel this dispute ?')}}</p></div>
                <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
                    <a class="btn btn-danger" href="{{route('adminCancelDispute',encrypt($item->id))}}">{{__('Confirm')}}</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /User Management -->
    <div id="refund" class="modal fade delete" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header"><h6 class="modal-title">{{__('Refund Escrow Ammount')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
                <div class="modal-body"><p>{{__('Are you sure to refund escrow amount ?')}}</p></div>
                <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
                    <a class="btn btn-warning" href="{{route('adminRefundEscrow',encrypt($item->id))}}">{{__('Confirm')}}</a>
                </div>
            </div>
        </div>
    </div>
    <div id="release" class="modal fade delete" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header"><h6 class="modal-title">{{__('Release Escrow Amount')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
                <div class="modal-body"><p>{{__('Are you sure to release escrow amount ?')}}</p></div>
                <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
                    <a class="btn btn-success" href="{{route('adminReleaseEscrow',encrypt($item->id))}}">{{__('Confirm')}}</a>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
