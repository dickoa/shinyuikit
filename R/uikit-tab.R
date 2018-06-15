##' Tabs for ShinyUIkit
##'
##' @param ... UI content
##' @param tabs tabs 
##' @export
ukTabs <- function(..., tabs = NULL, align = NULL) {
  
  assert_align(align)

  cl <- NULL

  if (!is.null(align))
    cl <- paste0("uk-tab", align)
  
  list <- shiny::tags$ul(class = cl, `uk-tab` = NA)
  
  for (tab in tabs) {
    list <- shiny::tagAppendChild(list, shiny::tags$li(
      shiny::tags$a(
        href = paste0("#", gsub("[[:cntrl:]]|[[:punct:]]|[[:space:]]", "-", tab)),
        tab
      )
    ))
  }
  
  tabs <- shiny::tags$div(
    list,
    shiny::tags$ul(class = "uk-switcher uk-margin",
                   ...
                   )
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("www/js/uikit-tabs-js.js"), package = "shinyuikit")
        )
      )
    ),
    tabs
  )

}


## TO finish
##' Tab for ShinyUIkit
##'
##' @param ... UI content 
##' @param active tabs in active state
##' @param disabled tabs in disabled state 
##' @param href link 
##' @export
ukTab <- function(..., title = NULL) {
  id <- paste0("#", gsub("[[:cntrl:]]|[[:punct:]]|[[:space:]]", "-", title),

  shiny::tags$li(
    shiny::tags$div(
                  ...
                  )
    )
  )
}

## Error with Toggle and Tab
## Due to Javascript, need to input to shiny
## library(shiny)
## library(shinyuikit)


## ui <- ukPage(
##   ukContainer(
##     ukTabs(tags$li("Text content"),
##            tags$li("Hello"),
##            tags$li("Coucou"),
##            tabs = c("First Tab", "Second Tab", "Third Tab"))
##   )
## )


## ui <- ukPage(
##   ukTabs(ukTab("First Tab", title = "a"),
##          ukTab("Second Tab", title = "b"),
##          ukTab("Third Tab", title = "b"),
##          tabs = c("First Tab", "Second Tab", "Third Tab"))
## )

## server <- function(input, output) {}

## shinyApp(ui, server)


## ui <- ukPage(
##   ukContainer(
##     ukTabs(tags$li("Text content"),
##            tags$li(ukCardMedia(plotOutput("hist", height = 50), style = "default", hover = TRUE)),
##            tags$li(plotOutput("plot")),
##            tabs = c("First Tab", "Second Tab", "Third Tab"))
##   )
## )


## server <- function(input, output) {
##   output$hist <- renderPlot({
##     hist(rnorm(n = 150, mean = 10))
##   })

##   output$plot <- renderPlot({
##     plot(dist ~ speed, data = cars, pch = 19, col = "steelblue")
##     abline(lm(dist ~ speed, data = cars))
##     })
## }

## shinyApp(ui, server)
