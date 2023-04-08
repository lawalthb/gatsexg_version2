<div class="row">
    <div class="col-xl-4 col-md-6 col-12 mb-xl-0 mb-4">
        <div class="card status-card status-card-bg-blue">
            <div class="card-body py-0">
                <div class="status-card-inner">
                    <div class="content">
                        <p>{{__(' Active Coin')}}</p>
                        <h3>{{$total_coin_type}}</h3>
                    </div>
                    <div class="icon">
                        <img src="{{asset('assets/user/images/status-icons/money.svg')}}" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-md-6 col-12">
        <div class="card status-card status-card-bg-average">
            <div class="card-body py-0">
                <div class="status-card-inner">
                    <div class="content">
                        <p>{{__('Total User Coin')}}</p>
                        <h3>{{number_format($total_coin,2)}}</h3>
                    </div>
                    <div class="icon">
                        <img src="{{asset('assets/user/images/status-icons/money.svg')}}" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-md-6 col-12">
        <div class="card status-card status-card-bg-read">
            <div class="card-body py-0">
                <div class="status-card-inner">
                    <div class="content">
                        <p>{{__('Total User')}}</p>
                        <h3>{{$total_user}}</h3>
                    </div>
                    <div class="icon">
                        <img src="{{asset('assets/user/images/status-icons/team.svg')}}" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row mt-4">
    <div class="col-xl-4 col-md-6 col-12 mb-xl-0 mb-4">
        <div class="card status-card status-card-bg-yellow">
            <div class="card-body py-0">
                <div class="status-card-inner">
                    <div class="content">
                        <p>{{__('Total Income From Withdrawal')}}</p>
                        <h3>{{$withdrawal_income}}</h3>
                    </div>
                    <div class="icon">
                        <img src="{{asset('assets/user/images/status-icons/money.svg')}}" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-md-6 col-12">
        <div class="card status-card status-card-bg-orange">
            <div class="card-body py-0">
                <div class="status-card-inner">
                    <div class="content">
                        <p>{{__('Total Income From Order')}}</p>
                        <h3>{{ $order_income }}</h3>
                    </div>
                    <div class="icon">
                        <img src="{{asset('assets/user/images/status-icons/money.svg')}}" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-md-6 col-12">
        <div class="card status-card status-card-bg-average ">
            <div class="card-body py-0">
                <div class="status-card-inner">
                    <div class="content">
                        <p>{{__('Total Income From Escrow')}}</p>
                        <h3>{{$escrow_income}}</h3>
                    </div>
                    <div class="icon">
                        <img src="{{asset('assets/user/images/status-icons/money.svg')}}" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
