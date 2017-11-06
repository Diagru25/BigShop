var product = {
    init: function () {
        product.regEvents();
    },
    regEvents: function () {
        $('.deleteadmin').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Admin/Product/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/Admin/Product/Index";
                    }
                }
            })
        })
        function getDetailProduct(id) {
            $.ajax({
                url: '/Admin/Product/Get/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $("#input1").val(data.Name);
                    $("#input2").val(data.Metatitle);
                    $("#input3").val(data.Metakeyword);
                    $("#input4").val(data.Price);
                    $("#input5").val(data.Quantity);
                    $("#editModel").modal('show');
                },
                error: function (err) {
                    alert("Error: " + err.responseText);
                }
            });
        };
    }

}
product.init();


(function GetCategory() {
    $.ajax({
        url: "/Admin/Product/GetCategory/",
        type: "post",
        dataType: "json",
        error: function () {
            alert('abc');
        },
        success: function (data) {
            var rows = "<option>Sản phẩm</option>";
            $.each(data, function (i, item) {
                rows += "<option value=' " + item.ID + "'>" + item.Name + "</option>";
                $('#category').html(rows);
            })

        }
    });
})();
$('#category').click(function GetBrand() {
    $.ajax({
        url: "/Admin/Product/GetBrand/",
        type: "post",
        dataType: "json",
        error: function () {
            alert('abc');
        },
        success: function (data) {
            var rows = "<option>Chọn hãng</option>";
            $.each(data, function (i, item) {
                rows += "<option value=' " + item.ID + "'>" + item.Name + "</option>";
                $('#brand').html(rows);
            })

        }
    });
})