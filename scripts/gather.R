library(opendatatoronto)
library(tidyverse)


# get package
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
package

# get all resources for this package
resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))



resource <- package$resources %>% filter(name == "Marriage Licence Statistics") %>% pull(id)
marriage_data <- get_resource(resource)
write.csv(marriage_data, "data/marriage_data_raw.csv")
