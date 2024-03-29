test_that("basic", {
  dir <- tempfile()
  unlink(dir, recursive = TRUE)
  expect_message(x <- getdata(dir, "dataskills"),
                 paste("Data saved into", dir),
                 fixed = TRUE, all = TRUE)

  f <- paste0(dir, "/5factor.", c("csv", "sav", "txt", "xls", "xlsx"))
  # 5factor files all there
  mapply(expect_equal, object = x[1:5], expected = f)

  # no zip file
  expect_true(!paste0(dir, "dataskills.zip") %in% x)

  unlink(dir, recursive = TRUE)
})
