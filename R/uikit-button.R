##'  uikit group button for shiny
##'
##' @param ... UI for the button
##' @param style character. UI element style
##' @param size character. UI element size
##' @param width character. UI element width
ukButton <- function(..., style = "default", size = NULL, width = NULL) {

  assert_style(style, add = c("text", "link"))
  assert_size(size, remove = "expand")
  assert_width(width)
  
  cl <- "uk-button"
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-button-", style))
  
  if (isTRUE(size))
    cl <- paste(cl, paste0("uk-button-", size))
 
  shiny::tags$button(class = cl, ...)
}


##' uikit group button for shiny
##'
##' @param ... UI for the button group
ukButtonGroup <- function(...)
  shiny::tags$div(
    class = "uk-button-group",
    ...
  )
