
# shinyuikit

<!-- README.md is generated from README.Rmd. Please edit that file -->

[![GitLab CI Build
Status](https://gitlab.com/dickoa/shinyuikit/badges/master/build.svg)](https://gitlab.com/dickoa/shinyuikit/pipelines)
[![Codecov Code
Coverage](https://codecov.io/gl/dickoa/shinyuikit/branch/master/graph/badge.svg)](https://codecov.io/gl/dickoa/shinyuikit)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[UIkit](https://getuikit.com/) front-end framework for
[Shiny](https://shiny.rstudio.com/).

## Installation

### Gitlab

``` r
# install.packages("devtools")
devtools::install_git("https://gitlab.com/dickoa/shinyuikit")
```

### Github

``` r
# install.packages("devtools")
devtools::install_github("dickoa/shinyuikit")
```

## Example

``` r
library(shiny)
library(shinyuikit)

shinyApp(
  ui = ukPage(
    ukSidebarLayout(
      ukSidebarToggle("Choose Distribution", sidebar_id = "test"),
      ukSidebar(ukRadioInput("dist", "Distribution type:",
                             c("Normal" = "norm",
                               "Uniform" = "unif",
                               "Log-normal" = "lnorm",
                               "Exponential" = "exp"),
                             selected = "norm"),
                title = "Title", sidebar_id = "test")
    ),
    ukContainer(
      ukGrid(
        tags$div(
          ukCardBody(ukCardTitle("Hover"),
                     p("Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
                     plotOutput("hist1"),
                     hover = TRUE)
        ),
        tags$div(
          ukCardBody(ukCardTitle("Default"),
                     p("Lorem ipsum dolor sit amet, consectetur adipisicing elit."),
                     plotOutput("hist2"),
                     style = "default", hover = TRUE)
        ),
        tags$div(
          ukCardBody(ukCardTitle("Primary"),
                     p("Lorem ipsum dolor sit amet, consectetur adipisicing elit."),
                     plotOutput("hist3"),
                     style = "primary", hover = TRUE)
        ),
        tags$div(
          ukCardBody(ukCardTitle("Secondary"),
                   p("Lorem ipsum dolor sit amet, consectetur adipisicing elit."),
                   plotOutput("hist4"),
                   style = "secondary", hover = TRUE)
        ),
        child_width = "half", match_height = TRUE)
    )
  ),
  server = function(input, output) {
    data <- reactive({
      switch(input$dist,
             norm = rnorm,
             unif = runif,
             lnorm = rlnorm,
             exp = rexp,
             rnorm)
    })
    
    output$hist1 <- renderPlot({
      hist(data()(1000), col = "darkgrey")
    })
    
    output$hist2 <- renderPlot({
      hist(data()(1000), col = "steelblue")
    })
    output$hist3 <- renderPlot({
      hist(data()(1000), col = "wheat")
    }, bg = NA)
    output$hist4 <- renderPlot({
      hist(data()(1000), col = "white")
    }, bg = NA)
  }
)
```
