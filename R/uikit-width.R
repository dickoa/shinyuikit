##' UIkit width div for shiny
##'
##' 
##' @param ... UI element to insert
##' @param width width of UI
##' @export
ukWidth <- function(..., width = "half") {
  
  assert_width(width)
  
  cl <- uk_width(width)
 
  shiny::tags$div(
    class = cl,
    ...
  )
}