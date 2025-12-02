---
  title: "Mental Health Data Prize"
author: "Rachael Kilonzo"
date: "2025-09-04"
output:
  html_document: default
pdf_document: default
---
  
  
  
  ```{r}



#-----------------------------------------------------------------------------#
# 1.  Working Directory
#-----------------------------------------------------------------------------#

getwd() # Get the current working directory



# create a vector of the package names
libs <- c("rJava", "tidyverse", "dplyr", "readxl", "listr", "tools", "openxlsx",
          "stringr", "writexl", "psych", "lsr", "meta", "effsize", "esc")


# check if the packages are installed
installed_libs <- libs %in% rownames(
  installed.packages()
)

# install the packages that are not installed
if(any(installed_libs == FALSE)) {
  install.packages(
    libs[!installed_libs]
  )
}

# Load the packages
invisible(lapply(
  libs, 
  library,
  character.only = TRUE
)
)




```


import the combined dataset


```{r}

rm(list = ls())

mhdp <- read_excel("mhdp_data.xlsx", col_type = "text")


mhdp <- mhdp %>%
  mutate(across(c(14:117), as.numeric))


```

