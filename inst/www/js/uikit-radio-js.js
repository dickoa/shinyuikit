$(document).ready(function () {
  
  var shinyUIkitRadio = new Shiny.InputBinding();
  $.extend(shinyUIkitRadio, {
    find: function(scope) {
      return $(scope).find(".shinyUIkitRadio");
    },
    getValue: function(el) {
      return $('input.uk-radio:checked').val();
    },
    subscribe: function(el, callback) {
      $(el).on("change.shinyUIkitRadio", function(e) {
	callback();
      });
    },
    unsubscribe: function(el) {
      $(el).off(".shinyUIkitRadio");
    }
  });

  Shiny.inputBindings.register(shinyUIkitRadio);
});