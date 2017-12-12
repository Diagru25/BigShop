

window.onload = function () {

    $.ajax({
        url: '/Admin/Product/Top',
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            var config = {
                type: 'pie',
                data: {
                    datasets: [{
                        data: [
                            data[0].Quantity,
                            data[1].Quantity,
                            data[2].Quantity,
                            data[3].Quantity,
                            data[4].Quantity
                        ],
                        backgroundColor: [
                            window.chartColors.red,
                            window.chartColors.orange,
                            window.chartColors.yellow,
                            window.chartColors.green,
                            window.chartColors.blue,
                        ],
                        label: 'Dataset 1'
                    }],
                    labels: [
                        data[0].Name,
                        data[1].Name,
                        data[2].Name,
                        data[3].Name,
                        data[4].Name
                    ]
                },
                options: {
                    responsive: true
                }
            };
            var revenue = {
                type: 'pie',
                data: {
                    datasets: [{
                        data: [
                            data[0].Revenue,
                            data[1].Revenue,
                            data[2].Revenue,
                            data[3].Revenue,
                            data[4].Revenue
                        ],
                        backgroundColor: [
                            window.chartColors.red,
                            window.chartColors.orange,
                            window.chartColors.yellow,
                            window.chartColors.green,
                            window.chartColors.blue,
                        ],
                        label: 'Dataset 1'
                    }],
                    labels: [
                        data[0].Name,
                        data[1].Name,
                        data[2].Name,
                        data[3].Name,
                        data[4].Name
                    ]
                },
                options: {
                    responsive: true
                }
            };
            var ctx = document.getElementById("chart-area").getContext("2d");
            window.myPie = new Chart(ctx, config);

            var ctxr = document.getElementById("chart-area-revenue").getContext("2d");
            window.myPie = new Chart(ctxr, revenue);
            var rows;
            $.each(data, function (i, item) {
                rows += '<tr>' + '<td>' + item.ID + '</td>' +
                              '<td>' + item.Name + '</td>' +
                              '<td>' + accounting.formatNumber(item.Price) + '₫' + '</td>' +
                              '<td>' + item.Quantity + '</td>' +
                              //<td style="width: 100px; height: auto"><img src="" class="img-responsive" /></td>
                              '<td>' + accounting.formatNumber(item.Revenue) + '₫' + '</td></tr>';
            })

            $('#tb_stat').html(rows);
        }
    })

};
