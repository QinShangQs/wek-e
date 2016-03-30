// JavaScript Document

$(function () {

    //新闻向上滚动
    var time = 500;  //向上滚动的速度
    var jiange = 2000; //间隔的时间
    var xinwen_ul = $(".xinwen ul");

    var goto = function () {
        var height = xinwen_ul.height();
        var s_h = xinwen_ul.scrollTop();
        if (s_h > height / 3 * 2) {
            xinwen_ul.scrollTop(0);
        } else {
            xinwen_ul.animate({
                scrollTop: s_h + 30
            }, time)
        }
    }
    var kaishi = window.setInterval(goto, jiange);
    xinwen_ul.hover(function () {
        window.clearInterval(kaishi);
    }, function () {
        window.setInterval(goto, jiange);
    });

    //menu栏子页变色

//    var _url = window.location.href;
//    var menu_a = $(".mennu a");
//    menu_a.each(function (index, element) {
//        var _this = $(this);
//        var a_href = _this.attr("href");
//        if (_url.indexOf(a_href) != -1) {
//            _this.addClass("set");
//        } else {
//            _this.removeClass("set");

//        }
//    });



});