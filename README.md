
# shinyuikit

<!-- README.md is generated from README.Rmd. Please edit that file -->

[![GitLab CI Build
Status](https://gitlab.com/dickoa/shinyuikit/badges/master/build.svg)](https://gitlab.com/dickoa/shinyuikit/pipelines)
[![Codecov Code
Coverage](https://codecov.io/gl/dickoa/shinyuikit/branch/master/graph/badge.svg)](https://codecov.io/gl/dickoa/shinyuikit)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[UIkit](https://getuikit.com/) for [Shiny](https://shiny.rstudio.com/).

## Installation

``` r
# install.packages("devtools")
devtools::install_git("https://gitlab.com/dickoa/shinyuikit")
```

## Example

``` r
library(shiny)

shinyApp(
  ui = ukPage(
  ),
  server = function(input, output) { }
)
```
