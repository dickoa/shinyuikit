##' Create a shinyuikit Flex
##' 
##' Build a shinyuikit Flex
##'
##' @param ... The UI elements to place in the Flex element
##' @param inline logical.
##' @param horizontal_align logical.
##' @param vertical_align logical.
##' @param wrap character.
##' @param direction character. Define the axis that flex items are placed and their direction, by default items run horizontaly from left to right as does the 'row' option. 
##' @param width character. Define Flex item width 
##' @export
ukFlex <- function(..., inline = FALSE, wrap = NULL, horizontal_align = NULL, vertical_align = NULL, direction = NULL, width = NULL) {

  assert_wrap(wrap)
  assert_direction(direction)
  assert_horizontal_align(horizontal_align)
  assert_vertical_align(vertical_align)
  assert_width(width)
  
  cl <- "uk-flex"

  if (!is.null(horizontal_align))
    cl <- paste(cl, paste0("uk-flex-", horizontal_align))

  if (!is.null(vertical_align))
    cl <- paste(cl, paste0("uk-flex-", vertical_align))
  
  if (!is.null(wrap))
    cl <- paste(cl, uk_wrap(wrap))
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
 
  if (isTRUE(inline))
    cl <- paste(cl, "uk-flex-inline")
  
  shiny::tags$div(
    class = cl,
    ...,
    )
}
