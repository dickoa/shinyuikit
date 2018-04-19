##' Create a shinyuikit Card
##' 
##' Build a UIkit Card for Shiny
##' 
##' @param ... 
##' @param style character. Can be 'default', 'primary' or 'secondary'. 
##' @param size character. Can be 'small' or 'large'.
##' @param hover logical. Create hover effect on the card.
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
    class = cl,
    ...
  )
}


##' Create a shinyuikit Card Body
##' 
##' Build a UIkit Card Body for Shiny
##' 
##' @param ... 
##' @param style character. Can be 'default', 'primary' or 'secondary'. 
##' @export
ukCardBody <- function(..., style = NULL) {
  
  if (!is.null(style) && !style %in% c("default", "primary", "secondary"))
    stop("size should be on of 'default', 'primary' or 'secondary'", call. = FALSE)

  cl <- "uk-card-body"
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-card-", style))

  shiny::tags$div(
    class = cl,
    ...
  )
}


##' Create a shinyuikit Card Media
##' 
##' Build a UIkit Card media for Shiny
##'
##' @param ... 
##' @param position 
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
##' @param ... 
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
##' @param ... 
##' @export
ukCardTitle <- function(...) {
  
  shiny::tags$h3(
    class = "uk-card-title",
    ...
  )
}