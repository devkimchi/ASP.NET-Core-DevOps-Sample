"use strict";

(function (global, $) {
    var changeText = function (ev) {
        var $element = $(ev.target);
        $element.text("You Sure?");
        return false;
    };

    $(".btn").on("click", changeText);

    var homeIndexInit = function () {
        this.changeText = changeText;
    };

    global.homeIndexInit = homeIndexInit;
})(window, jQuery);