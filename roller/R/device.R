#' @title Device
#' @description Creates an object of class \code{"device"}
#' @param sides vector of device sides
#' @param prob vector of side probabilities
#' @return an object of class \code{"device"}
#' @export
#' @examples
#' # default 
#' device1 <- device()
#' 
#' # another device
#' coin <- device(c('heads', 'tails'))
#' 
#' # loaded coin
#' loaded <- device(prob = c(0.7, 0.3))
#' 

device <- function(sides = c(1, 2), prob = c(0.5, 0.5)) {
  check_sides(sides)
  check_prob(prob)
  
  object <- list(
    sides = sides,
    prob = prob)
  class(object) <- "device"
  object
}
check_sides <- function(sides) {
  if (length(sides) < 2) {
    stop("\n'sides' must be a vector of length at least 2")
  } 
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  if (any(duplicated(sides))) {
    stop("\n'sides' has duplicated elements")
  }
  TRUE
}
check_prob <- function(prob) {
  if (length(prob) < 2 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length at least 2")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}