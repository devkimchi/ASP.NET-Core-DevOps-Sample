/// <reference path="../node_modules/jasmine/node_modules/jasmine-core/lib/jasmine-core.js"/>
/// <reference path="../node_modules/jquery/dist/jquery.js"/>
/// <reference path="../node_modules/jasmine-jquery/lib/jasmine-jquery.js"/>
/// <reference path="../../../src/AspNetCoreDevOpsSample.WebApp/wwwroot/js/home.js"/>

describe("When the 'learn more' button is clicked", function () {
    it("should change text", function () {
        setFixtures("<a class='btn'>Learn More</a>");
        $(".btn").on("click", homeIndexInit.changeText);

        var ev = spyOnEvent(".btn", "click");
    	$(".btn").trigger("click");

    	expect(ev).toHaveBeenTriggered();
        expect($(".btn")).toHaveText("You Sure?");
    });
});