#Load packages=====
library(tidyverse)
#library(DRDID) #Confirm if this is appropriate estimator for this project
#library(performance) #Use to check model fit, use check_model() function
library(performance)


#Load data====
IPEDS_DATA_2018 <- read_csv("Data/IPEDS_COA/IPEDS_2018/Data_10-12-2021---308.csv")
IPEDS_DATA_2017 <- read_csv("Data/IPEDS_COA/IPEDS_2017/Data_10-12-2021---859.csv")
IPEDS_DATA_2016 <- read_csv("Data/IPEDS_COA/IPEDS_2016/Data_10-12-2021---222.csv")
IPEDS_DATA_2015 <- read_csv("Data/IPEDS_COA/IPEDS_2015/Data_10-12-2021---101.csv")
IPEDS_DATA_2014 <- read_csv("Data/IPEDS_COA/IPEDS_2014/Data_10-12-2021---311.csv")
IPEDS_DATA_2013 <- read_csv("Data/IPEDS_COA/IPEDS_2013/Data_10-12-2021---639.csv")
IPEDS_DATA_2012 <- read_csv("Data/IPEDS_COA/IPEDS_2012/Data_10-12-2021---905.csv")
IPEDS_DATA_2011 <- read_csv("Data/IPEDS_COA/IPEDS_2011/Data_10-12-2021---343.csv")

#Set-up----
#Make dummy for year
IPEDS_DATA_2018 <- IPEDS_DATA_2018%>%
  mutate(Year = 2018)
IPEDS_DATA_2017 <- IPEDS_DATA_2017%>%
  mutate(Year = 2017)
IPEDS_DATA_2016 <- IPEDS_DATA_2016%>%
  mutate(Year = 2016)
IPEDS_DATA_2015 <- IPEDS_DATA_2015%>%
  mutate(Year = 2015)
IPEDS_DATA_2014 <- IPEDS_DATA_2014%>%
  mutate(Year = 2014)
IPEDS_DATA_2013 <- IPEDS_DATA_2013%>%
  mutate(Year = 2013)
IPEDS_DATA_2012 <- IPEDS_DATA_2012%>%
  mutate(Year = 2012)
IPEDS_DATA_2011 <- IPEDS_DATA_2011%>%
  mutate(Year = 2011)

#Clean up column names
colnames(IPEDS_DATA_2018) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2017) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2016) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2015) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2014) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2013) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2012) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')
colnames(IPEDS_DATA_2011) <- c('UnitID', 'Institution_Name', 'Conference', 'State_Abbreviation', 'State_Code', 'Sector', 'Pell_%', 'US_Stu', 'AL_Stu', 'AK_Stu', 'AZ_Stu', 'AR_Stu', 'CA_Stu', 'CO_Stu', 'CT_Stu', 'DE_Stu', 'DC_Stu', 'FL_Stu', 'GA_Stu', 'HI_Stu', 'ID_Stu', 'IL_Stu', 'IN_Stu', 'IA_Stu', 'KS_Stu', 'KT_stu', 'LA_Stu', 'ME_Stu', 'MD_Stu', 'MA_Stu', 'MI_Stu', 'MN_Stu', 'MS_Stu', 'MO_Stu', 'MT_Stu', 'NE_Stu', 'NV_Stu', 'NH_Stu','NJ_Stu', 'NM_Stu', 'NY_Stu', 'NC_Stu', 'ND_Stu', 'OH_Stu', 'OK_Stu', 'OR_Stu', 'PA_Stu', 'RI_Stu', 'SC_Stu', 'SD_Stu', 'TN_Stu', 'TX_Stu', 'UT_Stu', 'VT_Stu', 'VA_Stu', 'WA_Stu', 'WV_Stu', 'WI_Stu', 'WY_Stu', 'UK_Stu', 'On_Campus_Other_Expenses','Off_Campus_No_Family_Other_Expenses', 'On_Campus_W_Family_Other_Expenses', 'On_Campus', 'Off_Campus_No', 'Off_Campus_W', 'Total_Over_25','Null','Year')

#Combine df
IPED_DATA_COMBINED <- rbind(IPEDS_DATA_2011,IPEDS_DATA_2012,IPEDS_DATA_2013,IPEDS_DATA_2014,IPEDS_DATA_2015,IPEDS_DATA_2016,IPEDS_DATA_2017,IPEDS_DATA_2018)

#Categorize data by transforming conference to 1 - Power 5/FBS, 2 - non-Power 5/FBS, 3 - DII
IPED_DATA_COMBINED <- IPED_DATA_COMBINED%>%
  mutate(Division = if_else(Conference %in% c(102,107,108,127,130),1,if_else(Conference %in% c(372,111,119,203,134),2,if_else(Conference %in% c(138,323,140,139,151,367,144,145,371,213,146,147,148,370,153,155,156,157,158,159,160,161,162),3,4))))

#Make dummy for pre/post treatment period







