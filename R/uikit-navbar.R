##' Create a shinyuikit NavBar
##' 
##' Build a shinyuikit NavBar
##'
##' @param ... The UI elements to place in the navigation bar
##' @param transparent The UI elements to place in the navigation bar
##' @param margin The UI elements to place in the navigation bar
##' @param position The UI elements to place in the navigation bar
##' @param options The UI elements to place in the navigation bar
##' @export
ukNavBar <- function(..., transparent = FALSE, margin = FALSE, position = NULL, options = NA) {

  if (!is.null(position) && !position %in% c("left", "right", "center"))
    stop("position should be on of 'left', 'right' or 'center'", call. = FALSE)
  
  cl <- "uk-navbar-container"

  if (isTRUE(transparent))
    cl <- paste(cl, "uk-navbar-transparent")

  if (isTRUE(margin))
    cl <- paste(cl, "uk-margin")
 
  shiny::tags$nav(
    class = cl,
    tags$div(class = position),
    ...,
    `uk-navbar` = options
  )
}

##' @param ... The UI elements to place in the navigation bar dropdown
##' @rdname ukNavBar
##' @export
ukNavBarDropDown <- function(...) {
  shiny::tags$div(
    class = cl,
    ...,
    `uk-navbar` = options
  )

}