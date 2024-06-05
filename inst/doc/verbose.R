## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(GDPuc)

my_gdp <- tibble::tibble(
  iso3c = "USA", 
  year = 2010:2014, 
  value = 100:104
)

convertGDP(
  gdp = my_gdp, 
  unit_in = "constant 2005 LCU", 
  unit_out = "constant 2017 Int$PPP",
  verbose = TRUE
)

## -----------------------------------------------------------------------------
options(GDPuc.verbose = TRUE)

convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 LCU",
  unit_out = "constant 2017 Int$PPP"
)

options(GDPuc.verbose = FALSE)

## -----------------------------------------------------------------------------
convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 LCU",
  unit_out = "constant 2017 Int$PPP", 
  return_cfs = TRUE
)

