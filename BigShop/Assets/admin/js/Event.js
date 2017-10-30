$('#btn_feedback').click(function () {
    $('#panel-feedback').show();
    $('#panel-order').hide();
})
$('#btn_order').click(function () {
    $('#panel-feedback').hide();
    $('#panel-order').show();
})