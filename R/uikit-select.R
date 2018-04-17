##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param inputId 
##' @param label 
##' @param choices 
##' @return 
##' @author Ahmadou H. Dicko
ukSelectInput <- function(inputId, label, choices = NULL) {
  
  select <- shiny::tags$select(
    class = "uk-select shinyUIkitSelect",
    id = inputId
  )

  
  if (length(names(choices))) {
    choices <- list(name = names(choices), value = unname(choices))
  } else {
    choices <- list(name = choices, value = choices)
  }


  for (i in seq_along(choices[[1]])) {
    select <- shiny::tagAppendChild(select,
                                   shiny::tags$option(
                                     choices$name[i],
                                     value = choices$value[i]))
  }

  select <- shiny::tags$form(
    shiny::tags$fieldset(
      class = "uk-fieldset",
      shiny::tags$legend(
        class = "uk-legend",
        label
      ),
      select
    )
  )
        
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file("www/js/uikit-select-js.js", package = "shinyuikit")
        )
      )
    ),
    select
  )
}
