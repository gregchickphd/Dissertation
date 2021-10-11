#Load packages=====
library(tidyverse)
#library(DRDID) #Confirm if this is appropriate estimator for this project
#library(performance) #Use to check model fit, use check_model() function
install.packages("performance")



#Load data====
df_2011 <- read_csv("~/Downloads/CSV_882021-409/CSV_882021-409.csv")
names(df_2011) <- gsub("[[:digit:]]","",colnames(df_2011))





