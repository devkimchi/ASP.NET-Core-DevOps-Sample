"use strict";

(function ($) {
    $(".btn").click(function() {
        $(this).text("You Sure?");
        return false;
    });
})(jQuery);