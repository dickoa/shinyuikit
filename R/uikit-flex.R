##' UIkit Flexbox layout for shiny
##' 
##'
##' @param ... The UI elements to place in the Flex element
##' @param inline logical.
##' @param horizontal_align logical.
##' @param vertical_align logical.
##' @param wrap character.
##' @param direction character. Define the axis that flex items are placed and their direction, by default items run horizontaly from left to right as does the 'row' option. 
##' @param width character. Define Flex item width 
##' @export
ukFlex <- function(..., inline = FALSE, wrap = NULL, horizontal_align = NULL, vertical_align = NULL, direction = NULL, height = NULL, width = NULL, muted_background = FALSE, dimension = NULL) {

  assert_wrap(wrap)
  assert_direction(direction)
  assert_horizontal_align(horizontal_align)
  assert_vertical_align(vertical_align)
  assert_width(width)
  assert_height(height)
  
  cl <- "uk-flex"

  if (!is.null(horizontal_align))
    cl <- paste(cl, paste0("uk-flex-", horizontal_align))

  if (!is.null(vertical_align))
    cl <- paste(cl, paste0("uk-flex-", vertical_align))

  if (!is.null(direction))
    cl <- paste(cl, paste0("uk-flex-", direction))

  if (!is.null(dimension))
    cl <- paste(cl, paste0("uk-flex-", dimension))
  
  if (!is.null(wrap))
    cl <- paste(cl, uk_wrap(wrap))
 
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))

    if (!is.null(height))
      cl <- paste(cl, uk_width(height))
  
  if (isTRUE(inline))
    cl <- paste(cl, "uk-flex-inline")

  if (isTRUE(muted_background))
    cl <- paste(cl, "uk-background-muted")
  
  shiny::tags$div(
    class = cl,
    ...
    )
}
