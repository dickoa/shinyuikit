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

  if (!is.null(gutter) && !gutter %in% c("small", "medium", "large", "collapse"))
    stop("gutter should be on of 'small', 'medium', 'large' or 'collapse'", call. = FALSE)

  if (!is.null(width) && !width %in% c("one", "half", "third", "two-thirds",
                                       "fourth", "three-fourths", "fifth",
                                       "two-fifths", "three-fifths", "four-fifths", 
                                       "sixth", "five-sixths", "auto", "expand",
                                       "small", "medium", "large",
                                       "xlarge", "xxlarge"))
    stop("width should be one of 'one', 'half', 'third', 'two-thirds', 'fourth', 'three-fourths', 'fifth', 'two-fifths', 'three-fifths', 'four-fifths', 'sixth', 'five-sixths', 'auto', 'expand', 'small', 'medium', 'large', 'xlarge' or 'xxlarge'", call. = FALSE)
  
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


## shinyApp(
##   ui = ukPage(
##     ukContainer(
##       ukGrid(
##         div(
##           ukCardBody(ukCardTitle("Hover"),
##                      p("Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
##                      plotOutput("hist1"),
##                      hover = TRUE)
##         ),
##         div(
##         ukCardBody(ukCardTitle("Default"),
##                    p("Lorem ipsum dolor sit amet, consectetur adipisicing elit."),
##                    plotOutput("hist2"),
##                    style = "default", hover = TRUE)
##         ),
##         div(
##           ukCardBody(ukCardTitle("Primary"),
##                      p("Lorem ipsum dolor sit amet, consectetur adipisicing elit."),
##                      plotOutput("hist3"),
##                      style = "primary", hover = TRUE)
##         ),
##         div(
##           ukCardBody(ukCardTitle("Secondary"),
##                    p("Lorem ipsum dolor sit amet, consectetur adipisicing elit."),
##                    plotOutput("hist4"),
##                    style = "secondary", hover = TRUE, width = "expand")
##       ),
##       child_width = "half", match_height = TRUE)
##     )
##   ),
##   server = function(input, output) {
##     output$hist1 <- renderPlot({hist(rnorm(1000), col = "darkgrey")})
##     output$hist2 <- renderPlot({hist(rnorm(1000), col = "steelblue")})
##     output$hist3 <- renderPlot({hist(rnorm(1000), col = "wheat")}, bg = NA)
##     output$hist4 <- renderPlot({hist(rnorm(1000), col = "white")}, bg = NA)
##   }
## )
