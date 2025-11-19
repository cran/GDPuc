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
  unit_in = "constant 2010 LCU", 
  unit_out = "constant 2014 Int$PPP",
  source = "wb_wdi_linked",
  verbose = TRUE
)

## -----------------------------------------------------------------------------
print_source_info("wb_wdi")
print_source_info()

## ----eval=FALSE---------------------------------------------------------------
# GDPuc:::wb_wdi

## -----------------------------------------------------------------------------
my_custom_source <- tibble::tibble(
  iso3c = "USA", 
  year = 2010:2014, 
  "GDP deflator" = seq(1, 1.1, 0.025),
  "MER (LCU per US$)" = 1,
  "PPP conversion factor, GDP (LCU per international $)" = 1,
)
print(my_custom_source)

convertGDP(
  gdp = my_gdp, 
  unit_in = "constant 2010 LCU", 
  unit_out = "constant 2014 Int$PPP",
  source = my_custom_source,
  verbose = TRUE
)

## -----------------------------------------------------------------------------
my_gdp <- tibble::tibble(
  iso3c = c("USA", "IND"), 
  value = 100
)

# Normal conversion, with country specific conversion factors
convertGDP(
  gdp = my_gdp, 
  unit_in = "constant 2005 US$MER", 
  unit_out = "constant 2020 US$MER",
  verbose = TRUE
)

# Using the US conversion factors for both countries
convertGDP(
  gdp = my_gdp, 
  unit_in = "constant 2005 US$MER", 
  unit_out = "constant 2020 US$MER",
  use_USA_cf_for_all = TRUE,
  verbose = TRUE
)

