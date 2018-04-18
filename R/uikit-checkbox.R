##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param inputId 
##' @param label 
##' @param choices 
##' @param selected 
##' @param stacked 
##' @return 
##' @author Ahmadou H. Dicko
ukCheckBoxInput <- function(inputId, label, choices = NULL, selected = NULL) {

  if (is.null(choices))
    stop("missing choices", call. = FALSE)
 
  if (length(names(choices))) {
    choices <- list(name = names(choices), value = unname(choices))
  } else {
    choices <- list(name = choices, value = choices)
  }
  
  checkbox <- shiny::tags$div(
    class = "uk-form-controls shinyUIkitCheckBox",
    id = inputId
  )

  for (i in seq_along(choices[[1]])) {
    input <- shiny::tags$input(
      class = "uk-checkbox",
      type = "checkbox",
      name = inputId,
      value = choices$value[i]
    )
    
    if (!is.null(selected) && choices$value[i] == selected)
      input <- shiny::tagAppendAttributes(input, checked = NA)    
    choicetag <- shiny::tags$label(input, choices$name[i])
    checkbox <- shiny::tagAppendChild(checkbox, choicetag)
  }

  checkbox <- tags$form(
    tags$fieldset(
      class = "uk-fieldset",
      checkbox
   )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-checkbox-js.js", package = "shinyuikit")
        )
      )
    ),
    checkbox
  )
}
