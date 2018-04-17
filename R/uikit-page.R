##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param ... 
##' @param title 
##' @return 
##' @author Ahmadou H. Dicko
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
