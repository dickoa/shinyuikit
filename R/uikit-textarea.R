#' Create a shinyuikit text input
#' 
#' UIkit text input for shiny
#'
#' @param inputId character. The input identifider used to access the value.
#' @param label character. Input label.
#' @param row integer. Number of rows for text canvas.
#' @param placeholder character. Input placeholder.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#' shinyApp(
#'   ui = ukPage(
#'    tags$h1("Hello UIkit"),
#'    ukTextAreaInput("txt", label = "Input text", placeholder = "Type here"),
#'    verbatimTextOutput("default")
#'   ),
#'   server = function(input, output) {
#'     output$default <- renderText({ input$txt })
#'   }
#' )
#' }
#' @export
ukTextAreaInput <- function(inputId, label, rows = 3L, placeholder = NULL) {

  txtarea <- shiny::tags$form(
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
