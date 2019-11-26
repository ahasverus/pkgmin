context("Tests for moyenne()")

data(xy)

test_that("check errors - missing argument x", {
  expect_error(moyenne(), "Missing x.")
})

test_that("check inputs", {

  expect_error(moyenne(NA),            "x cannot be NA.")
  expect_error(moyenne(NULL),          "x must be a numeric vector.")

  expect_error(moyenne(xy),            "x must be a numeric vector.")
  expect_error(moyenne(as.list(xy)),   "x must be a numeric vector.")
  expect_error(moyenne(as.matrix(xy)), "x must be a numeric vector.")

  expect_error(moyenne(letters),         "x must be a numeric vector.")
  expect_error(moyenne(letters[1]),      "x must be a numeric vector.")
  expect_error(moyenne(as.factor(xy$x)), "x must be a numeric vector.")

  expect_error(moyenne(1), "x must be length > 1.")

  expect_error(moyenne(xy$x, na_rm = NA),   "na_rm cannot be NA.")
  expect_error(moyenne(xy$x, na_rm = NULL), "na_rm must be TRUE or FALSE.")
  expect_error(moyenne(xy$x, na_rm = 1),    "na_rm must be TRUE or FALSE.")
  expect_error(moyenne(xy$x, na_rm = "1"),  "na_rm must be TRUE or FALSE.")
  expect_error(moyenne(xy$x, na_rm = 1:5),  "na_rm must be TRUE or FALSE.")

  expect_error(moyenne(xy$y),     "x contains NA values. Use na_rm = TRUE.")
  expect_error(moyenne(c(2, NA)), "x contains NA values. Use na_rm = TRUE.")
  expect_error(moyenne(c(2, NA), na_rm = TRUE),  "x has < 2 non-NA values.")
})

test_that("check outputs", {
  expect_equal(moyenne(xy$x), -0.7596629, tolerance = 1e-1)
  expect_equal(moyenne(xy$y, na_rm = TRUE), 5.5, tolerance = 1e-1)

  # expect_vector(moyenne(xy$x))
  # expect_vector(moyenne(xy$y, na_rm = TRUE))

  expect_length(moyenne(xy$x), 1)
  expect_length(moyenne(xy$y, na_rm = TRUE), 1)
})
