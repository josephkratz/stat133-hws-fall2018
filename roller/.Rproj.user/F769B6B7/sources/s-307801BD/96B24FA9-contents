#' @title Plot of object rolls
#' @description Plots the relative frequencies of a series of rolls
#' @param x an object of class \code{"device"}
#' @param \dots arguments to be passed to/from other methods
#' @export
#' @examples
#'
#'  # create a device and roll it 40 times
#'  device1 <- device()
#'  roll40 <- roll(device1, times = 40)
#'  
#'  plot(roll40)
#'

# plotting method

plot.roll <- function(x, ...) {
  props <- rep(0, length(x$sides))
  for (i in 1:length(props)) {
    props[i] <- sum(x$rolls == x$sides[i]) / x$total
  }
  barplot(props, 
          main = sprintf(("Relative Frequencies in a series of %s rolls"), x$total),
          xlab = "sides of device", ylab = "relative frequencies", 
          names.arg = x$sides)
}