﻿var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('.aDelete').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Cart/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "gio-hang";
                    }
                }
            })
        })
        $('.btnDes').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Cart/Desquantity',
                dataType: 'json',
                type: 'POST',
                success: function (data) {
                    if (data > 0) {
                        $('#tb_quantity').val(data.toString());
                    }
                    else {
                        window.location.href = "gio-hang";
                    }
                }
            })
        })
        $('.btnIden').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Cart/Idenquantity',
                dataType: 'json',
                type: 'POST',
                success: function (data) {
                    if (data > 0) {
                        $('#tb_quantity').val(data.toString());
                    }
                    else
                    {
                        alert("Hết hàng");
                    }
                }
            })
        })
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = "/";
        })
    }
}
cart.init();