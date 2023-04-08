@extends('user.master',['menu' => 'offer'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <div class="card cp-user-custom-card cp-user-deposit-card">
        <div class="row">
            <div class="col-sm-12">
                <div class="wallet-inner">
                    <div class="wallet-content card-body">
                        <div class="wallet-top cp-user-card-header-area">
                            <div class="title">
                                <div class="wallet-title text-center">
                                    <h4>
                                        <a href="{{route('createOffer')}}"><button class="btn theme-btn">{{__('Create Offer')}}</button></a>
                                    </h4>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade  show active in"
                                 id="activity" role="tabpanel" aria-labelledby="activity-tab">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="activity-area">
                                            <div class="activity-top-area">
                                                <div class="cp-user-card-header-area">
                                                    <div class="title">
                                                        <h4 id="list_title">{{__('All Buy Offer List')}}</h4>
                                                    </div>
                                                    <div class="deposite-tabs cp-user-deposit-card">
                                                        <div class="activity-right text-right">
                                                            <ul class="nav cp-user-profile-nav mb-0">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" data-toggle="tab" onclick="$('#list_title').html('All Buy Offer List')" data-title="" href="#Deposit">{{__('Buy Offer')}}</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a class="nav-link" data-toggle="tab" onclick="$('#list_title').html('All Sell Offer List')" href="#Withdraw">{{__('Sell Offer')}}</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="activity-list">
                                                <div class="tab-content">
                                                    <div id="Deposit" class="tab-pane fade active show">

                                                        <div class="cp-user-wallet-table table-responsive">
                                                            <table class="table" id="table_buy">
                                                                <thead>
                                                                <tr>
                                                                    <th>{{__('Buying Coin Type')}}</th>
                                                                    <th>{{__('Headline')}}</th>
                                                                    <th>{{__('Location')}}</th>
                                                                    <th>{{__('Rate')}}</th>
                                                                    <th>{{__('Status')}}</th>
                                                                    <th>{{__('Created At')}}</th>
                                                                    <th class="all">{{__('Actions')}}</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                @if(isset($buys[0]))
                                                                    @foreach($buys as $buy)
                                                                        <tr>
                                                                            <td>{{check_default_coin_type($buy->coin_type)}}</td>
                                                                            <td>{{\Illuminate\Support\Str::limit($buy->headline,10)}}</td>
                                                                            <td>{{countrylist($buy->country)}}</td>
                                                                            <td>
                                                                                @if($buy->rate_type == RATE_TYPE_DYNAMIC)
                                                                                    {{number_format($buy->rate_percentage,2)}} % {{price_rate_type($buy->price_type)}} {{__(' Market')}}
                                                                                @else
                                                                                    {{$buy->coin_rate.' '.$buy->currency}}
                                                                                @endif
                                                                            </td>
                                                                            <td>{{offer_active_status($buy->status)}}</td>
                                                                            <td>{{$buy->created_at}}</td>
                                                                            <td>
                                                                                <ul class="d-flex activity-menu">
                                                                                    @if ($buy->status == STATUS_ACTIVE)
                                                                                        <li class="viewuser"><a title="{{__('Edit')}}" href="{{route('editOffer', [($buy->unique_code), BUY])}}"><i class="fa fa-pencil"></i></a></li>

                                                                                        <li class="deleteuser">
                                                                                            <a class="text-danger" title="{{__('Delete')}}" href="#active_buy{{($buy->id)}}" data-toggle="modal">
                                                                                                <i class="fa fa-trash"></i>
                                                                                            </a>
                                                                                        </li>
                                                                                        <div id="active_buy{{($buy->id)}}" class="modal delete" role="dialog">
                                                                                            <div class="modal-dialog modal-md">
                                                                                                <div class="modal-content">
                                                                                                    <div class="modal-header"><h6 class="modal-title">{{__('Delete')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
                                                                                                    <div class="modal-body"><p>{{__('Do you want to delete it ?')}}</p></div>
                                                                                                    <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__("Close")}}</button>
                                                                                                        <a class="btn btn-danger" href="{{route('deleteOffer', [($buy->unique_code), BUY, $buy->coin_type])}}">{{__('Confirm')}}</a>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    @else
                                                                                        <span class="text-danger">{{__('N/A')}}</span>
                                                                                    @endif
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    @endforeach
                                                                @else
                                                                    <tr>
                                                                        <td colspan="7" class="text-center">{{__('No data available')}}</td>
                                                                    </tr>
                                                                @endif
                                                                </tbody>
                                                            </table>
                                                            @if(isset($buys[0]))
                                                                <div class="pull-right address-pagin">
                                                                    {{ $buys->appends(request()->input())->links() }}
                                                                </div>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    <div id="Withdraw" class="tab-pane fade">

                                                        <div class="cp-user-wallet-table table-responsive">
                                                            <table class="table" id="table_sell">
                                                                <thead>
                                                                <tr>
                                                                    <th>{{__('Selling Coin Type')}}</th>
                                                                    <th>{{__('Headline')}}</th>
                                                                    <th>{{__('Location')}}</th>
                                                                    <th>{{__('Rate')}}</th>
                                                                    <th>{{__('Status')}}</th>
                                                                    <th>{{__('Created At')}}</th>
                                                                    <th class="all">{{__('Actions')}}</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                @if(isset($sells[0]))
                                                                    @foreach($sells as $sell)
                                                                        <tr>
                                                                            <td>{{check_default_coin_type($sell->coin_type)}}</td>
                                                                            <td>{{\Illuminate\Support\Str::limit($sell->headline,10)}}</td>
                                                                            <td>{{countrylist($sell->country)}}</td>
                                                                            <td>
                                                                                @if($sell->rate_type == RATE_TYPE_DYNAMIC)
                                                                                    {{number_format($sell->rate_percentage,2)}} % {{price_rate_type($sell->price_type)}} {{__(' Market')}}
                                                                                @else
                                                                                    {{number_format($sell->coin_rate,2).' '.$sell->currency}}
                                                                                @endif
                                                                            </td>
                                                                            <td>{{offer_active_status($sell->status)}}</td>
                                                                            <td>{{$sell->created_at}}</td>
                                                                            <td>
                                                                                <ul class="d-flex activity-menu">
                                                                                    @if ($sell->status == STATUS_ACTIVE)
                                                                                        <li class="viewuser"><a title="{{__('Edit')}}" href="{{route('editOffer', [($sell->unique_code), SELL])}}"><i class="fa fa-pencil"></i></a></li>

                                                                                        <li class="deleteuser">
                                                                                            <a class="text-danger" title="{{__('Delete')}}" href="#active_sell{{($sell->id)}}" data-toggle="modal">
                                                                                                <i class="fa fa-trash"></i>
                                                                                            </a>
                                                                                        </li>
                                                                                        <div id="active_sell{{($sell->id)}}" class="modal fade delete" role="dialog">
                                                                                            <div class="modal-dialog modal-md">
                                                                                                <div class="modal-content">
                                                                                                    <div class="modal-header"><h6 class="modal-title">{{__('Delete')}}</h6><button type="button" class="close" data-dismiss="modal">&times;</button></div>
                                                                                                    <div class="modal-body"><p>{{__('Do you want to delete it ?')}}</p></div>
                                                                                                    <div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">{{__("Close")}}</button>
                                                                                                        <a class="btn btn-danger" href="{{route('deleteOffer', [($sell->unique_code), SELL, $sell->coin_type])}}">{{__('Confirm')}}</a>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    @else
                                                                                        <span class="text-danger">{{__('N/A')}}</span>
                                                                                    @endif
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    @endforeach
                                                                @else
                                                                    <tr>
                                                                        <td colspan="7"
                                                                            class="text-center">{{__('No data available')}}</td>
                                                                    </tr>
                                                                @endif
                                                                </tbody>
                                                            </table>
                                                            @if(isset($sells[0]))
                                                                <div class="pull-right address-pagin">
                                                                    {{ $sells->appends(request()->input())->links() }}
                                                                </div>
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
            </div>
        </div>
    </div>
@endsection

@section('script')

<script>

    $("#table_buy").dataTable();
    $("#table_sell").dataTable();

</script>

@endsection
