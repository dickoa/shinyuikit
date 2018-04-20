##' UIkit icons for shiny
##'
##' UIkit icons for shiny
##' 
##' @param name icon name
##' @param modifier link, button or image icon
##' @param ratio numeric size of icon
##' @export
ukIcon <- function(name, modifier = NULL, image_path = NULL, ratio = NULL) {
  
  if (!is.null(modifier) && !modifier %in% c("link", "button", "image"))
    stop("modifier should be on of 'link', 'button' or 'image'", call. = FALSE)
  
  icon_name <- paste0("icon: ", name)
  if (!is.null(ratio))
    icon_name <- paste(icon_name, paste0("ratio: ", ratio), sep = "; ")

  icontag <- tags$span(`uk-icon` = icon_name)
  
  if (!is.null(modifier))
    icontag <- switch(modifier,
           link = tagAppendAttributes(icontag, class = "uk-icon-link"),
           button = tagAppendAttributes(icontag, class = "uk-icon-button"),
           image = {
             if (is.null(image_path)) stop("missing image path")
             tagAppendAttributes(icontag, class = "uk-icon-image", style = sprintf("background-image: url(%s);", image_path))
           })
  
  icontag
}
