$('#btn_feedback').click(function () {
    $('#panel-feedback').show();
    $('#panel-order').hide();
})
$('#btn_order').click(function () {
    $('#panel-feedback').hide();
    $('#panel-order').show();
})

function changeStatus(id) {
    $.ajax({
        url: '/Admin/Home/ChangeStatus/' + id,
        type: 'POST',
        dataType: 'json',
    })
}

var order = {
    init: function () {
        order.regEvents();
    },
    regEvents: function () {
        $('.row_order').off('click').on('click', function () {
            var id = $(this).data('id');
            $.ajax({
                url: '/Admin/Home/ViewDetailOrder/' + id,
                type: 'POST',
                dataType: 'json',
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
                }
            })
        })
    }
}

order.init();

$('#btn_confirm').click( function() {
    var listCheckBox = document.getElementsByClassName('check');
    var count = 0;
    for (var i = 0; i < listCheckBox.length; i++) {
        if (listCheckBox[i].checked == true) {
            var id = listCheckBox[i].getAttribute("data-id");
            changeStatus(id);
            count++;
        }
    }
    alert('Đã duyệt ' + count + ' đơn hàng');
    window.location.href = '/Admin/Home/Index';
})
$.formattedDate = function (dateToFormat) {
    var dateObject = new Date(dateToFormat);
    var day = dateObject.getDate();
    var month = dateObject.getMonth() + 1;
    var year = dateObject.getFullYear();
    day = day < 10 ? "0" + day : day;
    month = month < 10 ? "0" + month : month;
    var formattedDate = day + "/" + month + "/" + year;
    return formattedDate;
};

function GetByFBStatus(status) {
    $.ajax({
        url: '/Admin/Home/FeedBackByStatus',
        type: 'POST',
        dataType: 'json',
        data: {status},
        success: function (data) {
            var rows;
            $.each(data, function (i, item) {
                rows += '<tr role="button">' +
                                             '<td><input class="row_fb" type="checkbox" data-id="' + item.ID + '"/></td>' +
                                             '<td>' + item.Name + '</td>' +
                                             '<td>' + item.Phone + '</td>' +
                                             '<td>' + $.formattedDate(new Date(parseInt(item.CreatedDate.substr(6)))) + '</td>' +
                                             '<td>' + item.Content + '</td></tr>';
            });
            $('#tb_FB').html(rows);
        }
    })
}
$('#listold').click(function () {
    GetByFBStatus(1);
})
$('#listnew').click(function () {
    GetByFBStatus(null);
})
$('#listspam').click(function () {
    GetByFBStatus(0);
})
$('#listall').click(function () {
    window.location.href = '/Admin/Home/Index';
})

var feedback = {
    init: function () {
        feedback.RegEvent();
    },
    RegEvent: function () {
        $('.row_fb').off('click').on('click', function () {
            
        })
    }
}

function changeFBStatus(id,status) {
    $.ajax({
        url: "/Admin/Home/FBChangeStatus",
        type: 'POST',
        dataType: 'json',
        data: { id: id, status: status },
    })
}

function getFBDetail(id) {
    $.ajax({
        url: '/Admin/Home/GetFBByID/' + id,
        type: 'POST',
        dataType: 'Json',
        success: function (data) {
            $("#fb_title").html("Người gửi: " +  data.Name);
            $("#fb_content").text(data.Content);
            $("#fbDetailModal").modal('show');
            changeFBStatus(id, 1);
            $("#row" + id).removeAttr("style");
        }
    })
}
function DelFeedBack(id) {
    $.ajax({
        url: '/Admin/Home/FBDel/' + id,
        type: 'POST',
        dataType:'json'
    })
}

$('#del_feetback').click(function () {
    var listCheckBox = document.getElementsByClassName('checkfb');
    var count = 0;
    for (var i = 0; i < listCheckBox.length; i++) {
        if (listCheckBox[i].checked == true) {
            var id = listCheckBox[i].getAttribute("data-id");
            DelFeedBack(id);
            $("#row" + id).remove();
            i--;
            count++;
        }
    }
    $('#countFB').text(listCheckBox.length - count + 1);
    alert('Đã xóa ' + count + ' phản hồi');
})
$('#spam_feedback').click(function () {
    var listCheckBox = document.getElementsByClassName('checkfb');
    var count = 0;
    for (var i = 0; i < listCheckBox.length; i++) {
        if (listCheckBox[i].checked == true) {
            var id = listCheckBox[i].getAttribute("data-id");
            changeFBStatus(id,0);
            $("#row" + id).attr("style", "background-color:#de8888;color:white;");
            count++;
            listCheckBox[i].checked = false;
        }
    }
    $('#countFB').text(listCheckBox.length - count + 1);
    alert('Đã đánh dấu spam ' + count + ' phản hồi');
})
