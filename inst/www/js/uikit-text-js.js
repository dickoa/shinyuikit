$(document).ready(function () {

    var shinyUIkitText = new Shiny.InputBinding();
    $.extend(shinyUIkitText, {
        find: function (scope) {
            return $(scope).find(".shinyUIkitTextInput");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shinyUIkitText", function (e) {
                callback();
            });
        },
        unsubscribe: function(el) {
          $(el).off(".shinyUIkitTextInput");
        }
    });

    Shiny.inputBindings.register(shinyUIkitText);
});