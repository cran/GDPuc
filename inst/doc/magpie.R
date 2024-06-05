## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(GDPuc)
if (rlang::is_installed("magclass")) {
  my_gdp <- magclass::new.magpie(
    cells_and_regions = c("USA", "FRA"), 
    years = 2010:2014, 
    names = "gdp",
    sets = c("iso3c", "year", "data"),
    fill = 100:109
  )
  my_gdp
  
  convertGDP(
    gdp = my_gdp, 
    unit_in = "constant 2005 LCU", 
    unit_out = "constant 2017 Int$PPP"
  )
}

