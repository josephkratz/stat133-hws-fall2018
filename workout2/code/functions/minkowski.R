#' @title minkowski distance
#' @description computes the minkowski distance of order p (p-norm distance)
#' @param x numeric vector for one point (numeric)
#' @param y numeric vector for one other point (numeric)
#' @param p numeric value greater than one or character string "max"
#' @return computed minkowski distance

minkowski <- function(x, y, p=1) {
  if (length(x) != length(y)) {
    stop("x and y have different lengths")
  } else if (is.numeric(p) & p < 1) {
    stop("p cannot be less than 1")
  } else if (is.character(p) & p != "max") {
    stop("invalid character value for p")
  } else if (p == "max") {
    abs_xy_vec <- rep(0, length(x))
    for (i in 1:length(x)) {
      abs_xy_vec[i] <- abs(x[i] - y[i])
    }
    value <- max(abs_xy_vec)
    return(value)
  } else {
    abs_xy_vec <- rep(0, length(x))
    for (i in 1:length(x)) {
      abs_xy_vec[i] <- (abs(x[i] - y[i]))^p
    }
    return(sum(abs_xy_vec)^(1/p))
  }
}