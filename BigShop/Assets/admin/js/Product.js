
var product = {
    init: function () {
        product.regEvents();
    },
    regEvents: function () {
        $('#dataTables-example').on('click', '.deleteadminproduct', function () {
            var id = $(this).data('id');
            $('#confirm_delete').modal('show');
            $('#btn_ok').click(function () {
                $.ajax({
                    data: { id: id  },
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
            
        })
        $('#dataTables-example').on('click', '.editadminproduct', function () {
            var ProductID = $(this).data('id');
            $.ajax({
                url: '/Admin/Product/Get',
                data: { id: $(this).data('id') },
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $('#input0').val(ProductID);
                    $("#input1").val(data.Name);
                    $("#input4").val(accounting.formatNumber(data.Price));
                    $("#input5").val(data.Quantity);
                    $("#editimg").html('<img src="http://localhost:64898' + data.Image + '"class="img-responsive"/>');
                    $('#editModel').modal('show');
                },
                error: function (err) {
                    alert("Error: " + err.responseText);
                }
            });
        });

        $('#imageEdit').change(function () {
            var file = $('#imageEdit').get(0);

            var formData = new FormData();
            for (var i = 0; i < file.files.length; i++) {
                formData.append(file.files[i].name, file.files[i]);
            }
            $.ajax({
                url: '/Admin/Product/LoadEditImg',
                type: 'POST',
                data: formData,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function (pic) {
                    $("#editimg").html('<img src="http://localhost:64898/Assets/client/images/' + pic + '"class="img-responsive"/>');
                }

            })
        });
        $('#image').change(function () {
            var file = $('#image').get(0);

            var formData = new FormData();
            for (var i = 0; i < file.files.length; i++) {
                formData.append(file.files[i].name, file.files[i]);
            }
            $.ajax({
                url: '/Admin/Product/LoadEditImg',
                type: 'POST',
                data: formData,
                dataType: 'json',
                contentType: false,
                processData: false,
                success: function (pic) {
                    $("#addimg").html('<img src="http://localhost:64898/Assets/client/images/' + pic + '"class="img-responsive"/>');
                }

            })
        });
    }

}
product.init();


(function GetCategory() {
    $.ajax({
        url: "/Admin/Product/GetCategory/",
        type: "post",
        dataType: "json",
        success: function (data) {
            var rows = "<option>Sản phẩm</option>";
            $.each(data, function (i, item) {
                rows += "<option value=" + item.ID + ">" + item.Name + "</option>";
                $('.category').html(rows);
            })
        }
    });
})();


function GetBrandByCategory(id) {
    $.ajax({
        url: "/Admin/Product/GetBrand/" + id,
        type: "POST",
        dataType: "json",
        success: function (data) {
            var datacount = data.length;
            if (datacount == 0) {
                $('#brand').hide();
            }
            else {
                $('#brand').show();
                var rows = "<option>Tất cả</option>";
                $.each(data, function (i, item) {
                    rows += "<option value=" + item.ID + ">" + item.Name + "</option>";
                    $('#brand').html(rows);
                })
            }
        }
    })
}

function GetProduct(brandid, cateid) {
    $.ajax({
        url: "/Admin/Product/GetBrandCategory?brandid=" + brandid + "&cateid=" + cateid,
        type: "POST",
        dataType: "json",
        success: function (data) {
            var rows;
            if (data.length == 0) { rows = "<tr><td class = 'alert alert-danger' colspan='7'>Không có dữ liệu</td></tr>" }
            $.each(data, function (i, item) {
                rows += "<tr>" +
                    "<td>" + item.ID + "</td>" +
                    "<td>" + item.Name + "</td>" +
                    "<td class='center'>" + accounting.formatNumber(item.Price) + '₫' + "</td>" +
                    "<td class='center'>" + item.Quantity + "</td>" +
                    "<td style='width: 100px; height: auto'><img src=" + item.Image + " class='img-responsive' /></td>" +
                    "<td><button class='btn btn-success btn_image' data-id='" + item.ID + "' >Quản lý ảnh</button> |<button class='btn btn-primary editadminproduct' data-id='" + item.ID + "')'>Sửa</button> | <a class='btn btn-danger deleteadminproduct' data-id='" + item.ID + "' id='adminDelete'>Xóa</a></td></tr>";
            })
            $('#table').html(rows);
        }
    })
    //$('#dataTables-example').DataTable().ajax.reload();
}

$('#category').change(function () {
    var id = $('#category :selected').val();
    GetBrandByCategory(id);
    change_con();

})
$('#brand').change(function () {
    change_con();
})

function change_con() {
    var id = $('#category :selected').text();
    var brandid, cateid;

    if (id == "Sản phẩm") {
        cateid = 0;
        brandid = 0;
    }
    else {
        if ($('#brand :selected').text() == "Tất cả" || $('#brand :selected').text() == "Chọn hãng") brandid = 0;
        else brandid = $('#brand :selected').val();
        cateid = $('#category :selected').val();
    }
    GetProduct(brandid, cateid);
}

function GetBrandByCategoryAdd(id) {
    $.ajax({
        url: "/Admin/Product/GetBrand/" + id,
        type: "POST",
        dataType: "json",
        success: function (data) {
            var datacount = data.length;
            if (datacount == 0) {
                $('#brand_add').hide();
            }
            else {
                $('#brand_add').show();
                var rows;
                $.each(data, function (i, item) {
                    rows += "<option value=" + item.ID + ">" + item.Name + "</option>";
                    $('#brand_add').html(rows);
                })
            }
        }
    })
}
$('#category_add').change(function () {
    var id = $('#category_add :selected').val();
    GetBrandByCategoryAdd(id);
});

$('#dataTables-example').on("click", ".btn_image", function () {
    $('#imagemodal').modal('show');
    $('#productID').val($(this).data('id'));
    $('#imgList').html('');
    loadImages();
})
$('#chooseImg').off('click').on('click', function () {
    var finder = new CKFinder();
    finder.selectActionFunction = function (url) {
        $('#imgList').append('<div style="float: left;"><img src ="' + url + '" width = "50" /><a href="#" class="btnDel"><i class="fa fa-times"></i></a></div>');

        $('.btnDel').off('click').on('click', function () {
            $(this).parent().remove();
        })
    };
    finder.popup();
});
$('#saveImg').off('click').on('click', function () {
    var images = [];
    var id = $('#productID').val();
    $.each($('#imgList img'), function (i, item) {
        images.push($(item).prop('src'));
    })

    $.ajax({
        url: '/Admin/Product/SaveImages',
        type: 'POST',
        data: {
            id: id,
            images: JSON.stringify(images)
        },
        dataType: "json",
        success: function (response) {
            if (response.status) {
                alert('Lưu thành công');
                $('#imagemodal').modal('hide');
                $('#imgList').html('');
            }
            else {
                alert("Lỗi");
            }
        }
    })
})
function loadImages() {
    $.ajax({
        url: '/Admin/Product/LoadImages',
        type: 'GET',
        data: {
            id: $('#productID').val()
        },
        dataType: "json",
        success: function (response) {
            if (response.status) {
                var data = response.data;
                var htmls = '';
                $.each(data, function (i, item) {
                    htmls += '<div style="float: left;"><img src ="' + item + '" width = "50" /><a href="#" class="btnDel"><i class="fa fa-times"></i></a></div>'
                })
                $('#imgList').html(htmls);
            }
        }
    })
}

// Danh muc sản phẩm






