$(document).ready(function () {  
  var shinyUIkitTextArea = new Shiny.InputBinding();
  $.extend(shinyUIkitTextArea, {
      find: function (scope) {
          return $(scope).find(".shinyUIkitTextInputArea");
	}
    });	     
    Shiny.inputBindings.register(shinyUIkitTextArea);
});
