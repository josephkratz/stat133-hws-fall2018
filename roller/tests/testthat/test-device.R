context("Check device arguments")

test_that("check_sides with ok vectors", {

  expect_true(check_sides(c('h', 't')))
  expect_true(check_sides(c(1, 2, 3, 4, 5)))
})


test_that("check_sides fails with invalid lengths", {

  expect_error(check_sides(c('first_side')))
  expect_error(check_sides(1))
})


test_that("check_sides fails with invalid types", {

  expect_error(check_sides(c('two')),
               "\n'sides' must be a vector of length at least 2")
})


test_that("check_sides fails with duplications", {

  expect_error(check_sides(c('one', 'one')))
  expect_error(check_sides(c(1, 1)),
               "\n'sides' has duplicated elements")
})


test_that("check_prob works with ok vectors", {

  expect_true(check_prob(c(0.5, 0.5)))
  expect_true(check_prob(c(0, 1)))
  expect_true(check_prob(c(1, 0)))
  expect_true(check_prob(c(0.4, 0.6)))
  expect_true(check_prob(c(2/5, 3/5)))
  expect_true(check_prob(c(8/28, 20/28)))
})


test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(1))
})


test_that("check_prob fails with invalid numbers", {

  expect_error(check_prob(0.4444, 0.5555))
  expect_error(check_prob(-0.5, 0.5))
  expect_error(check_prob(0.5, -0.5))
  expect_error(check_prob(0.5, NA))
})
