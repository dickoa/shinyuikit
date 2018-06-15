$(document).ready(function () {

    var shinyUIkitSelectInput = new Shiny.InputBinding();
    $.extend(shinyUIkitSelectInput, {
        find: function (scope) {
            return $(scope).find(".shinyUIkitSelect");
        },
        getValue: function (el) {
          console.log($(el).val());
          return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shinyUIkitSelectInput", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shinyUIkitSelect");
        }
    });

    Shiny.inputBindings.register(shinyUIkitSelectInput);
});
