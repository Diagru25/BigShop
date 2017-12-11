var order = {
    init: function () {
        order.regEvents();
    },
    regEvents: function () {
        $('.row_order').off('click').on('click', function () {
            $.ajax({
                url: '/Admin/Order/GetDetail',
                type: 'POST',
                dataType: 'json',
                data: { id: $(this).data('id') },
                success: function (data) {
                    var rows;
                    $.each(data, function (i, item) {
                        rows += "<tr>" +
                                "<td>" + item.Name + "</td>" +
                                "<td>" + item.Quantity + "</td>" +
                                "<td>" + item.Price + "</td>" +
                                 +"</tr>";
                    })
                    $('#tb_detail').html(rows);
                    $('#orderDetail').modal('show');
                    $('#ord_title').text('Mã đơn hàng ' + data[0].OrderID);
                }
            })
        })
    }
}

order.init();

function changeStatus(id, status) {
    $.ajax({
        url: '/Admin/Order/ChangeStatus',
        type: 'POST',
        dataType: 'json',
        data: { id: id, status: status }
    })
}

$('#btn_done').click(function () {
    var listCheckBox = document.getElementsByClassName('check');
    var count = 0;
    for (var i = 0; i < listCheckBox.length; i++) {
        if (listCheckBox[i].checked == true) {
            var id = listCheckBox[i].getAttribute("data-id");
            changeStatus(id, 2);
            count++;
        }
    }
    alert('Đã duyệt ' + count + ' đơn hàng');
    window.location.href = '/Admin/Order/Index';
})

$('#btn_confirm').click(function () {
    var listCheckBox = document.getElementsByClassName('check');
    var count = 0;
    for (var i = 0; i < listCheckBox.length; i++) {
        if (listCheckBox[i].checked == true) {
            var id = listCheckBox[i].getAttribute("data-id");
            changeStatus(id, 1);
            count++;
        }
    }
    alert('Đã đánh dấu hoàn thành ' + count + ' đơn hàng');
    window.location.href = '/Admin/Order/Index';
})

('#btn_del').click(function () {
    var listCheckBox = document.getElementsByClassName('check');
    var count = 0;
    for (var i = 0; i < listCheckBox.length; i++) {
        if (listCheckBox[i].checked == true) {
            var id = listCheckBox[i].getAttribute("data-id");

            count++;
        }
    }
    alert('Đã xóa ' + count + ' đơn hàng');
    window.location.href = '/Admin/Order/Index';
})

