var user = {
    init: function () {
        user.regEvents();
    },
    regEvents: function () {
        $('.deleteUser').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Admin/User/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if(res.status == true)
                    {
                        window.location.href = "/Admin/User/Index";
                    }
                }
            })
        })
        $('.manipulation').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/Admin/User/Manipulation',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/Admin/User/Index";
                    }
                }
            })
        })
        $('.lvupuser').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id'), actions: $(this).data('actions')},
                url: '/Admin/User/ChangeType',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/Admin/User/Index";
                    }
                }
            })
        })
        $('.lvdwuser').off('click').on('click', function () {
            $.ajax({
                data: { id: $(this).data('id'), actions: $(this).data('actions') },
                url: '/Admin/User/ChangeType',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/Admin/User/Index";
                    }
                }
            })
        })
    }
}
user.init();