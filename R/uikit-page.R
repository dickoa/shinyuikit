##' Create a shinyuikit page
##' 
##' Build a shinyuikit pages
##'
##' 
##' @param ... 
##' @param title character. The title of the page
##' @examples
##' \dontrun{
##' library(shiny)
##' 
##' shiny::shinyApp(
##'   ui = ukPage(
##'    tags$h1("Hello UIkit"),
##'   ),
##'   server = function(input, output) {}
##' )
##' }
##' @export
ukPage <- function(..., title = NULL) {
 
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    id = "shinyuikit-html",
    shiny::tags$head(
      if (!is.null(title)) tags$title(title),
      shiny::tags$meta(
        charset = "utf-8"
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1"
      ),
      shiny::includeCSS(
        system.file("www/uikit/css/uikit.min.css", package = "shinyuikit")
      ),
      shiny::includeCSS(
        system.file("www/ionicons/css/ionicons.min.css", package = "shinyuikit")
      ),
      shiny::includeScript(
        system.file("www/uikit/js/uikit.min.js", package = "shinyuikit")
      ),
      shiny::includeScript(
        system.file("www/uikit/js/uikit-icons.min.js", package = "shinyuikit")
      )
    ),
    # body --------------------------------------------------------------------
    ...
  )
}
