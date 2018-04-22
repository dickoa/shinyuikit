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
ukTextInput <- function(inputId, label, placeholder, width = NULL) {

  cl <- "uk-input shinyUIkitText"

  assert_width(width)

  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  txt <- shiny::tags$form(
    shiny::tags$fieldset(
      class = "uk-fieldset",
      shiny::tags$label(class = "uk-form-label", `for` = inputId, label),
      shiny::tags$input(
        class = cl,
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
