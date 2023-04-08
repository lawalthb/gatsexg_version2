<script>
    $(document).ready(function() {
        document.getElementById('row2nd').style.display = 'none';
        document.getElementById('row3rd').style.display = 'none';
        document.getElementById('loaderDiv').style.display = 'none';
        $('#country').on('change', function () {
            var country_id = $(this).val();

            $.ajax({
                type: "POST",
                url: "{{route('getCountryPaymentMethod')}}",
                data: {
                    '_token': "{{csrf_token()}}",
                    'country': country_id
                },
                dataType: 'JSON',

                success: function (data) {
                    console.log(data);
                    $('#select_payment_method').html(data.data);
                    $('#select_payment_method').selectpicker('refresh');
                }
            })
        });


        $('#next1st').on('click', function () {
            var validationData = [
                {
                  object : document.querySelectorAll('input[name="coin_type"]') ,
                  type : "radio",
                  message : "{{ __("Select a coin") }}"
                },
                {
                  object : $('select[name="country"]') ,
                  type : "select",
                  message : "{{ __("Select a country") }}"
                },
                {
                  object : $('select[name="currency"]') ,
                  type : "select",
                  message : "{{ __("Select a currency") }}"
                },
                {
                  object : document.querySelectorAll('input[name="rate_type"]') ,
                  type : "radio",
                  message : "{{ __("Select a rate type") }}"
                }
            ];
            var vaildateData = ValidationOn(validationData);
            if(typeof vaildateData === 'object'){
                return validateCheckMessage(vaildateData.message);
            }

            document.getElementById('loaderDiv').style.display = 'block';
            document.getElementById('row1st').style.display = 'none';
            setTimeout(function() {
                document.getElementById('loaderDiv').style.display = 'none';
                document.getElementById('row2nd').style.display = 'block';
            }, 2000);
        });
        $('#next2nd').on('click', function () {
            var edit = $(this).data('edit') ?? false;
            var validationData = [
                {
                    object : $('input[name="total_amount"]') ,
                    type : "input",
                    message : "{{ __("Total Amount Not Be Empty") }}"
                },
                {
                    object : $('input[name="minimum_trade_size"]') ,
                    type : "input",
                    message : "{{ __("Order Limit Not Be Empty") }}"
                },
                {
                    object : $('input[name="maximum_trade_size"]') ,
                    type : "input",
                    message : "{{ __("Order Limit Not Be Empty") }}"
                },
            ];
            if(!edit){
                validationData.push({
                    object : $('#select_payment_method') ,
                    type : "select",
                    message : "{{ __("Need To Select At Least One Payment Method") }}"
                });
            }
            var vaildateData = ValidationOn(validationData);
            if(typeof vaildateData === 'object'){
                return validateCheckMessage(vaildateData.message);
            }
            var payment_method = $('#select_payment_method').val();
            var offer_type = $('#offer_type').val();
            if(offer_type == 2 && !edit)
            {
                $.ajax({
                    type: "POST",
                    url: "{{route('checkUserPaymentMethod')}}",
                    data: {
                        '_token': "{{csrf_token()}}",
                        'payment_method': payment_method,
                    
                    },
                    dataType: 'JSON',

                    success: function (data) {
                        console.log(data);
                        if(data.success==false)
                        {
                            swal({
                                text: data.message,
                                icon: "warning",
                                buttons: false,
                                timer: 4000,
                            });

                            // setTimeout(function() {
                            //     document.getElementById('loaderDiv').style.display = 'none';
                            //     document.getElementById('row2nd').style.display = 'block';
                            // }, 2000);
                        }else{
                            document.getElementById('loaderDiv').style.display = 'block';
                            document.getElementById('row2nd').style.display = 'none';
                            setTimeout(function() {
                                document.getElementById('loaderDiv').style.display = 'none';
                                document.getElementById('row3rd').style.display = 'block';
                            }, 2000);
                        }
                        
                    }
                });
            }else{
                document.getElementById('loaderDiv').style.display = 'block';
                document.getElementById('row2nd').style.display = 'none';
                setTimeout(function() {
                    document.getElementById('loaderDiv').style.display = 'none';
                    document.getElementById('row3rd').style.display = 'block';
                }, 2000);
            }
            
            
        });
        $('#previous1st').on('click', function () {
            document.getElementById('loaderDiv').style.display = 'block';
            document.getElementById('row2nd').style.display = 'none';
            setTimeout(function() {
                document.getElementById('loaderDiv').style.display = 'none';
                document.getElementById('row1st').style.display = 'block';
            }, 200);
        });
        $('#previous2nd').on('click', function () {
            document.getElementById('loaderDiv').style.display = 'block';
            document.getElementById('row3rd').style.display = 'none';
            setTimeout(function() {
                document.getElementById('loaderDiv').style.display = 'none';
                document.getElementById('row2nd').style.display = 'block';
            }, 200);
        });
    });

    $('#currency').on('change', function () {
        let currency = $(this).val();
        let offerType = $('#offer_type').val();
        let coinType = document.querySelector('input[name="coin_type"]').value;
        if (coinType) {
            getMarketOfferPriceData(offerType,coinType,currency)
        }
    });
</script>
