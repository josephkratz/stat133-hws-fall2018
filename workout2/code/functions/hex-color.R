#' @title Is this a valid hex color (without alpha)? function
#' @description checks whether a value is a valid hex color (without alpha)
#' @param x string value (character)
#' @return boolean (TRUE/FALSE)

is_hex <- function(x) {
  if (!is.character(x)) {
    stop("invalid input; a string was expected")
  } else if (nchar(x) != 6) {
    return(FALSE)
  } else {
    x <- tolower(x)
    if (substr(x, 1, 1) != "#") {
      return(FALSE)
    } else if (str_detect(x, "[0123456789ghijklmnopqrstuvwxyz]")) {
      return(FALSE)
    } else {
      return(TRUE)
    }
  }
}

