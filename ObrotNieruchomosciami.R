library(openxlsx)
setwd('~/Documents/Uczelnia/Zbiory/GUS/obrót nieruchomosciami/obrot nieruchomosciami/')
pliczki <- list.files('*.xlsx')

# 2014 --------------------------------------------------------------------

f2014 <- pliczki[grepl('2014|2013',pliczki)]

obrot2013_14_kraj <- lapply(
  f2014,
  read.xlsx,
  sheet = 3,
  startRow = 6,
  colNames = F
)


obrot2013_14_woj <- lapply(
  f2014,
  read.xlsx,
  sheet = 4,
  startRow = 6,
  colNames = F
)

obrot2013_14_pow <- lapply(
  f2014,
  read.xlsx,
  sheet = 5,
  startRow = 6,
  colNames = F
)

names(obrot2013_14_kraj) <- 
  names(obrot2013_14_woj) <- 
  names(obrot2013_14_pow) <- f2014

# ealier --------------------------------------------------------------------

obrot2012i <- read.xlsx(xlsxFile = 'T1_2012_I_pol.xlsx',
                       start = 7,
                       sheet = 'Polska',
                       colNames = F)

obrot2012ii <- read.xlsx(xlsxFile = 'T1_2012_II_pol.xlsx',
                       start = 7,
                       sheet = 'Polska',
                       colNames = F)

obrot2012iwoj <- read.xlsx(xlsxFile = 'T1_2012_I_pol.xlsx',
                        start = 6,
                        sheet = 'województwa',
                        colNames = F)

obrot2012iiwoj <- read.xlsx(xlsxFile = 'T1_2012_II_pol.xlsx',
                         start = 6,
                         sheet = 'województwa',
                         colNames = F)




# save all ----------------------------------------------------------------


obrot <-
  list(
    obrot2012kraj = list(
      'T1_2012_I_pol.xlsx' = obrot2012i,
      'T1_2012_II_pol.xlsx' = obrot2012ii
    ),
    obrot2012woj = list(
      'T1_2012_I_pol.xlsx' = obrot2012iwoj,
      'T1_2012_II_pol.xlsx' = obrot2012iiwoj
    ),
    obrot2013_14_kraj,
    obrot2013_14_woj,
    obrot2013_14_pow
  )

save(obrot,file='obrot.rda')
