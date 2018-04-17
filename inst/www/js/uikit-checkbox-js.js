$(document).ready(function () {
  
  var shinyUIkitCheckBox = new Shiny.InputBinding();
  $.extend(shinyUIkitCheckBox, {
    find: function(scope) {
      return $(scope).find(".shinyUIkitCheckBox");
    },
    getValue: function(el) {
      var $objs = $(el).find('input.uk-checkbox:checked');
      var values = new Array($objs.length);
      for (var i = 0; i < $objs.length; i ++) {
    	values[i] = $objs[i].value;
      }
      console.log(values);
      return values;
    },
    // getValue: function(el) {
    //   return $('input.uk-checkbox:checked').val();
    // },
    subscribe: function(el, callback) {
      $(el).on("change.shinyUIkitCheckBox", function(e) {
	callback();
      });
    },
    unsubscribe: function(el) {
      $(el).off(".shinyUIkitCheckBox");
    }
  });

  Shiny.inputBindings.register(shinyUIkitCheckBox);
});