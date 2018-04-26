##' Create a shinyuikit Navbar
##' 
##' Build a shinyuikit Navbar
##'
##' @param ... The UI elements to place in the navigation bar
##' @param transparent The UI elements to place in the navigation bar
##' @param margin The UI elements to place in the navigation bar
##' @param position The UI elements to place in the navigation bar
##' @param options The UI elements to place in the navigation bar
##' @export
ukNavbar <- function(..., transparent = FALSE, margin = FALSE, position = "left", overlay = FALSE, options = NA) {

  assert_position(position)

  cl <- "uk-navbar-container"

  if (isTRUE(transparent))
    cl <- paste(cl, "uk-navbar-transparent")

  if (isTRUE(margin))
    cl <- paste(cl, "uk-margin")

  if (!is.null(position))
    position <- paste("uk-navbar-", position)
      
  shiny::tags$nav(
    class = cl,
    shiny::tags$div(class = position, ...),
    `uk-navbar` = options
  )
}

##' @param ... The UI elements to place in the navigation bar dropdown
##' @rdname ukNavbar
##' @export
ukNavbarDropdown <- function(...) {
  shiny::tags$div(
    class = "uk-navbar-dropdown",
    ...
  )
}

##' @param ... The UI elements to place in the navigation bar dropdown
##' @rdname ukNavbar
##' @export
ukNavbarItem <- function(...) {
  shiny::tags$div(
    class = "uk-navbar-item",
    ...
  )

}