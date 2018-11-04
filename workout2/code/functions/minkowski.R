#' @title minkowski distance
#' @description computes the minkowski distance of order p (p-norm distance)
#' @param x numeric vector for one point (numeric)
#' @param y numeric vector for one other point (numeric)
#' @param p numeric value greater than one or character string "max"
#' @return computed minkowski distance

minkowski <- function(x, y, p=1) {
  if (length(x) != length(y)) {
    stop("x and y have different lengths")
  } else if (is.numeric(p)) {
    if (p < 1) {
      stop("p cannot be less than 1")
    }
  } else if (is.character(p)) {
    if (p != "max") {
      stop("invalid character value for p")
    }
  } else {
    abs_xy_vec <- rep(0, length(x))
    for (i in 1:length(x)) {
    abs_xy_vec[i] <- abs(x[i] - y[i])
    summation <- sum(abs_xy_vec)
    if (p == "max") {
      return(max(abs_xy_vec))
    } else {
      return(summation^(1/p))
    }
    }
  }
}