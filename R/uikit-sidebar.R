##' UIkit sidebar layout
##'
##' @param ... UI element to add 
##' @export
ukSidebarLayout <- function(...) {

  shiny::tags$div(
    class = "uk-offcanvas-content",
    ...
  )
}


##' UIkit side bar
##'
##' create a right side bar
##' @param ... UI element to include in the sidebar
##' @param sidebar_id id of the sidebar
##' @param title sidebar header
##' @export
ukSidebar <- function(..., sidebar_id, title = NULL) {
  
  shiny::tags$div(
    id = sidebar_id,
    shiny::tags$div(
      class = "uk-offcanvas-bar",
      ukSidebarClose(),
      shiny::tags$h3(title),
      ...
    ),
    `uk-offcanvas` = NA
  )
}


##' UIkit sidebar toggle button
##'
##' .. content for \details{} ..
##' @param ... UI element for the toggle
##' @param sidebar_id id of the created sidebar 
##' @export
ukSidebarToggle <- function(..., sidebar_id) {
  shiny::tags$button(class = "uk-button uk-button default uk-margin-small-right",
                     type = "button",
                     ...,
                     `uk-toggle` = paste0("target: #", sidebar_id))
 
}


##' Button to close the Sidebar
##'
##' @export
ukSidebarClose <- function() {
  shiny::tags$button(class = "uk-offcanvas-close",
                     type = "button",
                     `uk-close` = NA)
}
