##' Create a shinyuikit Section
##' 
##' Build a shinyuikit Section
##'
##' @param ... The UI elements to place in the card
##' @param style character. Can be 'default', 'primary' or 'secondary'.
##' @param size character. Can be 'small' or 'large'.
##' @param preserve_color logical. Preserve the original color of the content
##' @param remove_padding logical. Remove padding
##' @examples
##' \dontrun{
##' library(shiny)
##' shinyApp(
##' ui = uikitPage(
##'  ukSection(
##'    ukContainer(
##'      h1("Section", class = "uk-heading-primary"),
##'      p(HTML(paste0("A simple container to divide your page into ", strong("section"), ", like the one you're currently reading"))),
##'      class = "uk-text-center"
##'    ),
##'    style = "muted"
##'  )
##'), 
##'server = function(input, output) {}
##' )
##' }
##' @export
ukSection <- function(..., style = NULL, size = NULL, preserve_color = FALSE, remove_padding = FALSE) {

  if (!is.null(style) && !style %in% c("default", "muted", "primary", "secondary"))
    stop("size should be on of 'default', 'muted', 'primary' or 'secondary'", call. = FALSE)

  if (!is.null(size) && !size %in% c("xsmall", "small", "large", "xlarge"))
    stop("size should be on of 'xsmall', 'small', 'large' or 'xlarge'", call. = FALSE)

  cl <- "uk-section"

  if (!is.null(style))
    cl <- paste(cl, paste0("uk-section-", style))

  if (!is.null(size))
    cl <- paste(cl, paste0("uk-section-", size))
  
  if (isTRUE(preserve_color))
    cl <- paste(cl, "uk-preserve-color")

  if (isTRUE(remove_padding))
    cl <- paste(cl, "uk-padding-remove-vertical")

  shiny::tags$div(
    class = cl,
    ...
  )
}


