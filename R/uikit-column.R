##' Create a shinyuikit Card Body
##' 
##' Build a UIkit Card Body for Shiny
##' 
##' @param ... The UI elements to place in the card body.
##' @param divider logical. Add divider. 
##' @export
ukColumn <- function(..., ncol = 2, divider = FALSE) {

  if (!is.numeric(ncol) || (ncol < 1) || (ncol > 6)) 
    stop("column width must be between 1 and 6")
  cl <- paste0("uk-column-1-", ncol)
  
  if (isTRUE(divider))
    cl <- paste(cl, "uk-column-divider")
  shiny::tags$div(class = cl, ...)
}
