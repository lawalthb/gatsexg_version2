@extends('user.master', ['menu' => 'pocket'])
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
                                    <h4>Transfer Coin</h4>
                                </div>
                            </div>
                            <div class="tab-navbar">
                                <div class="tabe-menu">
                                    <ul class="nav cp-user-profile-nav mb-0" id="myTab" role="tablist">



                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="myTabContent">

                            <div class="tab-pane fade show active in" id="withdraw" role="tabpanel"
                                aria-labelledby="withdraw-tab">
                                <div class="row">
                                    <div class="col-lg-6 offset-lg-3">
                                        <div class="form-area cp-user-profile-info withdraw-form">
                                            <form action="{{ route('transferCoinRequest') }}" method="post"
                                                id="transferFormData" autocomplete="off">
                                                @csrf
                                                <input type="hidden" name="wallet_id" value="">
                                                <div class="form-group">
                                                    <label for="">Select Wallet</label>
                                                    <select name="wallet" class=" form-control">
                                                        @if (isset($wallets[0]))
                                                            <option value="">Select Wallet</option>
                                                            @foreach ($wallets as $wallet)
                                                                <option {{ old('wallet') == $wallet->id ? 'selected' : '' }}
                                                                    value="{{ $wallet->id }}">
                                                                    {{ $wallet->name }} ({{ $wallet->balance }}
                                                                    {{ $wallet->coin_type }})</option>
                                                            @endforeach
                                                        @endif
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="to">To</label>
                                                    <input name="username" type="text" class="form-control"
                                                        id="to" placeholder="{{ __('Username') }}"
                                                        value="{{ old('username') }}">
                                                    <span class="flaticon-wallet icon"></span>

                                                </div>
                                                <div class="form-group">
                                                    <label for="amount">{{ __('Amount') }}</label>
                                                    <input name="amount" type="text" class="form-control" id="amount"
                                                        placeholder="Amount" value="{{ old('amount') }}">


                                                    <p class="text-warning" id="equ_btc"><span class="totalBTC"></span>
                                                        <span class="coinType"></span>
                                                    </p>
                                                </div>
                                                {{-- <div class="form-group">
                                                    <label for="note">{{ __('Note') }}</label>
                                                    <textarea class="form-control" name="message" id="note"
                                                        placeholder="{{ __('Type your message here(Optional)') }}">{{ old('message') }}</textarea>
                                                </div> --}}
                                                <button onclick="withDrawBalance()" type="button"
                                                    class="btn profile-edit-btn">{{ __('Submit') }}</button>
                                                <div class="modal fade" id="transferPinCheck" tabindex="-1" role="dialog"
                                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">
                                                                    {{ __('Enter Transfer PIN') }}</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <p>{{ __('Enter Transfer PIN') }}
                                                                        </p>
                                                                        <input placeholder="{{ __('Transfer PIN') }}"
                                                                            required maxlength="4" class="form-control"
                                                                            type="password" autocomplete="off"
                                                                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                                                            name="pin">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">{{ __('Close') }}</button>
                                                                <button type="submit"
                                                                    class="btn btn-primary">{{ __('Proceed') }}</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
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
        function withDrawBalance() {
            // var g2fcheck = '{{ \Illuminate\Support\Facades\Auth::user()->google2fa_secret }}';
            var tfPIn = '{{ auth()->user()->transfer_pin }}';

            if (tfPIn.length > 1) {
                var frm = $('#transferFormData');

                $.ajax({
                    type: frm.attr('method'),
                    url: frm.attr('action'),
                    data: frm.serialize(),
                    success: function(data) {
                        if (data.success == true) {
                            $('#transferPinCheck').modal('show');

                        } else {
                            VanillaToasts.create({
                                // title: 'Message Title',
                                text: data.message,
                                type: 'warning',
                                timeout: 3000

                            });
                        }

                    },
                    error: function(data) {

                    },
                });
            } else {
                VanillaToasts.create({
                    text: "{{ __('You need to create a transfer pin before you can make transfer') }}",
                    type: 'warning',
                    timeout: 3000

                });
            }

        }

        document.querySelector('button').addEventListener('click', function(event) {

            var copyTextarea = document.querySelector('#address');
            copyTextarea.focus();
            copyTextarea.select();

            try {
                var successful = document.execCommand('copy');
                VanillaToasts.create({
                    // title: 'Message Title',
                    text: '{{ __('Address copied successfully') }}',
                    type: 'success',

                });
            } catch (err) {

            }
        });



        // !--copy_to_clip-- 
        $('.copy_to_clip').on('click', function() {
            /* Get the text field */
            var copyFrom = document.getElementById("address");

            /* Select the text field */
            copyFrom.select();

            /* Copy the text inside the text field */
            document.execCommand("copy");

            VanillaToasts.create({
                title: 'Copied the text',
                // text: copyFrom.value,
                type: 'success',
                timeout: 3000,
                positionClass: 'topCenter'
            });
        });
    </script>
@endsection
