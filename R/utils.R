choices2options <- function(x)
  Reduce(tagList, lapply(seq_along(x), function(i) tags$option(value = x[[i]], names(x)[i])))
