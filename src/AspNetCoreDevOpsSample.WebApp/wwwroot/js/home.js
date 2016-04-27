"use strict";

(function (global, $) {
    function HomeIndex() {
        HomeIndex.init.apply(this, arguments);
    }

    var changeText = function (ev) {
        var $element = $(ev.target);
        $element.text("You Sure?");
        return false;
    };

    HomeIndex.init = function(selector) {
        $(selector || ".btn").on("click", changeText);
    };

    HomeIndex.changeText = changeText;

    global.homeIndex = HomeIndex;
})(window, jQuery);