##' Create a shinyuikit Card
##' 
##' Build a UIkit Card for Shiny
##' 
##' @param ... The UI elements to place in the card
##' @param style character. Can be 'default', 'primary' or 'secondary'. 
##' @param size character. Can be 'small' or 'large'.
##' @param hover logical. Create hover effect on the card.
##' @param sortable logical. Allow the card to be sortable.
##'  
##' @examples
##' \dontrun{
##' library(shiny)
##'shinyApp(
##'  ui = ukPage(
##'    ukContainer(
##'      ukCard(
##'        ukCardHeader(ukCardTitle("A nice graph")),
##'        ukCardBody(plotOutput("graph")),
##'        ukCardFooter(ukButton(tags$p("More..."), style = "text", href = "#")),
##'        style = "default")
##'   )
##'  ),
##'  server = function(input, output) {
##'    output$graph <- renderPlot(hist(rnorm(1000)))
##'  })
##'
##'
##' card_line <- function(label)
##'   tags$li(tags$div(class = "uk-card uk-card-default uk-card-body uk-sortable-handle", label))
##' ui <- ukPage(
##'   tags$ul(class = "uk-grid-small uk-child-width-1-3 uk-text-center", `uk-sortable` = "handle: .uk-sortable-handle", `uk-grid` = NA,
##'         card_line("Item1"),
##'         card_line("Item2"),
##'         card_line("Item3"))
##' )
##' server <- function(input, output) {}
##' shinyApp(ui, server)
##' 
##' }
##' 
##' @rdname ukCard
##' @export
ukCard <- function(..., style = NULL, size = NULL, width = NULL, hover = FALSE, margin = NULL, padding = NULL, sortable = FALSE) {

  assert_style(style)
  assert_size(size)
  assert_width(width)
  
  cl <- "uk-card"

  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  if (!is.null(padding))
    cl <- paste(cl, paste0("uk-padding-", padding))

  if (!is.null(margin))
    cl <- paste(cl, gsub("\\-$", "", paste0("uk-margin-", margin)))
  
  if (isTRUE(hover))
    cl <- paste(cl, "uk-card-hover")
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-card-", style))
  
  if (isTRUE(size))
    cl <- paste(cl, paste0("uk-card-", size))
 
  if (isTRUE(sortable))
    cl <- paste(cl, "uk-sortable-handle")
 
  shiny::tags$div(
    class = cl,
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
ukCardBody <- function(..., style = NULL, size = NULL, hover = FALSE, width = NULL, height = NULL, margin = NULL, padding = NULL, sortable = FALSE) {

  assert_style(style)
  assert_size(size)
  assert_width(width)
  assert_height(height)
  
  cl <- "uk-card-body"
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  if (!is.null(padding))
    cl <- paste(cl, paste0("uk-padding-", padding))
  
  if (!is.null(margin))
    cl <- paste(cl, gsub("\\-$", "", paste0("uk-margin-", margin)))
  
  if (!is.null(height))
    cl <- paste(cl, paste0("uk-height-", height))
  
  if (isTRUE(hover))
    cl <- paste(cl, "uk-card-hover")
  
  if (!is.null(style))
    cl <- paste(cl, paste0("uk-card-", style))
  
  if (!is.null(size))
    cl <- paste(cl, paste0("uk-card-", size))

  if (isTRUE(sortable))
    cl <- paste(cl, "uk-sortable-handle")
  
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
ukCardMedia <- function(..., position = "top") {

  assert_position(position)
  
  cl <- "uk-card-media"
  if (!is.null(position))
    cl <- paste(cl, position, sep = "-")
  
  shiny::tags$div(
    class = cl,
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
ukCardTitle <- function(title, margin_position = NULL, margin_size = NULL) {
  
    shiny::tags$h3(
      class = "uk-card-title",
      title
    )
}

##' Create a shinyuikit Card Header
##' 
##' Build a UIkit Card Header
##' 
##' @param ... UI element inside the header
##' @rdname ukCard
##' @export
ukCardHeader <- function(..., width = NULL) {

  assert_width(width)
  
  cl <- "uk-card-header"
  
  if (!is.null(width))
    cl <- paste(cl, uk_width(width))
  
  shiny::tags$div(
    class = cl,
    ...
    )
}



##' Create a shinyuikit Card Footer
##' 
##' Build a UIkit Card Footer
##' 
##' @param ... UI element inside the header
##' @rdname ukCard
##' @export
ukCardFooter <- function(...) {

  shiny::tags$div(
    class = "uk-card-footer",
    ...
  )
}
