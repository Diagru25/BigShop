// sự kiện khi bấm submit của đăng kí
$('#btn_register').click(function () {
    var username = $('#tb_user_name').val();
    var password = $('#tb_repass').val();
    var name = $('#tb_name').val();
    var phone = $('#tb_phone').val();
    var address = $('#add').val();
    var province = $('#province :selected ').text();
    var district = $('#distric :selected').text();
    var ward = $('#ward :selected').text();
    var day = $('#s_day :selected').val();
    var month = $('#s_month :selected').val();
    var year = $('#s_year :selected').val();

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
// sự kiện khi bấm submit của Payment
$('#btn_pay').click(function () {
    var name = $('#tb_name').val();
    var phone = $('#tb_phone').val();
    var address = $('#add').val();
    var province = $('#province option:selected').text();
    var district = $('#distric option:selected').text();
    var ward = $('#ward option:selected').text();
    var email = $('#tb_mail').val();
    $.ajax({
        url: '/Cart/Payment/',
        data: { email: email, name: name, province: province, district: district, ward: ward, address: address, phone: phone },
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
function GetProvince() {
    $.ajax({
        url: '/Cart/GetProvince',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var rows = "<option>--------</option>";
            $.each(data, function (i, item) {
                rows += "<option value='" + item.provinceid + "'> " + item.name + " </option>";
                $('#province').html(rows);
            })
        }
    });
}
function GetDistrictByProvinceId(id) {
    $.ajax({
        url: '/Cart/GetDistrictByProvinceId/' + "" + id + "",
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var rows = "<option>--------</option>";
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
            var rows = "<option>--------</option>";
            $.each(data, function (i, item) {
                rows += "<option value='" + item.wardid + "'> " + item.name + " </option>";
                $('#ward').html(rows);
            })
        }
    });
}
$(window).load(function () {
    GetProvince();
})
$('#province').click(function () {
    var id = $('#province option:selected').val();
    GetDistrictByProvinceId(id);
})
$('#distric').click(function () {
    var id = $('#distric option:selected').val();
    GetWardByDistrictId(id);
})