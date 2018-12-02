#' @title Roll a device
#' @description Creates an object of class \code{"device"}
#' @param device object of class \code{"device"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of device \code{"sides"}}
#' @return \item{prob}{vector of device \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export
#' @examples
#' dev1 <- device()
#' 
#' # roll a device 10 times
#' roll_10 <- roll(dev1, times = 10)
#' 
roll <- function(device, times = 1) {
  if (!is.device(device)) {
    stop("\nojbect must be of device class")
  }
  check_times(times)
  results <- sample(device$sides, times, replace=TRUE, device$prob)
  lets_roll(device, results)
}

check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}

lets_roll <- function(device, results) {
  lst <- list(
    rolls = results,
    sides = device$sides,
    prob = device$prob,
    total = length(results))
  class(lst) <- "rolls"
  lst
}

print.roll <- function(x, ...) {
  cat('object "rolls"\n\n')
  cat("$rolls\n")
  cat(x$rolls, "\n")
  invisible(x)
}

#now onto summary methods...

summary.rolls <- function(x, ...) {
  props <- rep(0, length(x$sides))
  for (i in 1:length(props)) {
    props[i] <- sum(x$rolls == x$sides[i]) / x$total
  }
  counts <- rep(0, length(x$sides))
  for (i in 1:length(counts)) {
    counts[i] <- sum(x$rolls == x$sides[i])
  }
  
  dframe <- data.frame(
    side = x$sides,
    count = counts,
    prop = props)
  obj <- list(freqs=dframe)
  class(obj) <- "summary.rolls"
  obj
}

print.summary.rolls <- function(x, ...) {
  cat('summary "rolls"\n\n')
  print(x$freqs)
  invisible(x)
}


