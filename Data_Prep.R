library(tidyverse)
df_2011 <- read_csv("~/Downloads/CSV_882021-409/CSV_882021-409.csv")
names(df_2011) <- gsub("[[:digit:]]","",colnames(df_2011))