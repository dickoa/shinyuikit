##' Create a shinyuikit text input
##' 
##' UIkit text input for shiny
##'
##' @param inputId character. The input identifider used to access the value.
##' @param label character. Input label.
##' @param value Initial value.
##' @param placeholder character. Input placeholder.
##' @param width character. Input UI width.
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
ukTextInput <- function(inputId, label = NULL, value = "", placeholder = NULL, width = NULL) {

  value <- shiny::restoreInput(id = inputId, default = value)
  
  cl <- "uk-input shinyUIkitText"

  assert_width(width)

  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  txt <- shiny::tags$form(
    shiny::tags$fieldset(
      class = "uk-fieldset",
      if (!is.null(label)) shiny::tags$label(class = "uk-form-label", `for` = inputId, label),
      shiny::tags$input(
        class = cl,
        type = "text",
        id = inputId,
        value = value,
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
