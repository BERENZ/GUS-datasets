library(openxlsx)
setwd('~/Documents/Uczelnia/Zbiory/GUS/obrót nieruchomosciami/obrot nieruchomosciami/')
pliczki <- list.files()

# 2014 --------------------------------------------------------------------

f2014 <- pliczki[grepl('2014',pliczki)]

obrot2014kraj <- lapply(
  f2014,
  read.xlsx,
  sheet = 3,
  startRow = 6,
  colNames = F
)

obrot2014woj <- lapply(
  f2014,
  read.xlsx,
  sheet = 4,
  startRow = 6,
  colNames = F
)

obrot2014pow <- lapply(
  f2014,
  read.xlsx,
  sheet = 5,
  startRow = 6,
  colNames = F
)

# 2013 --------------------------------------------------------------------



