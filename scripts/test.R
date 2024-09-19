
library(tidyverse)

data <- read_csv("data/marriage_data_raw.csv")


data$number_of_marriage |> min() <= 0
all(is.na(data$number_of_marriage))

test_that("Date column is of Date class", {
  expect_true(all(class(data$Date) == "Date"))
})