##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @param ... 
##' @return 
##' @export
ukSidebarLayout <- function(...) {

  shiny::tags$div(
    class = "uk-offcanvas-content",
    ...
  )
}


##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @param ... 
##' @param sidebar_id 
##' @param title 
##' @export
##' @author Ahmadou H. Dicko
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


##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @param ... 
##' @param sidebar_id 
##' @export
ukSidebarToggle <- function(..., sidebar_id) {
  shiny::tags$button(class = "uk-button uk-button default uk-margin-small-right",
                     type = "button",
                     ...,
                     `uk-toggle` = paste0("target: #", sidebar_id))
  
}
