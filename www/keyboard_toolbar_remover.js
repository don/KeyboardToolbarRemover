/*global cordova*/
'use strict';

    var exec = cordova.require('cordova/exec'),
        win = function (success) {
            // do nothing, succeed quietly
        };

    function hide() {

        var fail = function (error) {
            console.log("Error hiding the web form accessory toolbar" + error);
        };

        exec(win, fail, "KeyboardToolbarRemover", "hide", []);
    }


    function show() {

        var fail = function (error) {
            console.log("Error enabling web form accessory toolbar" + error);
        };

        exec(win, fail, "KeyboardToolbarRemover", "show", []);
    }

    module.exports = {
        hide: hide,
        show: show
    };