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
  if (times < 1 | !is.numeric(times)) {
    stop("\nargument 'times' must be >= 1")
  } else if (times %% 1 != 0) {
    stop("\n'times' must be a wholenumber")
  } else {
    TRUE
  }
}

lets_roll <- function(device, results) {
  lst <- list(
    rolls = results,
    device = device,
    sides = device$sides,
    prob = device$prob,
    total = length(results))
  class(lst) <- "roll"
  lst
}

#' @export
print.roll <- function(x, ...) {
  cat('object "roll"\n\n')
  cat("$rolls\n")
  cat(x$rolls, "\n")
  invisible(x)
}

#now onto summary methods...

#' @export
summary.roll <- function(x, ...) {
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
  class(obj) <- "summary.roll"
  obj
}

#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "rolls"\n\n')
  print(x$freqs)
  invisible(x)
}

# additional methods...

#' @export
# finding value through indexing
"[.roll" <- function(x, i) {
  x$rolls[i]
}

#' @export
#replacing a value through indexing
"[<-.roll" <- function(x, i, value) {
  if (!(value %in% x$sides)) {
    stop("\nreplacement value must match a side on the device")
  }
  if (i > length(x$rolls)) {
    stop("\nindex must be within bounds")
  }
  x$rolls[i] <- value
  lets_roll(x$device, x$rolls)
}

#' @export
# adding additional rolls
"+.roll" <- function(x, n) {
  if (n <= 0) {
    stop("\nyou need to add a positive amount of rolls >0")
  }
  add_rolls <- roll(x$device, n)
  lets_roll(device$x, c(x$rolls, add_rolls))
}
