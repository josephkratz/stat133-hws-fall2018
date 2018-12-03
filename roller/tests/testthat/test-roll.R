context("Check roll arguments")

testthat("check_times has correct output", {

  expect_true(check_times(2))
  expect_true(check_times(47))

  expect_error(check_times(0))
  expect_error(check_times(3/8))
  expect_error(ckech_times(45.6))
})
