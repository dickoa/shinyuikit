##' Create a shinyuikit text input
##' 
##' UIkit text input for shiny
##'
##' @param inputId character. The input identifider used to access the value.
##' @param label character. Input label.
##' @param placeholder character. Input placeholder.
##'
##' @examples
##' \dontrun{
##' library(shiny)
##' shinyApp(
##'   ui = ukPage(
##'    tags$h1("Hello UIkit"),
##'    ukTextInput("txt", label = "Input text", placeholder = "Type here"),
##'    verbatimTextOutput("default")
##'   ),
##'   server = function(input, output) {
##'     output$default <- renderText({ input$txt })
##'   }
##' )
##' }
##' @export
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
