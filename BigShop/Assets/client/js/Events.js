// sự kiện khi bấm submit của đăng kí
$('#btn_register').click(function () {
    var username = $('#tb_user_name').val();
    var password = $('#tb_repass').val();
    var name = $('#tb_name').val();
    var phone = $('#tb_phone').val();
    var address = $('#tb_user_name').val();
    var province = $('#province').val();
    var district = $('#distric').val();
    var ward = $('#ward').val();
    var day = $('#s_day').val();
    var month = $('#s_month').val();
    var year = $('#s_year').val();
    var email = $('#tb_mail').val();
    $.ajax({
        url: '/User/Register/',
        data: { username: username, password: password, name: name, email: email, phone: phone, address: address, province: province, district: district, ward: ward, day: day, month: month, year: year },
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            if (data == "Đăng kí thành công") {
                $('#concard').addClass('alert alert-success');
                $('#concard').html(data);
            }
            else {
                $('#concard').addClass('alert alert-danger');
                $('#concard').html(data);
            }

        }
    });
})
// sự kiện nút xác nhận thanh toán
//$('#confirm_pay').click(function () {
//    var check = $('#confirm_pay').is(":checked");
//    if (check == true) {
//        $('#btn_pay').prop('disabled', false);
//    }
//    else {
//        $('#btn_pay').prop('disabled', true);
//    }
//})
// sự kiện các select tỉnh / thành phố
function GetDistrictByProvinceId(id) {
    $.ajax({
        url: '/Cart/GetDistrictByProvinceId/' + "" + id + "",
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var rows = '';
            $.each(data, function (i, item) {
                rows += "<option value='" + item.districtid + "'> " + item.name + " </option>";
                $('#distric').html(rows);
            })
        }
    });
}
function GetWardByDistrictId(id) {
    $.ajax({
        url: '/Cart/GetWardByDistrictId/' + "" + id + "",
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var rows = '';
            $.each(data, function (i, item) {
                rows += "<option value='" + item.wardid + "'> " + item.name + " </option>";
                $('#ward').html(rows);
            })
        }
    });
}
$('#province').click(function () {
    var id = $('#province option:selected').val();
    GetDistrictByProvinceId(id);
})
$('#distric').click(function () {
    var id = $('#distric option:selected').val();
    GetWardByDistrictId(id);
})