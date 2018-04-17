##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param inputId 
##' @param label 
##' @param rows 
##' @param placeholder 
##' @param stacked 
##' @return 
##' @author Ahmadou H. Dicko
ukTextAreaInput <- function(inputId, label, rows = 3L, placeholder, stacked = TRUE) {
  layout <- "uk-form-stacked"
  if (!stacked)
    layout <- "uk-form-horizontal"
  
  txtarea <- shiny::tags$form(
    class = layout,
    shiny::tags$fieldset(
      class = "uk-fieldset",
      shiny::tags$textarea(
        class = "uk-textarea shinyUIkitTextArea",
        rows = rows,
        id = inputId,
        placeholder = placeholder
      )
    )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-textarea-js.js", package = "shinyuikit")
        )
      )
    ),
    txtarea
  )
}
