##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param inputId 
##' @param label 
##' @param placeholder 
##' @param stacked 
##' @return 
##' @author Ahmadou H. Dicko
ukTextInput <- function(inputId, label, placeholder, stacked = TRUE) {
  layout <- "uk-form-stacked"
  if (!stacked)
    layout <- "uk-form-horizontal"
  
  txt <- shiny::tags$form(
    class = layout,
    shiny::tags$fieldset(
      class = "uk-fieldset",
      shiny::tags$input(
        class = "uk-input shinyUIkitText",
        type = "text",
        id = inputId,
        placeholder = placeholder
      )
    )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-text-js.js", package = "shinyuikit")
        )
      )
    ),
    txt
  )
}
