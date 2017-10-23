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
        }
    }
}
product.init();