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

  if (!is.null(wrap) && !wrap %in% c("default", "stretch", "between",
                                     "around", "top", "middle",
                                     "bottom", "reverse", "nowrap"))
    stop("wrap should be on of 'default', 'stretch', 'between', 'around', 'top', 'middle', 'bottom','reverse' or 'nowrap'", call. = FALSE)
  
  if (!is.null(direction) && !direction %in% c("row", "row-reverse", "column", "column-reverse"))
    stop("direction should be on of 'row', 'row-inverse', 'column' or 'column-reverse'", call. = FALSE)

  if (!is.null(horizontal_align) && !horizontal_align %in% c("left", "center", "right", "between", "around"))
    stop("horizontal_align should be on of 'left', 'center', 'right', 'between' or 'around'", call. = FALSE)

  if (!is.null(vertical_align) && !vertical_align %in% c("stretch", "top", "middle", "bottom"))
    stop("vertical_align should be on of 'stretch', 'top', 'middle' or 'bottom'", call. = FALSE)
  
  if (!is.null(width) && !width %in% c("one", "half", "third", "two-thirds",
                                       "fourth", "three-fourths", "fifth",
                                       "two-fifths", "three-fifths", "four-fifths", 
                                       "sixth", "five-sixths", "auto", "expand",
                                       "small", "medium", "large",
                                       "xlarge", "xxlarge"))
    stop("width should be one of 'one', 'half', 'third', 'two-thirds', 'fourth', 'three-fourths', 'fifth', 'two-fifths', 'three-fifths', 'four-fifths', 'sixth', 'five-sixths', 'auto', 'expand', 'small', 'medium', 'large', 'xlarge' or 'xxlarge'", call. = FALSE)
  
  cl <- "uk-flex"

  if (!is.null(horizontal_align))
    cl <- paste(cl, paste0("uk-flex-", horizontal_align))

  if (!is.null(vertical_align))
    cl <- paste(cl, paste0("uk-flex-", vertical_align))
  
  if (!is.null(wrap))
    cl <- paste(cl, switch(
      wrap,
      default = "uk-flex-wrap",
      stretch = "uk-flex-wrap uk-flex-wrap-stretch",
      between = "uk-flex-wrap uk-flex-wrap-between",
      around = "uk-flex-wrap uk-flex-wrap-around",
      top = "uk-flex-wrap uk-flex-wrap-top",
      middle = "uk-flex-wrap uk-flex-wrap-middle",
      bottom = "uk-flex-wrap uk-flex-wrap-bottom",
      reverse = "uk-flex-wrap-reverse",
      nowrap = "uk-flex-nowrap"
    ))
  
  if (!is.null(width))
    cl <- paste(cl, switch(
      width,
      one = "uk-width-1-1",
      half = "uk-width-1-2",
      third = "uk-width-1-3",
      `two-thirds` = "uk-width-2-3",
      fourth = "uk-width-1-4",
      `three-fourths` = "uk-width-3-4",
      fifth = "uk-width-1-5",
      `two-fifths` = "uk-width-2-5",
      `three-fifths` = "uk-width-3-5",
      `four-fifths` = "uk-width-4-5",
      sixth = "uk-width-1-6",
      `fith-sixths` = "uk-width-5-6",
      small = "uk-width-small",
      medium = "uk-width-medium",
      large = "uk-width-large",
      xlarge = "uk-width-xlarge",
      xxlarge = "uk-width-xxlarge",
      auto = "uk-width-auto",
      expand = "uk-width-expand"
    ))
 
  if (isTRUE(inline))
    cl <- paste(cl, "uk-flex-inline")
  
  shiny::tags$div(
    class = gsub("^ ", "", cl),
    ...,
    )
}
