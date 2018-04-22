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

  assert_style(style)
  assert_size(size)
  
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

  assert_style(style)
  assert_size(size)
  assert_width(width)
  assert_height(height)
  
  cl <- "uk-card-body"
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  if (!is.null(height))
    cl <- paste(cl, paste0("uk-height-", height))
  
  if (isTRUE(hover))
    cl <- paste(cl, "uk-card-hover")
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-card-", style))
  
  if (!is.null(size))
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

  assert_position(position)
  
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
