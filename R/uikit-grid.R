##' Create a shinyuikit Grid
##' 
##' Build a shinyuikit Grid
##'
##' @param ... The UI elements to place in the card
##' @param divider logical. Divider modifier that separate grid cells with lines.
##' @param gutter character. size of the gutter 'small', 'medium' or 'large', you can use 'collapse' to remove gutter entirely.
##' @param match_height logical.
##' @param child_width character. grid with child elements evenly split without the need to apply to each list item within the grid.
##' you can choose 'half' to have half of their parent container, 'third' take up third of parent container, this apply to 'fourth', 'fifth' or 'sixth'.
##' 'auto' divides the grid into equal units based on content size or 'expand' equal units on available space
##' @export
ukGrid <- function(..., divider = FALSE, gutter = NULL, match_height = FALSE, width = NULL, child_width = NULL, text_center = FALSE) {

  assert_gutter(gutter)
  assert_width(width)
  assert_width(child_width)
  
  cl <- NULL

  if (!is.null(gutter))
    cl <- paste(cl, paste0("uk-grid-", gutter))

  if (!is.null(child_width))
    cl <- paste(cl, uk_child_width(child_width))
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  if (isTRUE(divider))
    cl <- paste(cl, "uk-grid-divider")

  if (isTRUE(match_height))
    cl <- paste(cl, "uk-grid-match")

  if (isTRUE(text_center))
    cl <- paste(cl, "uk-text-center")

  shiny::tags$div(
    class = gsub("^ ", "", cl),
    ...,
    `uk-grid` = NA
  )
}
