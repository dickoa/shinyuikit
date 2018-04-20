##' Create a shinyuikit Card
##' 
##' Build a UIkit Card for Shiny
##' 
##' @param ... The UI elements to place in the card
##' @param style character. Can be 'default', 'primary' or 'secondary'. 
##' @param size character. Can be 'small' or 'large'.
##' @param hover logical. Create hover effect on the card.
##' @rdname ukCard
##' @export
ukCard <- function(..., style = NULL, size = NULL, hover = FALSE) {

  if (!is.null(style) && !style %in% c("default", "primary", "secondary"))
    stop("size should be on of 'default', 'primary' or 'secondary'", call. = FALSE)

  if (!is.null(size) && !size %in% c("small", "large"))
    stop("size should be one of 'small' or 'large'", call. = FALSE)
  
  cl <- "uk-card"
  
  if (isTRUE(hover))
    cl <- paste(cl, "uk-card-hover")
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-card-", style))
  
  if (isTRUE(size))
    cl <- paste(cl, paste0("uk-card-", size))
  
  shiny::tags$div(
    class = paste(cl, "uk-card-body"),
    ...
  )
}


##' Create a shinyuikit Card Body
##' 
##' Build a UIkit Card Body for Shiny
##' 
##' @param ... The UI elements to place in the card body
##' @param style character. Can be 'default', 'primary' or 'secondary'.
##' @param width character. Can be 'default', 'primary' or 'secondary'.
##' @param height character. Can be 'default', 'primary' or 'secondary'.
##' @rdname ukCard
##' @export
ukCardBody <- function(..., style = NULL, size = NULL, hover = FALSE, width = NULL, height = NULL) {

  if (!is.null(style) && !style %in% c("default", "primary", "secondary"))
    stop("size should be on of 'default', 'primary' or 'secondary'", call. = FALSE)
  
  if (!is.null(size) && !size %in% c("small", "large"))
    stop("size should be one of 'small' or 'large'", call. = FALSE)

  if (!is.null(height) && !height %in% c("small", "max-small", "medium", "max-medium", "large", "max-large"))
    stop("size should be one of 'small', 'max-small', 'medium', 'max-medium', 'large' or  'max-large'", call. = FALSE)
  
  cl <- "uk-card-body"

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

  if (!is.null(height))
    cl <- paste(cl, paste0("uk-height-", height))
  
  if (isTRUE(hover))
    cl <- paste(cl, "uk-card-hover")
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-card-", style))
  
  if (isTRUE(size))
    cl <- paste(cl, paste0("uk-card-", size))

  shiny::tags$div(
    class = cl,
    ...
  )
}


##' Create a shinyuikit Card Media
##' 
##' Build a UIkit Card media for Shiny
##'
##' @param ... The UI elements to place in the card media
##' @param position character. 'top', 'bottom', 'left' or 'right'
##' @rdname ukCard
##' @export
ukCardMedia <- function(..., position = NULL) {
  
  if (!is.null(position) && !position %in% c("top", "bottom", "left", "right"))
    stop("position should be one of 'top', 'bottom', 'left' or 'right'", call. = FALSE)
  
  cl <- "uk-card-media"
  if (!is.null(position))
    cl <- paste(cl, position, sep = "-")
  
  shiny::tags$div(
    class = cl,
    ...
  )
}


##' Create a shinyuikit Card Media
##' 
##' Build a UIkit Card media for Shiny
##'
##' @param ... The UI elements to place in the card footer
##' @rdname ukCard
##' @export
ukCardFooter <- function(...) {
  
  shiny::tags$div(
    class = "uk-card-footer",
    ...
  )
}



##' Create a shinyuikit Card title
##' 
##' Build a UIkit Card title for Shiny
##' 
##' @param title character. The card title
##' @rdname ukCard
##' @export
ukCardTitle <- function(title) {
 
  shiny::tags$h3(
    class = "uk-card-title",
    title
  )
}
