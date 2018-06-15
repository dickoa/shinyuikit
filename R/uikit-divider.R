##' UIkit horizontal divider
##'
##' @param icon add a icon to the divider
##' @param small small divider
##' @export
ukDivider <- function(icon = FALSE, small = FALSE) {
  
  cl <- NULL

  if (isTRUE(icon) & isTRUE(small))
    stop("You can just pick on parameter, either `icon` or `small`")
  
  if (isTRUE(icon))
    cl <- "uk-divider-icon"

  if (isTRUE(small))
    cl <- "uk-divider-small"
  
  shiny::tags$hr(class = cl)
}
