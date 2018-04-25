##' Create a shinyuikit radio
##'
##' UIkit radio for Shiny
##' @param inputId character. The input identifider used to access the value
##' @param label character. Radio label
##' @param choices character. Named or unnamed vector of choices.
##' @param selected character. Selected radio input
##' @examples
##' \dontrun{
##' library(shiny)
##' 
##' shinyApp(
##'   ui = ukPage(
##'    tags$h1("Hello UIkit"),
##'    ukRadioInput("select", c("Miles per galon" = "mpg", "Rear axle ratio" = "drat"), selected = "mpg"),
##'    verbatimTextOutput("selected")
##'   ),
##'   server = function(input, output) {
##'     output$selected <- renderText({
##'       input$select
##'     })
##'   }
##' )
##' }
##' @export
ukRadioInput <- function(inputId, label = NULL, choices = NULL, selected = NULL) {

  selected <- restoreInput(id = inputId, default = selected)
  
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
  }
  
  radio <- shiny::tags$form(
    shiny::tags$fieldset(
      class = "uk-fieldset",
      if (!is.null(label)) shiny::tags$label(`for` = inputId, label),
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