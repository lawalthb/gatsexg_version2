@extends('user.master',[ 'menu'=>'trade'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
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
                                            <h4 id="list_title2"><a href="{{route('marketPlace')}}">{{__(' My Trades ')}}</a> -> {{$type_text}} 
                                                @if($type == 'seller')
                                                    <a href="{{route('userTradeProfile',$item->buyer_user_code)}}">{{$item->buyer_username}}</a>
                                                @else
                                                    <a href="{{route('userTradeProfile',$item->seller_user_code)}}">{{$item->seller_username}}</a>
                                                @endif
                                            </h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-5">
                                            @include('user.marketplace.market.order.leftside')
                                        </div>
                                        <div class="col-xl-7 rightSideDiv">
                                            @include('user.marketplace.market.order.rightside')
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
        jQuery(document).ready(function () {
            Pusher.logToConsole = true;

            Echo.channel('userordermessage_' + '{{Auth::id()}}' + '_' + '{{$item->id}}')
                .listen('.receive_message', (data) => {
                    console.log(data);
                    let filePath = '';
                    if(data.data.file[0]) {
                        filePath = data.data.file[4];
                    }
                    var message = data.data.message;
                    var image = data.data.sender_user.image;

                    if (message) {
                        $("#messageData").append('<li class="messages-resived single-message">' +
                            '<div class="user-img"> <img src="' + image + '"> </div>' +
                            '<div class="msg"><p>' + message + '</p><small>'+ data.data.time +'</small></div></li>');
                    }
                    if (filePath) {
                        $("#messageData").append('<li class="messages-resived single-message">' +
                            '<div class="user-img"> <img src="' + image + '"> </div>' +
                            '<div class="msg-file">' + filePath + '<small>'+ data.data.time +'</small></div></li>');
                    }


                    $('.inner-message').scrollTop($('.inner-message')[0].scrollHeight);
                });
            $('#msgFile').change(function(){
                let reader = new FileReader();
                reader.onload = (e) => {
                    $('.preview_img_b_u').removeClass('d-none');
                    $('#preview-image-before-upload').attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            });

            function resetImageField()
            {
                $('#msgFile').val('');
                $('.preview_img_b_u').addClass('d-none');
            }

            $('body').keypress(function(e){
                if(e.which == 13) {
                    e.preventDefault();
                    var receiverId = $('#receiverId').val();
                    var textMessage = $('#textMessage').val();

                    sendMessage(receiverId, textMessage);
                    $("#idForm")[0].reset();
                }
            })
            $(document).on('click', '#close_img', function (e) {
                resetImageField();
            })

            $('form#idForm').on('submit', function (e) {
                e.preventDefault();

                var receiverId = $('#receiverId').val();
                var textMessage = $('#textMessage').val();

                sendMessage(receiverId, textMessage);
                $("#idForm")[0].reset();
            });

            $(document).on('keydown', '.press-enter', function (e) {
                if(e.which == 13) {
                    e.preventDefault();
                    var receiverId = $('#receiverId').val();
                    var textMessage = $('#textMessage').val();

                    sendMessage(receiverId, textMessage);
                    $("#idForm")[0].reset();
                }
            })

            $('.inner-message').scrollTop($('.inner-message')[0].scrollHeight);
            function sendMessage(receiverId, textMessage) {
                const formDataSet = new FormData($("#idForm")[0]);
                // Append data
                formDataSet.append('_token','{{csrf_token()}}');
                formDataSet.append('order_id','{{$item->id}}');
                $.ajax({
                    type: "POST",
                    url: '{{ route('sendOrderMessage') }}',
                    data: formDataSet,
                    dataType: "JSON",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        data = data.data;
                        console.log(data);
                        if (data.success == true) {
                            let filePath = '';
                            if(data.data.file[0]) {
                                filePath = data.data.file[4];
                            }

                            var message = data.data.message;
                            var myImage = data.data.my_image;
                            if (message) {
                                $("#messageData").append('<li class="message-sent single-message">' +
                                    '<div class="msg">' + '<p>' + message + '</p>' + '</div>' +
                                    '<div class="user-img"> <img src="' + myImage + '"> </div></li>');
                            }
                            if (filePath) {
                                resetImageField();
                                $("#messageData").append('<li class="message-sent single-message">' +
                                    '<div class="msg-file">' + filePath + '</div>' +
                                    '<div class="user-img"> <img src="' + myImage + '"> </div></li>');
                            }

                            $('.inner-message').scrollTop($('.inner-message')[0].scrollHeight);
                        } else {
                            VanillaToasts.create({
                                text: data.message,
                                type: 'warning',
                                timeout: 5000
                            });
                        }
                    }
                });
            }

            Echo.channel('sendorderstatus_'+'{{Auth::id()}}'+'_'+'{{$item->id}}')
                .listen('.receive_order_status', (data) => {
                    $('.rightSideDiv').html(data.html);
                });

        });

        // time count down
        
        //    $dateTime = strtotime($item->payment_expired_time);
        var getDateTime = '{{$item->payment_expired_time}}'; 
        var type = '{{$type}}'
        
        var countDownDate = new Date(getDateTime).getTime();
        var nowServerTime;
        
       
        // Update the count down every 1 second
        if(getDateTime != 0)
        {
            var x = setInterval(function() {
                getCurrentTimeFromServer();
                var now = new Date(nowServerTime).getTime();
                
                // Find the distance between now an the count down date
                var distance = countDownDate - now;
                // Time calculations for days, hours, minutes and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                
                // If the count down is over, write some text 
                if(days !== 0)
                {
                    if(type === 'seller')
                    {
                        document.getElementById("seller_counter").innerHTML = '{{ __('Expire after :') }}' + '{{__('please make a payment within ')}}'+ days + "Day : " + hours + "h " + minutes + "m " + seconds + "s ";
                    }
                    if(type === 'buyer')
                    {
                        document.getElementById("buyer_counter").innerHTML = '{{__('please make a payment within ')}}' + days + "Day : " + hours + "h " + minutes + "m " + seconds + "s ";
                    }
                    
                }else if(days === 0 && hours !==0)
                {
                    if(type === 'seller')
                    {
                        document.getElementById("seller_counter").innerHTML = '{{ __('Expire after :') }}' + hours + "h " + minutes + "m " + seconds + "s ";
                    }
                    if(type === 'buyer')
                    {
                        document.getElementById("buyer_counter").innerHTML = '{{__('please make a payment within ')}}' + hours + "h " + minutes + "m " + seconds + "s ";
                    }
                    
                    
                }else if(days === 0 && hours ===0 && minutes !== 0) 
                {
                    if(type === 'seller')
                    {
                        document.getElementById("seller_counter").innerHTML = '{{ __('Expire after :') }}' + minutes + "m " + seconds + "s ";
                    }
                    if(type === 'buyer')
                    {
                        document.getElementById("buyer_counter").innerHTML = '{{__('please make a payment within ')}}' + minutes + "m " + seconds + "s ";
                    }
                
                }else if(days === 0 && hours ===0 && minutes === 0 && seconds !== 0) 
                {
                    if(type === 'seller')
                    {
                        document.getElementById("seller_counter").innerHTML = '{{ __('Expire after :') }}' +seconds + "s ";
                    }
                    if(type === 'buyer')
                    {
                        document.getElementById("buyer_counter").innerHTML = '{{__('please make a payment within ')}}' + seconds + "s ";
                    }
                
                }
                if(days === 0 && hours ===0 && minutes === 0 && seconds === 0)
                {
                    location.reload();
                }
                
                if (distance < 0) {
                    clearInterval(x);
                    if(type === 'seller')
                    {
                        document.getElementById("seller_counter").innerHTML = '{{__('Payment time already EXPIRED ')}}';
                    }
                    if(type === 'buyer')
                    {
                        document.getElementById("buyer_counter").innerHTML = '{{__('Payment time already EXPIRED ')}}';
                    }
                    
                }
            }, 1000);
        }

        function getCurrentTimeFromServer()
        {
            $.ajax({
                type: "GET",
                url: "{{ route('getCurrentTimeFromServer') }}",
                data: {
                    '_token': "{{ csrf_token() }}"
                },
                success: function (data) {
                    nowServerTime = data;
                }
            });
        }

        function copyBankDetails(idName){
            var copyText = document.getElementById(idName);
            var textArea = document.createElement("textarea");
            textArea.value = copyText.textContent;
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand("Copy");
            textArea.remove();
            
            VanillaToasts.create({
                text: '{{__('copied successfully')}}',
                type: 'success',
                timeout: 3000
            });
            console.log(copyText);
        }
    </script>
@endsection
