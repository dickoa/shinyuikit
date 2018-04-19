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
ukGrid <- function(..., divider = FALSE, gutter = NULL, match_height = FALSE, child_width = NULL) {

  if (!is.null(gutter) && !gutter %in% c("small", "medium", "large", "collapse"))
    stop("gutter should be on of 'small', 'medium', 'large' or 'collapse'", call. = FALSE)

  if (!is.null(child_width) && !child_width %in% c("half", "third", "fourth", "fifth", "sixth", "auto", "expand"))
    stop("child_width should be one of 'half', 'third', 'fourth', 'fifth', 'sixth', 'auto' or 'expand'", call. = FALSE)

  cl <- NULL

  if (!is.null(gutter))
    cl <- paste(cl, paste0("uk-grid-", gutter))
  
  if (!is.null(child_width))
    cl <- paste(cl, switch(
      child_width,
      half = "uk-child-width-1-2",
      third = "uk-child-width-1-3",
      fourth = "uk-child-width-1-4",
      fifth = "uk-child-width-1-5",
      sixth = "uk-child-width-1-6",
      auto = "uk-child-width-auto",
      expand = "uk-child-width-expand"
    ))
  
  if (isTRUE(divider))
    cl <- paste(cl, "uk-grid-divider")

  if (isTRUE(match_height))
    cl <- paste(cl, "uk-grid-match")
    
  shiny::tags$div(
    class = gsub("^ ", "", cl),
    ...,
    `uk-grid` = NA
  )
}
