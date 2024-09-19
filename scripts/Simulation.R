library(tidyverse)
set.seed(304)
start_date <- as.Date("2018-01-01")
end_date <- as.Date("2023-12-31")
number_of_dates <- 100

data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    number_of_marriage = rpois(n = number_of_dates, lambda = 10)
  )


write_csv(data, file = "data/raw_data/simulated.csv")