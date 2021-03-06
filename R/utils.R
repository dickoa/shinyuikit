##' Helper function to turn stack select option
##'
##' @param x the choices vector
choices2options <- function(x)
  Reduce(shiny::tagList, lapply(seq_along(x), function(i) shiny::tags$option(value = x[[i]], names(x)[i])))


assert_width <- function(width = NULL) {
  x <- c("one", "half", "third", "two-thirds", "fourth",
        "three-fourths", "fifth", "two-fifths", "three-fifths",
        "four-fifths", "sixth", "five-sixths", "auto", "expand",
        "small", "medium", "large", "xlarge", "xxlarge", "xsmall")
  
  if (!is.null(width) && !width %in% x)
    stop("width should be one of 'one', 'half', 'third', 'two-thirds', 'fourth', 'three-fourths', 'fifth', 'two-fifths', 'three-fifths', 'four-fifths', 'sixth', 'five-sixths', 'auto', 'expand', 'small', 'medium', 'large', 'xlarge' or 'xxlarge'", call. = FALSE)
}

assert_gutter <- function(gutter = NULL) {
  x <- c("small", "medium", "large", "collapse")
  if (!is.null(gutter) && !gutter %in% x)
    stop("gutter should be one of 'small', 'medium', 'large' or 'collapse'", call. = FALSE)
}

assert_child_width <- function(width) {
  x <- c("half", "third", "fourth", "fifth", "sixth", "auto", "expand")
  if (!is.null(width) && !width %in% x)
    stop("child_width should be one of 'half', 'third', 'fourth', 'fifth', 'sixth', 'auto' or 'expand'", call. = FALSE)
}

assert_style <- function(style, add = NULL, remove = NULL) {
  if (!is.null(add) & !is.null(remove))
    stop("you can either add or remove element not both!")
  
  x <- c("default", "primary", "secondary")
  
  if (!is.null(add))
    x <- union(x, add)
  
  if (!is.null(remove))
    x <- setdiff(x, remove)
  
  if (!is.null(style) && !style %in% x)
    stop("style should be one of 'default', 'primary' or 'secondary'", call. = FALSE)
}

assert_size <- function(size, add = NULL, remove = NULL) {
  if (!is.null(add) & !is.null(remove))
    stop("you can either add or remove element not both!")

  x <- c("small", "large", "expand")
  
  if (!is.null(add))
    x <- union(, add)
  
  if (!is.null(remove))
    x <- setdiff(x, remove)
  
  if (!is.null(size) && !size %in% x)
    stop("size should be one of 'small', 'large' or 'expand'", call. = FALSE)
}

assert_height <- function(height) {
  x <- c("small", "max-small", "medium", "max-medium", "large", "max-large")
  if (!is.null(height) && !height %in% x)
    stop("size should be one of 'small', 'max-small', 'medium', 'max-medium', 'large' or  'max-large'", call. = FALSE)
}

assert_position <- function(position) {
  if (!is.null(position) && !position %in% c("top", "bottom", "left", "right"))
    stop("position should be one of 'top', 'bottom', 'left' or 'right'", call. = FALSE)
}

assert_wrap <- function(wrap) {
  if (!is.null(wrap) && !wrap %in% c("default", "stretch", "between",
                                     "around", "top", "middle",
                                     "bottom", "reverse", "nowrap"))
    stop("wrap should be on of 'default', 'stretch', 'between', 'around', 'top', 'middle', 'bottom','reverse' or 'nowrap'", call. = FALSE)
}

assert_direction <- function(direction) {
  x <- c("row", "row-reverse", "column", "column-reverse")
  if (!is.null(direction) && !direction %in% x)
    stop("direction should be one of 'row', 'row-inverse', 'column' or 'column-reverse'", call. = FALSE)
}

assert_align <- function(align) {
  if (!is.null(align) && !align %in% c("left", "right"))
    stop("align should be either 'left' or 'right'", call. = FALSE)
}


assert_horizontal_align <- function(horizontal_align) {
  if (!is.null(horizontal_align) && !horizontal_align %in% c("left", "center", "right", "between", "around"))
    stop("horizontal_align should be one of 'left', 'center', 'right', 'between' or 'around'", call. = FALSE)
}

assert_vertical_align <- function(vertical_align) {
  if (!is.null(vertical_align) && !vertical_align %in% c("stretch", "top", "middle", "bottom"))
    stop("vertical_align should be on of 'stretch', 'top', 'middle' or 'bottom'", call. = FALSE)
}

assert_padding <- function(padding) {
  if (!is.null(padding) && !padding %in% c("default", "stretch", "between",
                                     "around", "top", "middle",
                                     "bottom", "reverse", "nopadding"))
    stop("padding should be on of 'default', 'stretch', 'between', 'around', 'top', 'middle', 'bottom','reverse' or 'remove'", call. = FALSE)
}

uk_child_width <- function(width)
  switch(width,
         half = "uk-child-width-1-2",
         third = "uk-child-width-1-3",
         fourth = "uk-child-width-1-4",
         fifth = "uk-child-width-1-5",
         sixth = "uk-child-width-1-6",
         auto = "uk-child-width-auto",
         expand = "uk-child-width-expand")

uk_width <- function(width)
  switch(width,
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
         `five-sixths` = "uk-width-5-6",
         small = "uk-width-small",
         small = "uk-width-xsmall",
         medium = "uk-width-medium",
         large = "uk-width-large",
         xlarge = "uk-width-xlarge",
         xxlarge = "uk-width-xxlarge",
         auto = "uk-width-auto",
         expand = "uk-width-expand")


uk_wrap <- function(wrap)
  switch(
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
  )
  