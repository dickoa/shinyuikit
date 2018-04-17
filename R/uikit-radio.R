##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param inputId 
##' @param label 
##' @param choices 
##' @param selected 
##' @param stacked 
##' @param vertical 
##' @return 
##' @author Ahmadou H. Dicko
ukRadioInput <- function(inputId, label, choices = NULL, selected = NULL, stacked = TRUE, vertical = TRUE) {
  layout <- "uk-form-stacked"
  if (!stacked)
    layout <- "uk-form-horizontal"
 
  if (is.null(choices) || is.null(selected))
    stop("missing choices or selected", call. = FALSE)
  
  if (length(names(choices))) {
    choices <- list(name = names(choices), value = unname(choices))
  } else {
    choices <- list(name = choices, value = choices)
  }
  
  radio <- shiny::tags$div(
    class = "uk-form-controls shinyUIkitRadio",
    id = inputId
  )

  for (i in seq_along(choices[[1]])) {
    input <- shiny::tags$input(
      class = "uk-radio",
      type = "radio",
      name = inputId,
      value = choices$value[i]
    )
    
    if (choices$value[i] == selected)
      input <- shiny::tagAppendAttributes(input, checked = NA)    
    choicetag <- shiny::tags$label(input, choices$name[i])
    radio <- shiny::tagAppendChild(radio, choicetag)
    if (isTRUE(vertical))
      radio <- tagList(radio, br())
  }

  radio <- tags$form(
    class = layout,
    tags$fieldset(
      class = "uk-fieldset",
      radio
   )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-radio-js.js", package = "shinyuikit")
        )
      )
    ),
    radio
  )
}
