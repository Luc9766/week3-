library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/marriage_data_raw.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
  )

write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")