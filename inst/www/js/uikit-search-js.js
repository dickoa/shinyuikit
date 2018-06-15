$(document).ready(function () {

    var shinyUIkitSearch = new Shiny.InputBinding();
    $.extend(shinyUIkitSearch, {
        find: function (scope) {
            return $(scope).find(".shinyUIkitSearchInput");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shinyUIkitSearch", function (e) {
                callback();
            });
        },
        unsubscribe: function(el) {
          $(el).off(".shinyUIkitSearchInput");
        }
    });

    Shiny.inputBindings.register(shinyUIkitSearch);
});