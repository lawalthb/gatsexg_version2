@extends('user.master',['menu'=>'setting', 'sub_menu'=>'setting'])
@section('title', isset($title) ? $title : '')
@section('style')


@endsection
@section('content')
    @php($user = Auth::user())
    <div class="row">
        <div class="col-xl-6 mb-xl-0 mb-4">
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
                                                    <h4 id="list_title">{{__('Payment Method List')}} </h4>
                                                </div>
                                            </div>
                                            <div class="cp-user-wallet-table table-responsive buy-table">
                                                <table class="" id="table">
                                                    <thead>
                                                    <tr>
                                                        <th>{{__('Name')}}</th>
                                                        <th>{{__('Created At')}}</th>
                                                        <th>{{__('Status')}}</th>
                                                        <th>{{__('Action')}}</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @if(isset($user_payment_method_list))
                                                        @foreach($user_payment_method_list as $item)
                                                            <tr>
                                                                <td>{{$item->payment_method_name}}</td>
                                                                <td>{{ date('d M y', strtotime($item->created_at)) }}</td>
                                                                <td>
                                                                    @if ($item->status == STATUS_ACTIVE)
                                                                        <span class="badge badge-sm badge-success">{{__('Active')}}</span>
                                                                    @else
                                                                        <span class="badge badge-sm badge-warning">{{__('Deactive')}}</span>
                                                                    @endif
                                                                </td>
                                                                <td>
                                                                    <a href="{{route("userPaymentMethodEdit",['id'=>encrypt($item->id)])}}" class="btn btn-sm btn-primary">{{__('Edit')}}</a>
                                                                    <a href="{{route("userPaymentMethodDelete",['id'=>encrypt($item->id)])}}" class="btn btn-sm btn-danger">{{__('Delete')}}</a>
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
        <div class="col-xl-6">
            <div class="card cp-user-custom-card cp-user-setting-card">
                <div class="card-body">
                    <div class="cp-user-card-header-area">
                        <div class="cp-user-title">
                            <h4>{{$title}} </h4>
                        </div>
                    </div>
                    <div class="cp-user-setting-card-inner cp-user-setting-card-inner-preference">
                        <div class="cp-user-content">
                            <form method="post" action="{{route('userPaymentMethodSave')}}">
                                @csrf

                                @if (isset($payment_method_details))
                                    <input type="hidden" name="id" value="{{$payment_method_details->id}}">
                                @endif
                                <div class="form-group">
                                    <label>{{__('Choose Payment Method')}}</label>
                                    <div class="cp-user-preferance-setting">
                                        <select id="choose_payment_method_id" name="payment_method_id" class="form-control" required>
                                            <option value=""> {{__('Select Option')}} </option>
                                            @foreach($admin_payment_method_list as $key=>$item)
                                                <option value="{{$item->id}}"
                                                @if (isset($payment_method_details))
                                                    {{$payment_method_details->payment_method_id == $item->id? 'selected':''}}
                                                @else 
                                                    {{old('payment_method_id') == $item->id? 'selected':''}}
                                                @endif>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                    <input id="payment_type" type="hidden" name="payment_type" 
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->payment_type}}" @else value="{{old('payment_type')}}" @endif>

                                    <input id="payment_method_name" type="hidden" name="payment_method_name" 
                                    @if(isset($payment_method_details)) value="{{$payment_method_details->payment_method_name}}" @else value="{{old('payment_method_name')}}" @endif>
                                <div class="form-group">
                                    <label>{{__('Status')}}</label>
                                    <div class="cp-user-preferance-setting">
                                        <select name="status" class="form-control">
                                            
                                            <option value="{{STATUS_ACTIVE}}" 
                                            @if (isset($payment_method_details))
                                            {{$payment_method_details->status == STATUS_ACTIVE? 'selected':''}}
                                            @endif> {{__('Active')}} </option>
                                            <option value="{{STATUS_DEACTIVE}}"
                                            @if (isset($payment_method_details))
                                            {{$payment_method_details->status == STATUS_DEACTIVE? 'selected':''}}
                                            @endif>{{__('Deactive')}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>{{__('User Name')}}</label>
                                    <input class="form-control" type="text" name="user_name" id="user_name" 
                                    @if(isset($payment_method_details)) value="{{$payment_method_details->user_name}}" @else value="{{old('user_name')}}" @endif>
                                </div>
                                <div id="bank_details">
                                    <div class="form-group">
                                        <label>{{__('Bank Name')}}</label>
                                        <input class="form-control" type="text" name="bank_name"
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->bank_name}}" @else value="{{old('bank_name')}}" @endif>
                                    </div>
                                    <div class="form-group">
                                        <label>{{__('Bank Account Number')}}</label>
                                        <input class="form-control" type="text" name="bank_account_number"
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->bank_account_number}}" @else value="{{old('bank_account_number')}}" @endif>
                                    </div>
                                    <div class="form-group">
                                        <label>{{__('Account opening branch')}} {{__('Optional')}} </label>
                                        <input class="form-control" type="text" name="bank_opening_branch_name"
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->bank_opening_branch_name}}" @else value="{{old('bank_opening_branch_name')}}" @endif>
                                    </div>
                                    <div class="form-group">
                                        <label>{{__('Transaction Reference')}} {{__('Optional')}} </label>
                                        <input class="form-control" type="text" name="transaction_reference"
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->transaction_reference}}" @else value="{{old('transaction_reference')}}" @endif>
                                    </div>
                                </div>
                                <div id="mobile_account_details">
                                    <div class="form-group">
                                        <label>{{__('Mobile Account Number')}}</label>
                                        <input class="form-control" type="text" name="mobile_account_number"
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->mobile_account_number}}" @else value="{{old('mobile_account_number')}}" @endif>
                                    </div>
                                </div>
                                <div id="card_details">
                                    <div class="form-group">
                                        <label>{{__('Card  Number')}}</label>
                                        <input class="form-control" type="text" name="card_number"
                                        @if(isset($payment_method_details)) value="{{$payment_method_details->card_number}}" @else value="{{old('card_number')}}" @endif>
                                    </div>
                                    <div class="form-group">
                                        <label>{{__('Card  Type')}}</label>
                                        <div class="cp-user-preferance-setting">
                                            <select name="card_type" class="form-control">
                                                <option value="" 
                                                @if (isset($payment_method_details))
                                                {{$payment_method_details->card_type == ''? 'selected':''}}
                                                @endif> {{__('Select Option')}} </option>
                                                <option value="debit" 
                                                @if (isset($payment_method_details))
                                                {{$payment_method_details->card_type == 'debit'? 'selected':''}}
                                                @endif> {{__('Debit Card')}} </option>
                                                <option value="credit"
                                                @if (isset($payment_method_details))
                                                {{$payment_method_details->card_type == 'credit'? 'selected':''}}
                                                @endif>{{__('Credit Card')}}</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button class="btn cp-user-setupbtn">{{isset($payment_method_details)?__('Update'):__('Save')}}</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('script')
<script>
    $("#table").dataTable();
    $(document).ready(function(){
        $("#bank_details").hide();
        $("#mobile_account_details").hide();
        $("#card_details").hide();

        var user_name = '{{$user->first_name. " " . $user->last_name}}';
        $('#user_name').val(user_name);
        
        var payment_method_id = $('#choose_payment_method_id').val();
        getPaymentMethodType(payment_method_id);
    });

    $('#choose_payment_method_id').change(function(){
        var payment_method_id = $('#choose_payment_method_id').val();
        
        getPaymentMethodType(payment_method_id);
        
    });

    function setPaymentMethodDetails(payment_method_type)
    {
        if(payment_method_type === {{PAYMENT_TYPE_BANK}})
        {
            $("#bank_details").show();
            $("#mobile_account_details").hide();
            $("#card_details").hide();
        }else if(payment_method_type === {{PAYMENT_TYPE_MOBILE_ACCOUNT}})
        {
            $("#bank_details").hide();
            $("#mobile_account_details").show();
            $("#card_details").hide();
        }else if(payment_method_type === {{PAYMENT_TYPE_CARD}})
        {
            $("#bank_details").hide();
            $("#mobile_account_details").hide();
            $("#card_details").show();
        }
    }
    function getPaymentMethodType(id) {
        $.ajax({
            type: "POST",
            url: "{{ route('getPaymentMethodType') }}",
            data: {
                '_token': "{{ csrf_token() }}",
                'id': id
            },
            success: function (data) {
                console.log(data.data);
                if(data.success == true)
                {
                    $('#payment_method_name').val(data.data.paymentMethodName)
                    setPaymentMethodDetails(data.data.paymentMethodType);
                    $('#payment_type').val(data.data.paymentMethodType);
                }
            }
        });
    }


</script>
@endsection
