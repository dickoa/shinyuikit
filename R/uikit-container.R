##' Building container in shinyuikit
##'
##' UIkit container for shiny
##' 
##' @param ...  The UI elements to place in the card
##' @param size character. size of the container 'small', 'medium' or 'large'.
##' @examples
##' \dontrun{
##' library(shiny)
##' shinyApp(
##'  ui = ukPage(
##'   ukContainer(
##'     h1("Hello", class = "uk-heading")
##'   )
##'  ),
##'  server = function(input, output) {}
##' )}
##' @author Ahmadou H. Dicko
ukContainer <- function(..., size = NULL) {
  
  if (!is.null(size) && !size %in% c("small", "large", "expand"))
    stop("size should be on of 'small', 'large' or 'expand'", call. = FALSE)

  cl <- "uk-container"

  if(!is.null(size))
    cl <- paste(cl, paste0("uk-container-", size))

  shiny::tags$div(
    class = cl,
    ...
  )
}
