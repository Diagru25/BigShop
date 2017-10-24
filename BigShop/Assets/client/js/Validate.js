$('#tb_mail').blur(function () {
    var patt_mail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!patt_mail.test($('#tg_mail > input').val())) {
        $('#check_mail').append("Hãy nhập địa chỉ Email hợp lệ! Vd: Example@gmail.com ");
        $('#tg_mail').attr('value', "");
    }
    else {
        $('#status_mail').append('<img src="/Assets/client/images/tick.png" class="img-responsive">');
        $('#tg_mail').attr('value', "*");
    }
 
})
$('#tb_mail').focus(function () {
    $('#check_mail').text('');
    $('#status_mail').text('');
})
//check user name
$('#tb_user_name').blur(function () {
    var patt_name = /^[a-zA-Z\d]+$/;
    var x = true;
    //tìm sau
    //if (!patt_name.test($('#tg_user_name > input').val())) {
      if (!x) {
        $('#check_user_name').append("Tên đăng nhập không hợp lệ!")
        $('#tg_user_name').attr('value', "");
    }
    else {
        $('#status_user_name').append('<img src="/Assets/client/images/tick.png" class="img-responsive">');
        $('#tg_user_name').attr('value', "*");
    }

})
$('#tb_user_name').focus(function () {
    $('#check_user_name').text('');
    $('#status_user_name').text('');
})

// check_name
$('#tb_name').blur(function () {
    var patt_name = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s]+$/;
    if (!patt_name.test($('#tg_name > input').val())) {
        $('#check_name').append("Tên không hợp lệ!")
        $('#tg_name').attr('value', "");
    }
    else {
        $('#status_name').append('<img src="/Assets/client/images/tick.png" class="img-responsive">');
        $('#tg_name').attr('value', "*");
    }

})
$('#tb_name').focus(function () {
    $('#check_name').text('');
    $('#status_name').text('');
})
// check pass
$('#tb_pass').blur(function () {
    var patt = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,18}$/;
    var pass = $('#tb_pass');
    if (pass.val().length < 6) {
        $('#check_pass').append("Mật khẩu quá ngắn !");
        $('#tg_pass').attr('value', "");
    }
    else if (pass.length > 20) {
        $('#check_pass').append("Mật khẩu chỉ tối đa 20 kí tự !");
        $('#tg_pass').attr('value', "");
    }
    else {
        if (patt.test($('#tg_pass > input').val())) {
            $('#status_pass').append('<img src="/Assets/client/images/tick.png" class="img-responsive">');
            $('#tg_pass').attr('value', "*");
            $('#tb_repass').prop('disabled', false);
        }
        else {
            $('#check_pass').append("Mật khẩu phải có chữ và số !");
            $('#tg_pass').attr('value', "");
        }
    }
})
$('#tb_pass').focus(function () {
    $('#check_pass').text('');
    $('#status_pass').text('');
})

// check repass
$('#tb_repass').blur(function () {
    if ($('#tg_pass > input').val() == $('#tg_repass > input').val()) {
        $('#status_repass').append('<img src="/Assets/client/images/tick.png" class="img-responsive">');
        $('#tg_repass').attr('value', "*");
    }
    else {
        $('#check_repass').append("Không trùng khớp !");
        $('#tg_repass').attr('value', "");
    }
})
$('#tb_repass').focus(function () {
    $('#check_repass').text('');
    $('#status_repass').text('');
})
//check_phone
$('#tb_phone').blur(function () {
    var patt_phone = /^[0-9-+]{10,11}$/;

    if (!patt_phone.test($('#tg_phone > input').val())) {
        $('#check_phone').append("Số điện thoại không hợp lệ ! ");
        $('#tg_phone').attr('value', "");
    }
    else {
        $('#status_phone').append('<img src="/Assets/client/images/tick.png" class="img-responsive">');
        $('#tg_phone').attr('value', "*");
    }

})
$('#tb_phone').focus(function () {
    $('#check_phone').text('');
    $('#status_phone').text('');
})

$('#province').blur(function () {
    if ($(this).val() != '-------') {
        $('#tg_prov').attr('value', '*');
    }
    else {
        $('#tg_prov').attr('value', '');
    }
})
$('#distric').blur(function () {
    if ($(this).val() != '-------') {
        $('#tg_dist').attr('value', '*');
    }
    else {
        $('#tg_dist').attr('value', '');
    }
})
$('#add').blur(function () {
    if ($(this).val() != '') {
        $('#tg_addr').attr('value', '*');
    }
    else {
        $('#tg_addr').attr('value', '');
    }
})
$('#ward').blur(function () {
    if ($(this).val() != '-------') {
        $('#tg_ward').attr('value', '*');
    }
    else {
        $('#tg_ward').attr('value', '');
    }
})

$('#confirm_pay').click(function () {
    var submit = document.getElementsByClassName("field_box");
    var check = $('#confirm_pay').is(":checked");
    var j = 0;
    for (var i = submit.length - 1; i >= 0; i--) {
        if (submit[i].value == '*') {
            j++;
        }
    }
    if (j == 7 && check == true) { $('#btn_pay').prop('disabled', false); }
    else $('#btn_pay').prop('disabled', true);
})

//Kiểm tra validate
function concard() {
        var submit = document.getElementsByClassName("field_box");
        var j = 0;
        var check = $('#confirm').is(":checked");
        var temp;
        if (check == true) temp = 10;
        else temp = 5;
        for (var i = 0; i < temp; i++) {
            if (submit[i].value == '*') {
                j++;
            }
        }
        if (j == temp) return true;
        return false;
}

$('#confirm_create').click(function () {
    var check =  concard();
    if (check) {
        $('#btn_register').prop('disabled', false);
        $('#confirm').prop('disabled', true);
    }
    else {
        $('#btn_register').prop('disabled', true);
        $('#confirm').prop('disabled', false);
    }
    if (!$('#confirm_create').is(":checked")) {
        $('#btn_register').prop('disabled', true);
        $('#confirm').prop('disabled', false);
    }
});

$('#confirm').click(function () {
    if ($('#confirm').is(":checked")) {
        $('#regis_payment').slideDown("slow");
        $('#btn_register').attr("style", 'margin-top: 30px');
    }
    else {
        $('#regis_payment').slideUp("slow");
        $('#btn_register').attr("style", '');
        }
})

//Generate DateTime
$(window).load(function () {
    var insert = $('#Day > select');
    for (var i = 1; i <= 31 ; i++) {
        insert.append("<option value ='" + i + "'>" + i + "</option>");
    }
})
$(window).load(function () {
    var insert = $('#Month > select');
    for (var i = 1; i <= 12 ; i++) {
        insert.append("<option value ='" + i + "'>" + i + "</option>");
    }
})
$(window).load(function () {
    var insert = $('#Year > select');
    for (var i = new Date().getFullYear() ; i >= 1930 ; i--) {
        insert.append("<option value ='" + i + "'>" + i + "</option>");
    }
})