/// <reference path="../../node_modules/jasmine/lib/jasmine.js"/>
/// <reference path="../../node_modules/jquery/dist/jquery.js"/>
/// <reference path="../../node_modules/jasmine-jquery/lib/jasmine-jquery.js"/>
/// <reference path="../../../../src/AspNetCoreDevOpsSample.WebApp/wwwroot/js/home.js"/>

describe("When the 'learn more' button is clicked", function () {
    var msgA = "Learn More";
    var msgB = "You Sure?";

    beforeEach(function() {
        homeIndex.init();
        setFixtures("<a class='btn'>" + msgA + "</a>");
    });

    it("should change text", function () {
        $(".btn").on("click", homeIndex.changeText);

        var ev = spyOnEvent(".btn", "click");
    	$(".btn").trigger("click");

    	expect(ev).toHaveBeenTriggered();
        expect($(".btn")).toHaveText(msgB);
    });
});