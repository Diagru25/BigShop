var check = 0;
$('.test').hover(function () {
    $(this).children("div").css({ "background-color": "#eee" });
}, function () {
    $(this).children("div").css({ "background-color": "#ffffff" });
})

$('.test').click(function (e) {
    console.log(this);
    if (check == 0) {
        $(this).children('.s_content').hide();
        $(this).children('.s_btn').hide();
        $(this).children("div").children(".Edit_Content").slideDown();
    }
    else {
        check = 0;
    }
})

$('.btn_cancel').click(function (e) {
    $('.Edit_Content').slideUp();
    $('.s_content').show();
    $('.s_btn').show();
    check = 1;
})