## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(GDPuc)

my_gdp <- tibble::tibble(
  iso3c = "EUR", 
  year = 2010:2014, 
  value = 100:104
)

my_mapping_data_frame <- tibble::tibble(
  iso3c = c("DEU", "FRA", "ESP", "ITA"), 
  region = "EUR"
)

convertGDP(
  gdp = my_gdp, 
  unit_in = "constant 2005 Int$PPP", 
  unit_out = "constant 2017 Int$PPP",
  with_regions = my_mapping_data_frame,
  verbose = TRUE
)

