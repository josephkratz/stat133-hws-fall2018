#' @title Vowel counter function
#' @description counts vowels in a string
#' @param x string value (character)
#' @return named vector with number of vowels in a string (vector)

count_vowels <- function(x) {
  if (!is.character(x)) {
    stop("invalid input; string was expected")
  } else {
  x <- tolower(strsplit(x, "")[[1]])
  x <- x[x %in% letters]
  return(table(x)[c("a", "e", "i", "o", "u")])
  }
}