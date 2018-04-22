##' Create a shinyuikit select input
##' 
##' UIkit select input form for Shiny
##'
##' @param inputId character.The input identifider used to access the value.
##' @param label character. Input label.
##' @param choices character. Named or unnamed vector of choices or a list of vector to make group of select option.
##'
##' @examples
##' \dontrun{
##' library(shiny)
##'
##' shinyApp(
##'   ui = ukPage(
##'    tags$h1("Hello UIkit"),
##'    ukSelectInput("var", "Select",
##'      choices = c("Miles per galon" = "mpg", "Displacement" = "disp")),
##'    tableOutput("plot")
##'   ),
##'   server = function(input, output) {
##'     output$plot <- renderTable({
##'       mtcars[, c("wt", input$var), drop = FALSE]
##'     }, rownames = TRUE)
##'   }
##' )
##' }
##' @export
ukSelectInput <- function(inputId, label, choices = NULL, width = NULL) {
  
  cl <- "uk-input shinyUIkitSelect"

  assert_width(width)
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))

  select <- shiny::tags$select(
    class = cl,
    id = inputId
  )
  
  if (is.list(choices)) {
    choicestag <- Reduce(shiny::tagList, lapply(seq_along(choices), function(i) shiny::tagAppendChild(shiny::tags$optgroup(label = names(choices)[i]), choices2options(choices[[i]]))))
  } else {
    choicestag <- choices2options(choices)
  }
  select <- shiny::tagAppendChild(select, choicestag)

  select <- shiny::tags$form(
    shiny::tags$fieldset(
      class = "uk-fieldset",
      shiny::tags$label(`for` = inputId, label),
      select
    )
  )
        
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-select-js.js", package = "shinyuikit")
        )
      )
    ),
    select
  )
}
