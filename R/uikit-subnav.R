##' Subnav for ShinyUIkit
##'
##' @param ... UI content
##' @param navs tabs 
##' @export
ukSubnav <- function(..., navs = NULL, divider = FALSE, pill = FALSE) {
  
  cl <- "uk-subnav"

  if (isTRUE(divider))
    cl <- paste(cl, "uk-subnav-divider")

  if (isTRUE(pill))
    cl <- paste(cl, "uk-subnav-pill")
  
  list <- shiny::tags$ul(class = cl, `uk-margin` = NA, `uk-switcher` = NA)
  
  for (nav in navs) {
    list <- shiny::tagAppendChild(list, shiny::tags$li(
      shiny::tags$a(
        href = paste0("#", gsub("[[:cntrl:]]|[[:punct:]]|[[:space:]]", "-", nav)),
        nav
      )
    ))
  }
  
  navs <- shiny::tags$div(
    list,
    shiny::tags$ul(class = "uk-switcher uk-margin",
                   ...
                   )
  )

  ## shiny::tagList(
  ##   shiny::singleton(
  ##     shiny::tags$head(
  ##       shiny::includeScript(
  ##         system.file(file.path("www/js/uikit-tabs-js.js"), package = "shinyuikit")
  ##       )
  ##     )
  ##   ),
  ##   navs
  ## )
  
  navs
}

## Error with Toggle and Tab
## Due to Javascript, need to input to shiny
## library(shiny)
## library(shinyuikit)


## ui <- ukPage(
##   ukContainer(
##     ukSubnav(tags$li("Text content"),
##              tags$li("Hello"),
##              tags$li("Coucou"),
##              navs = c("First Tab", "Second Tab", "Third Tab"),
##              divider = TRUE, pill = TRUE)
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
