##' Create a shinyuikit search input
##' 
##' UIkit search input for shiny
##'
##' @param inputId character. The input identifider used to access the value.
##' @param label character. Input label.
##' @param placeholder character. Input placeholder.
##' @param width character. Input width.
##' 
##' @examples
##' \dontrun{
##' library(shiny)
##' shinyApp(
##'   ui = ukPage(
##'    tags$h1("Hello UIkit"),
##'       ukSearchInput("txt", placeholder = "Type here"),
##'    verbatimTextOutput("default")
##'   ),
##'   server = function(input, output) {
##'     output$default <- renderText({ input$txt })
##'   }
##' )
##' }
##' @export
ukSearchInput <- function(inputId, label = NULL, placeholder = NULL, width = NULL, navbar = FALSE, default_style = TRUE) {

  cl <- "uk-search ShinyUIkitSearch"

  assert_width(width)
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))

  if (isTRUE(default_style))
    cl <- paste(cl, paste0("uk-search-default"))
  
  if (isTRUE(navbar))
    cl <- paste(cl, "uk-search-navbar")
  
  search <- shiny::tags$form(
    class = cl,
    shiny::tags$fieldset(
      class = "uk-fieldset",
      if (!is.null(label)) shiny::tags$label(class = "uk-form-label", `for` = inputId, label),
      shiny::tags$input(
        class = "uk-search-input",
        type = "search",
        id = inputId,
        placeholder = placeholder
      )
    )
  )
 
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-search-js.js", package = "shinyuikit")
        )
      )
    ),
    search
  )
}
