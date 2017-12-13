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
$('#btn_pay').off('click').click(function () {
    var name = $('#tb_name').val();
    var phone = $('#tb_phone').val();
    var address = $('#add').val();
    var province = $('#province option:selected').text();
    var district = $('#distric option:selected').text();
    var ward = $('#ward option:selected').text();
    var email = $('#tb_mail').val();
    $.ajax({
        url: '/Cart/Payment',
        data: { email: email, name: name, province: province, district: district, ward: ward, address: address, phone: phone },
        type: 'POST',
        dataType: 'json',
        success: function (res) {
            if (res.status == true) {
                alert("Thanh toán thành công");
                window.location.href = '/Home/Index';
            }
        }
    });
})
// sự kiện khi bấm nút submit của Phản hồi
$('#btn_feedback').off('click').click(function () {
    var name = $('#tb_fb_name').val();
    var content = $('#tb_fb_content').val();
    var email = $('#tb_fb_email').val();
    $.ajax({
        url: '/Home/FeedBack',
        data: { email: email, name: name, content: content},
        type: 'POST',
        dataType: 'json',
        success: function (res) {
            if (res.status == true) {
                alert("Gửi phản hòi thành công");
                window.location.href = '/Home/Index';
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
// sự kiện nút sắp xếp theo phổ biến
$('#Sort_Common').click(function () {
    var id = $(this).data('id');
    var sid = $(this).data('sid'); 
    $.ajax({
        url: '/Product/ProductCategory_Sort',
        data: { id: id, sid: sid, con: 1 },
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            $('.product-left').empty();
            var rows = "";
            $.each(data, function (i, item) {
                var url = "/chi-tiet/" + item.MetaTitle + "-" + item.ID;
                rows += "<div class='col-md-4 chain-grid' style='margin-bottom: 10px; height: 350px'>" +
                    "<a href='" + url + "'><img class='img-responsive chain' src='" + item.Image + "' alt=' ' /></a>" +
                    "<span class='star'> </span>" +
                    "<div class='grid-chain-bottom'>" +
                        "<h6 style='height: 44px'><a href='" + url + "' style='font-size: 15px;'>" + item.Name + "</a></h6>" +
                        "<div class='star-price'>" +
                            "<div class='dolor-grid'>" +
                                "<span style='font-size: 15px;color: #c10017; height: 20px;'>" + accounting.formatNumber(item.Price) + '₫' + "</span>" +
                            "</div>" +
                            "<button title='Thêm vào giỏ hàng' class='btn' onclick='return GetQuantityCartItem(" + item.ID + ")' style='width: 15px; float: right'><span class='add_to_cart'></span></button>" +
                            "<div class='clearfix'> </div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
                $('.product-left').html(rows);
            })
        }
    });
})
// sự kiện nút sắp xếp theo mới
$('#Sort_New').click(function () {
    var id = $(this).data('id');
    var sid = $(this).data('sid'); 
    $.ajax({
        url: '/Product/ProductCategory_Sort',
        data: { id: id, sid: sid, con: 2 },
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            $('.product-left').empty();
            var rows = "";
            $.each(data, function (i, item) {
                var url = "/chi-tiet/" + item.MetaTitle + "-" + item.ID;
                rows += "<div class='col-md-4 chain-grid' style='margin-bottom: 10px; height: 350px'>" +
                    "<a href='" + url + "'><img class='img-responsive chain' src='" + item.Image + "' alt=' ' /></a>" +
                    "<span class='star'> </span>" +
                    "<div class='grid-chain-bottom'>" +
                        "<h6 style='height: 44px'><a href='" + url + "' style='font-size: 15px;'>" + item.Name + "</a></h6>" +
                        "<div class='star-price'>" +
                            "<div class='dolor-grid'>" +
                                "<span style='font-size: 15px;color: #c10017; height: 20px;'>" + accounting.formatNumber(item.Price) + '₫' + "</span>" +
                            "</div>" +
                            "<button title='Thêm vào giỏ hàng' class='btn' onclick='return GetQuantityCartItem(" + item.ID + ")' style='width: 15px; float: right'><span class='add_to_cart'></span></button>" +
                            "<div class='clearfix'> </div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
                $('.product-left').html(rows);
            })
        }
    });
})
// sự kiện nút sáp xếp theo giá thấp - cao
$('#Sort_Low_High').click(function () {
    var id = $(this).data('id');
    var sid = $(this).data('sid');
    $.ajax({
        url: '/Product/ProductCategory_Sort',
        data: { id: id, sid: sid, con: 3 },
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            $('.product-left').empty();
            var rows = "";
            $.each(data, function (i, item) {
                var url = "/chi-tiet/" + item.MetaTitle + "-" + item.ID;
                rows += "<div class='col-md-4 chain-grid' style='margin-bottom: 10px; height: 350px'>" +
                    "<a href='" + url + "'><img class='img-responsive chain' src='" + item.Image + "' alt=' ' /></a>" +
                    "<span class='star'> </span>" +
                    "<div class='grid-chain-bottom'>" +
                        "<h6 style='height: 44px'><a href='" + url + "' style='font-size: 15px;'>" + item.Name + "</a></h6>" +
                        "<div class='star-price'>" +
                            "<div class='dolor-grid'>" +
                                "<span style='font-size: 15px;color: #c10017; height: 20px;'>" + accounting.formatNumber(item.Price) + '₫' + "</span>" +
                            "</div>" +
                            "<button title='Thêm vào giỏ hàng' class='btn' onclick='return GetQuantityCartItem(" + item.ID + ")' style='width: 15px; float: right'><span class='add_to_cart'></span></button>" +
                            "<div class='clearfix'> </div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
                $('.product-left').html(rows);
            })
        }
    });
})
// sự kiện nút sắp xếp theo giá cao - thấp
$('#Sort_High_Low').click(function () {
    var id = $(this).data('id');
    var sid = $(this).data('sid'); 
    $.ajax({
        url: '/Product/ProductCategory_Sort',
        data: { id: id, sid: sid, con: 4 },
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            $('.product-left').empty();
            var rows = "";
            $.each(data, function (i, item) {
                var url = "/chi-tiet/" + item.MetaTitle + "-" + item.ID;
                rows += "<div class='col-md-4 chain-grid' style='margin-bottom: 10px; height: 350px'>" +
                    "<a href='" + url + "'><img class='img-responsive chain' src='" + item.Image + "' alt=' ' /></a>" +
                    "<span class='star'> </span>" +
                    "<div class='grid-chain-bottom'>" +
                        "<h6 style='height: 44px'><a href='" + url + "' style='font-size: 15px;'>" + item.Name + "</a></h6>" +
                        "<div class='star-price'>" +
                            "<div class='dolor-grid'>" +
                                "<span style='font-size: 15px;color: #c10017; height: 20px;'>" + accounting.formatNumber(item.Price) + '₫' + "</span>" +
                            "</div>" +
                            "<button title='Thêm vào giỏ hàng' class='btn' onclick='return GetQuantityCartItem(" + item.ID + ")' style='width: 15px; float: right'><span class='add_to_cart'></span></button>" +
                            "<div class='clearfix'> </div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
                $('.product-left').html(rows);
            })
        }
    });
})