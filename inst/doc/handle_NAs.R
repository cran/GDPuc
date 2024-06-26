## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(GDPuc)

# Test with Venezuela -> iso3c = VEN
my_gdp <- tibble::tibble(
  iso3c = c("VEN"),
  year = 2010:2014,
  value = 100:104
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  return_cfs = TRUE
)
x$result

x$cfs

## -----------------------------------------------------------------------------
x <- convertGDP(
  gdp = my_gdp, 
  unit_in = "constant 2005 Int$PPP", 
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = NA
)

## -----------------------------------------------------------------------------
my_gdp <- tibble::tibble(
  iso3c = "VEN",
  year = 2010:2014,
  value = 100:104
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = 0,
  return_cfs = TRUE
)
x$result

x$cfs

## -----------------------------------------------------------------------------
my_gdp <- tibble::tibble(
  iso3c = "VEN",
  year = 2010:2014,
  value = 100:104
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = "no_conversion",
  return_cfs = TRUE
)
x$result

x$cfs

## -----------------------------------------------------------------------------
my_gdp <- tibble::tibble(
  iso3c = "VEN",
  year = 2010:2014,
  value = 100:104
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = "linear",
  return_cfs = TRUE
)
x$result

x$cfs

## -----------------------------------------------------------------------------
my_gdp <- tibble::tibble(
  iso3c = "VEN",
  year = 2010:2014,
  value = 100:104
)

my_mapping_data_frame <- tibble::tibble(
  iso3c = c("VEN", "BRA", "ARG", "COL"),
  region = "LAM"
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = "regional_average",
  with_regions = my_mapping_data_frame,
  return_cfs = TRUE
)
x$result

x$cfs

# Compare the 2019 PPP with the 2005 PPP. They are not in the same order of magnitude. 
# Obviously, being a part of the same region, does not mean the currencies are of the same strength.

## -----------------------------------------------------------------------------
# Create an imaginary country XXX, and add it to the Latin America region
my_gdp <- tibble::tibble(
  iso3c = c("VEN", "XXX"),
  year = 2010,
  value = 100
)

my_mapping_data_frame <- tibble::tibble(
  iso3c = c("VEN", "BRA", "ARG", "COL", "XXX"),
  region = "LAM"
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = c("linear", 0),
  with_regions = my_mapping_data_frame,
  return_cfs = TRUE
)
x$result

x$cfs

## -----------------------------------------------------------------------------
my_gdp <- tibble::tibble(
  iso3c = "VEN",
  year = 2010:2014,
  value = 100:104
)

x <- convertGDP(
  gdp = my_gdp,
  unit_in = "constant 2005 Int$PPP",
  unit_out = "constant 2019 Int$PPP",
  replace_NAs = 1,
  return_cfs = TRUE
)
x$result

x$cfs

# Why is the deflator above not 1? That is because for VEN, only the deflator value in 2019 was set to 1. 
# In 2005 the deflator was in the order of magnitude of 100. Obviously setting the deflator to 1 in 2019 is 
# completely misleading.

