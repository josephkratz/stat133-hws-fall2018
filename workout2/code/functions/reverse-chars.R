#' @title Reverse characters function function
#' @description reverses characters in a string
#' @param x string value (character)
#' @return string value with characters reversed (character)

reverse_chars <- function(x) {
  split <- strsplit(x, NULL)[[1]]
  reversed <- rev(split)
  return(paste(reversed, collapse = ''))
}
