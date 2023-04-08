<script>
    function submitBuyForm(){
        var validationData = [
            {
                object : $('input[name="headline"]') ,
                type : "input",
                message : "{{ __("Offer headline can not be empty") }}"
            }
        ];
        var vaildateData = ValidationOn(validationData);
        if(typeof vaildateData === 'object'){
            return validateCheckMessage(vaildateData.message);
        }

        $('form[id="buy_coin"]').submit();
    }
    function ValidationOn(data){
        let r = true
        try {
            data.forEach((i) => {
                if (!checkValidation(i.type, i.object)) {
                    r = {success: false, message: i.message};
                    throw 'Break';
                }
            });
        }catch (e) {
            return r;
        }
        return r;
    }
    function checkValidation(type,object) {
        if(type == "input"){
            if(object.val() == '' || object.val() == ' ' || object.val() <= 0) {
                object.css("border-color","red");
                return 0;
            }
            return 1;
        }
        if(type == "select"){
            let a = false
            try {
                object = object.children();
                for (const [key, c] of Object.entries(object)) {
                    if (c.selected){
                        if($(c).val() !== "") {
                            a = true;
                            throw 'Break';
                        }
                    }
                }
            }catch (e) {
                return a;
            }
            return a;
        }
        if(type == "radio"){
            let a = false
            try {
                object.forEach((r) => {
                    if (r.checked) {
                        a = true;
                        throw 'Break';
                    }
                });
            }catch (e) {
                return a;
            }
            return a;
        }
    }

    function validateCheckMessage(message){
        swal({
            text: message,
            icon: "warning",
            buttons: false,
            timer: 4000,
        });
    }
</script>
