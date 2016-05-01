library(tidyr)
library(readxl)
library(dplyr)

fname <- '~/Downloads/nomenklatura_nts_2015.xlsx'
sheets <- excel_sheets(fname)

kody <- lapply(
  sheets[1:6],
  function(x) { 
    d <- read_excel(path = fname,
                    sheet = x,
                    skip = 3,
                    col_names = F) %>%
      fill(X1,X2,X3,X4,X5,X6,X7,X8) %>%
      rename(reg_code = X1,
             reg_name = X2,
             voi_code = X3,
             voi_name = X4,
             podreg_code = X5,
             podreg_name = X6,
             pow_code = X7,
             pow_name = X8,
             gmi_code = X9,
             gmi_name = X10,
             gmi_suppl = X11) %>%
      mutate(year = x) %>%
      filter(!is.na(gmi_code))
    return(d)
    }
) %>%
  bind_rows()

