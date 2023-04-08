@extends('admin.master',['menu'=>'dashboard'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-12">
                <ul>
                    <li class="active-item">{{__('Dashboard')}}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->

    <!-- Status -->
    <div class="dashboard-status">
        @include('admin.dashboard.dashboard_card')
    </div>
    <!-- /Status -->
    <div class="user-chart">
        <div class="row">
            <div class="col-lg-6 mb-lg-0 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="card-top">
                            <h4>{{__('Active User')}}</h4>
                        </div>
                        <div id="active-user-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="card-top">
                            <h4>{{__('Inactive User')}}</h4>
                        </div>
                        <div id="deleted-user-chart"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- user chart -->
    <div class="user-chart">
        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <div class="card-top">
                            <h4>{{__('Deposit')}}</h4>
                        </div>
                        <p class="subtitle">{{__('Current Year')}}</p>
                        <canvas id="depositChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                        <div class="card-top">
                            <h4>{{__('Withdrawal')}}</h4>
                        </div>
                        <p class="subtitle">{{__('Current Year')}}</p>
                        <canvas id="withdrawalChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /user chart -->
    <!-- user chart -->
    <div class="user-chart">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-top">
                            <h4>{{__('Trading Report')}}</h4>
                        </div>
                        <p class="subtitle">{{__('Current Year')}}</p>
                        <canvas id="tradeChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script src="{{asset('assets/common/chart/chart.min.js')}}"></script>
    <script>
        // deposit chart
        var ctx = document.getElementById('depositChart').getContext("2d")
        var depositChart = new Chart(ctx, {
            type: 'line',
            yaxisname: "Monthly Deposit",

            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "Monthly Deposit",
                    borderColor: "#1cf676",
                    pointBorderColor: "#1cf676",
                    pointBackgroundColor: "#1cf676",
                    pointHoverBackgroundColor: "#1cf676",
                    pointHoverBorderColor: "#D1D1D1",
                    pointBorderWidth: 4,
                    pointHoverRadius: 2,
                    pointHoverBorderWidth: 1,
                    pointRadius: 3,
                    fill: false,
                    borderWidth: 3,
                    data: {!! json_encode($monthly_deposit) !!}
                }]
            },
            options: {
                legend: {
                    position: "bottom",
                    display: true,
                    labels: {
                        fontColor: '#928F8F'
                    }
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            fontColor: "#928F8F",
                            fontStyle: "bold",
                            beginAtZero: true,
                            // maxTicksLimit: 5,
                            padding: 20
                        },
                        gridLines: {
                            drawTicks: false,
                            display: false
                        }
                    }],
                    xAxes: [{
                        gridLines: {
                            zeroLineColor: "transparent",
                            drawTicks: false,
                            display: false
                        },
                        ticks: {
                            padding: 20,
                            fontColor: "#928F8F",
                            fontStyle: "bold"
                        }
                    }]
                }
            }
        });

        // withdrawal chart
        var ctx = document.getElementById('withdrawalChart').getContext("2d");
        var withdrawalChart = new Chart(ctx, {
            type: 'line',
            yaxisname: "Monthly Withdrawal",

            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "Monthly Withdrawal",
                    borderColor: "#f691be",
                    pointBorderColor: "#f691be",
                    pointBackgroundColor: "#f691be",
                    pointHoverBackgroundColor: "#f691be",
                    pointHoverBorderColor: "#D1D1D1",
                    pointBorderWidth: 4,
                    pointHoverRadius: 2,
                    pointHoverBorderWidth: 1,
                    pointRadius: 3,
                    fill: false,
                    borderWidth: 3,
                    data: {!! json_encode($monthly_withdrawal) !!}
                }]
            },
            options: {
                legend: {
                    position: "bottom",
                    display: true,
                    labels: {
                        fontColor: '#928F8F'
                    }
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            fontColor: "#928F8F",
                            fontStyle: "bold",
                            beginAtZero: true,
                            // maxTicksLimit: 5,
                            // padding: 20,
                            // max: 1000
                        },
                        gridLines: {
                            drawTicks: false,
                            display: false
                        }
                    }],
                    xAxes: [{
                        gridLines: {
                            zeroLineColor: "transparent",
                            drawTicks: true,
                            display: false
                        },
                        ticks: {
                            // padding: 20,
                            fontColor: "#928F8F",
                            fontStyle: "bold",
                            // max: 10000,
                            autoSkip: false
                        }
                    }]
                }
            }
        });

        // trade chart
        var ctx = document.getElementById('tradeChart').getContext("2d");
        var tradeChart = new Chart(ctx, {
            type: 'bar',
            yaxisname: "Monthly Trade",

            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "Monthly Trade",
                    borderColor: "#f691be",
                    pointBorderColor: "#f691be",
                    pointBackgroundColor: "#f691be",
                    pointHoverBackgroundColor: "#f691be",
                    pointHoverBorderColor: "#D1D1D1",
                    pointBorderWidth: 4,
                    pointHoverRadius: 2,
                    pointHoverBorderWidth: 1,
                    pointRadius: 3,
                    fill: false,
                    borderWidth: 3,
                    data: {!! json_encode($monthly_trade) !!}
                }]
            },
            options: {
                legend: {
                    position: "bottom",
                    display: true,
                    labels: {
                        fontColor: '#928F8F'
                    }
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            fontColor: "#928F8F",
                            fontStyle: "bold",
                            beginAtZero: true,
                            // maxTicksLimit: 5,
                            // padding: 20,
                            // max: 1000
                        },
                        gridLines: {
                            drawTicks: false,
                            display: false
                        }
                    }],
                    xAxes: [{
                        gridLines: {
                            zeroLineColor: "transparent",
                            drawTicks: true,
                            display: false
                        },
                        ticks: {
                            // padding: 20,
                            fontColor: "#928F8F",
                            fontStyle: "bold",
                            // max: 10000,
                            autoSkip: false
                        }
                    }]
                }
            }
        });

        // active user
        var options = {
            series: [{{number_format($active_percentage,2)}}],
            colors: ["#5D58E7"],
            chart: {
                height: 400,
                type: 'radialBar',
            },
            plotOptions: {
                radialBar: {
                    hollow: {
                        size: '50',
                    },
                    dataLabels: {
                        value: {
                            color: "#B4B8D7",
                            fontSize: "20px",
                            offsetY: -5,
                            show: true
                        }
                    }
                },
            },
            labels: [''],
            fill: {
                type: "gradient",
                gradient: {
                    shade: "dark",
                    type: "vertical",
                    gradientToColors: ["#309EF9"],
                    stops: [0, 100]
                }
            },
        };

        var chart = new ApexCharts(document.querySelector("#active-user-chart"), options);
        chart.render();

        // inactive user
        var options = {
            series: [{{number_format($inactive_percentage,2)}}],
            colors: ["#F24F4D"],
            chart: {
                height: 400,
                type: 'radialBar',
            },
            plotOptions: {
                radialBar: {
                    hollow: {
                        size: '50',
                    },
                    dataLabels: {
                        value: {
                            color: "#B4B8D7",
                            fontSize: "20px",
                            offsetY: -5,
                            show: true
                        }
                    }
                },
            },
            labels: [''],
            fill: {
                type: "gradient",
                gradient: {
                    shade: "dark",
                    type: "vertical",
                    gradientToColors: ["#F89A6B"],
                    stops: [0, 100]
                }
            },
        };

        var chart = new ApexCharts(document.querySelector("#deleted-user-chart"), options);
        chart.render();

    </script>
@endsection
