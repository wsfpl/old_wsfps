$(document).ready(function () {
    setTimeout(function () {
        menu_click();
    }, 0.001)

    function menu_click() {
        $(".menu-box").click(function () {
            $(this).toggleClass("open");
            $(".site-navigation").toggleClass("opened");
            $(".content-box-wrapper").toggleClass("wid-change");
            $('table').css("width", "100%");
        });
    }
    $(".create-btn").click(function () {
        $("#create-modal").modal();
    });
    var table = $('.user-data-table').DataTable({
        responsive: true,
        paging: true,
    });
})
