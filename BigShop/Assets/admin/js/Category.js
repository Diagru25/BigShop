var brand = {
    init: function () {
        brand.regEvents();
    },
    regEvents: function () {
        $('.delBrand').off('click').on('click', function () {
            $.ajax({
                url: '/Admin/Product/DeleteBrand',
                type: 'POST',
                data: { brandid: $(this).data('id'), cateid: $('#brandTB').data('id') },
                dataType: 'json',
                success: function (res) {
                    if (res.status == true) {
                        alert('Xóa thành công');
                        window.location.href = '/Admin/Product/Category';
                    }
                }
            })
        })

        $('.br_status').off('click').on('click', function () {
            $.ajax({
                url: '/Admin/Product/BrandStatus',
                type: 'POST',
                data: { id: $(this).data('id') },
                dataType: 'json',
                success: function (res) {
                    if (res.status == true) {
                        alert('Thành công');
                        window.location.href = '/Admin/Product/Category';
                    }
                }
            })
        })
    }
}

var cate = {
    init: function () {
        cate.registerEvent();
    },
    registerEvent: function () {
        $('.cateDel').off('click').on('click', function () {
            $.ajax({
                url: '/Admin/Product/DelCategory',
                type: 'POST',
                data: { id: $(this).data('id') },
                dataType: 'json',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = '/Admin/Product/Category';
                    }
                }
            })
        })
        $('.change_status').off('click').on('click', function () {
            $.ajax({
                url: '/Admin/Product/CateStatus',
                type: 'POST',
                data: { id: $(this).data('id') },
                dataType: 'json',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = '/Admin/Product/Category';
                    }
                }
            })
        })
    }
}

cate.init();

$('.viewBrand').off('click').on('click', (function () {
    var id = $(this).data('id');
    $.ajax({
        url: '/Admin/Product/GetBrand/' + id,
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            var rows;
            var status;
            var button_type;
            if (data.length > 0) {
                $.each(data, function (i, item) {
                    if (item.Status == true) { status = 'Khóa'; button_type = 'btn-danger'; }
                    else { status = 'Kích hoạt'; button_type = 'btn-success';}
                    rows += "<tr>" +
                       "<td>" + item.Name + "</td><td>" + i + "</td><td>" + item.CreatedDate + "</td><td>" + "<a class = 'btn " + button_type + " br_status' data-id=" + item.ID + ">" + status +"</a>" + "</td>" +
                       "<td>" + "<a class='btn btn-danger delBrand' data-id=" + item.ID + " > Xóa</a>" + "</td>"
                        + "</tr>";
                        });
                $(document).scrollTop(data.length * 200);
            }
            else {
                rows = "<tr><td colspan = '5'>Không có dữ liệu</td></tr>";               
                $(document).scrollTop(1000);
            }
            $('#brandTB').html(rows);
            $('#brandTB').data('id', id);
            brand.init();  
        }
    })
    
}))

$('#SaveCate').click(function () {
    $.ajax({
        url: '/Admin/Product/AddCategory',
        data: { CateName: $('#CateName').val(), CateSeq: $('#CateSeq').val() },
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            alert(data);
            window.location.href = '/Admin/Product/Category';
        }
    })
})
$('#SaveBrand').click(function () {
    $.ajax({
        url: '/Admin/Product/AddBrand',
        data: { BrandName: $('#BrandName').val(), BrandSeq: $('#BrandSeq').val(), CateID: $('#brandTB').data('id') },
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            alert(data);
            window.location.href = '/Admin/Product/Category';
        }
    })
})

