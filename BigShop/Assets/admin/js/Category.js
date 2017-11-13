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
            alert('ok');
        })
    }
}

$('.viewBrand').off('click').on('click', (function () {
    var id = $(this).data('id');
    $.ajax({
        url: '/Admin/Product/GetBrand/' + id,
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            var rows;
            if (data.length > 0) {
                $.each(data, function (i, item) {
                    rows += "<tr>" +
                       "<td>" + item.Name + "</td><td>" + i + "</td><td>" + item.CreatedDate + "</td><td>" + item.Status + "</td>" +
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

