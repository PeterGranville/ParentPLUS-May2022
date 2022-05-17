library(dplyr)
library(ggplot2)
library(reshape2)
library(data.table)

#################################################################
###                                                           ###
###             Section 1: FSA data on Parent PLUS            ###
###                                                           ###
#################################################################

#################################################################
### First we load the data containing Parent PLUS             ###
### disbursements by year.                                    ###
#################################################################

plus9900 <- fread("DL_AwardYr_Summary_AY1999_2000_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0001 <- fread("DL_AwardYr_Summary_AY2000_2001_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0102 <- fread("DL_AwardYr_Summary_AY2001_2002_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0203 <- fread("DL_AwardYr_Summary_AY2002_2003_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0304 <- fread("DL_AwardYr_Summary_AY2003_2004_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0405 <- fread("DL_AwardYr_Summary_AY2004_2005_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0506 <- fread("DL_AwardYr_Summary_AY2005_2006_All.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0607 <- fread("DL_Dashboard_AY2006_2007_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0708 <- fread("DL_Dashboard_AY2007_2008_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0809 <- fread("DL_Dashboard_AY2008_2009_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus0910 <- fread("DL_Dashboard_AY2009_2010_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1011 <- fread("DL_Dashboard_AY2010_2011_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1112 <- fread("DL_Dashboard_AY2011_2012_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1213 <- fread("DL_Dashboard_AY2012_2013_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1314 <- fread("DL_Dashboard_AY2013_2014_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1415 <- fread("DL_Dashboard_AY2014_2015_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1516 <- fread("DL_Dashboard_AY2015_2016_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1617 <- fread("DL_Dashboard_AY2016_2017_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1718 <- fread("DL_Dashboard_AY2017_2018_Q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1819 <- fread("dl-dashboard-ay2018-2019-q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus1920 <- fread("dl-dashboard-ay2019-2020-q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
plus2021 <- fread("dl-dashboard-ay2020-2021-q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

#################################################################
### Next we need to merge with some FFEL data from 1999       ###
### to 2010. First we load the data.                          ###
#################################################################

ffel9900 <- fread("FFEL_AwardYr_Summary_AY1999_2000_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0001 <- fread("FFEL_AwardYr_Summary_AY2000_2001_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0102 <- fread("FFEL_AwardYr_Summary_AY2001_2002_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0203 <- fread("FFEL_AwardYr_Summary_AY2002_2003_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0304 <- fread("FFEL_AwardYr_Summary_AY2003_2004_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0405 <- fread("FFEL_AwardYr_Summary_AY2004_2005_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0506 <- fread("FFEL_AwardYr_Summary_AY2005_2006_All.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0607 <- fread("FL_Dashboard_AY2006_2007_Q4.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0708 <- fread("FL_Dashboard_AY2007_2008_Q4.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0809 <- fread("FL_Dashboard_AY2008_2009_Q4.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
ffel0910 <- fread("FL_Dashboard_AY2009_2010_Q4.csv", header=TRUE) %>% select(`OPE ID`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

#################################################################
### Next we add "DL" to the initial datasets to specify that  ###
### they are from the Direct Loan sets.                       ###
#################################################################

names(plus9900) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0001) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0102) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0203) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0304) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0405) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0506) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0607) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0708) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0809) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")
names(plus0910) <- c("OPE ID", "School", "State", "Zip Code", "School Type", "DL Recipients", "DL # of Loans Originated", "DL $ of Loans Originated", "DL # of Disbursements", "DL $ of Disbursements")

#################################################################
### Now we add "FFEL" to the new datasets to specify that     ###
### they are from the FFEL datasets.                          ###
#################################################################

names(ffel9900) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0001) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0102) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0203) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0304) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0405) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0506) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0607) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0708) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0809) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")
names(ffel0910) <- c("OPE ID", "FFEL Recipients", "FFEL # of Loans Originated", "FFEL $ of Loans Originated", "FFEL # of Disbursements", "FFEL $ of Disbursements")

#################################################################
### Now we merge these datasets together.                     ###
#################################################################

plus9900 <- full_join(x=plus9900, y=ffel9900, by="OPE ID")
plus0001 <- full_join(x=plus0001, y=ffel0001, by="OPE ID")
plus0102 <- full_join(x=plus0102, y=ffel0102, by="OPE ID")
plus0203 <- full_join(x=plus0203, y=ffel0203, by="OPE ID")
plus0304 <- full_join(x=plus0304, y=ffel0304, by="OPE ID")
plus0405 <- full_join(x=plus0405, y=ffel0405, by="OPE ID")
plus0506 <- full_join(x=plus0506, y=ffel0506, by="OPE ID")
plus0607 <- full_join(x=plus0607, y=ffel0607, by="OPE ID")
plus0708 <- full_join(x=plus0708, y=ffel0708, by="OPE ID")
plus0809 <- full_join(x=plus0809, y=ffel0809, by="OPE ID")
plus0910 <- full_join(x=plus0910, y=ffel0910, by="OPE ID")

#################################################################
### Now we need to make sure that all the relevant variables  ###
### have no NA values.                                        ###
#################################################################

plus9900$`DL Recipients`[is.na(plus9900$`DL Recipients`)] <- 0
plus9900$`DL # of Loans Originated`[is.na(plus9900$`DL # of Loans Originated`)] <- 0
plus9900$`DL $ of Loans Originated`[is.na(plus9900$`DL $ of Loans Originated`)] <- 0
plus9900$`DL # of Disbursements`[is.na(plus9900$`DL # of Disbursements`)] <- 0
plus9900$`DL $ of Disbursements`[is.na(plus9900$`DL $ of Disbursements`)] <- 0
plus9900$`FFEL Recipients`[is.na(plus9900$`FFEL Recipients`)] <- 0
plus9900$`FFEL # of Loans Originated`[is.na(plus9900$`FFEL # of Loans Originated`)] <- 0
plus9900$`FFEL $ of Loans Originated`[is.na(plus9900$`FFEL $ of Loans Originated`)] <- 0
plus9900$`FFEL # of Disbursements`[is.na(plus9900$`FFEL # of Disbursements`)] <- 0
plus9900$`FFEL $ of Disbursements`[is.na(plus9900$`FFEL $ of Disbursements`)] <- 0

plus0001$`DL Recipients`[is.na(plus0001$`DL Recipients`)] <- 0
plus0001$`DL # of Loans Originated`[is.na(plus0001$`DL # of Loans Originated`)] <- 0
plus0001$`DL $ of Loans Originated`[is.na(plus0001$`DL $ of Loans Originated`)] <- 0
plus0001$`DL # of Disbursements`[is.na(plus0001$`DL # of Disbursements`)] <- 0
plus0001$`DL $ of Disbursements`[is.na(plus0001$`DL $ of Disbursements`)] <- 0
plus0001$`FFEL Recipients`[is.na(plus0001$`FFEL Recipients`)] <- 0
plus0001$`FFEL # of Loans Originated`[is.na(plus0001$`FFEL # of Loans Originated`)] <- 0
plus0001$`FFEL $ of Loans Originated`[is.na(plus0001$`FFEL $ of Loans Originated`)] <- 0
plus0001$`FFEL # of Disbursements`[is.na(plus0001$`FFEL # of Disbursements`)] <- 0
plus0001$`FFEL $ of Disbursements`[is.na(plus0001$`FFEL $ of Disbursements`)] <- 0

plus0102$`DL Recipients`[is.na(plus0102$`DL Recipients`)] <- 0
plus0102$`DL # of Loans Originated`[is.na(plus0102$`DL # of Loans Originated`)] <- 0
plus0102$`DL $ of Loans Originated`[is.na(plus0102$`DL $ of Loans Originated`)] <- 0
plus0102$`DL # of Disbursements`[is.na(plus0102$`DL # of Disbursements`)] <- 0
plus0102$`DL $ of Disbursements`[is.na(plus0102$`DL $ of Disbursements`)] <- 0
plus0102$`FFEL Recipients`[is.na(plus0102$`FFEL Recipients`)] <- 0
plus0102$`FFEL # of Loans Originated`[is.na(plus0102$`FFEL # of Loans Originated`)] <- 0
plus0102$`FFEL $ of Loans Originated`[is.na(plus0102$`FFEL $ of Loans Originated`)] <- 0
plus0102$`FFEL # of Disbursements`[is.na(plus0102$`FFEL # of Disbursements`)] <- 0
plus0102$`FFEL $ of Disbursements`[is.na(plus0102$`FFEL $ of Disbursements`)] <- 0

plus0203$`DL Recipients`[is.na(plus0203$`DL Recipients`)] <- 0
plus0203$`DL # of Loans Originated`[is.na(plus0203$`DL # of Loans Originated`)] <- 0
plus0203$`DL $ of Loans Originated`[is.na(plus0203$`DL $ of Loans Originated`)] <- 0
plus0203$`DL # of Disbursements`[is.na(plus0203$`DL # of Disbursements`)] <- 0
plus0203$`DL $ of Disbursements`[is.na(plus0203$`DL $ of Disbursements`)] <- 0
plus0203$`FFEL Recipients`[is.na(plus0203$`FFEL Recipients`)] <- 0
plus0203$`FFEL # of Loans Originated`[is.na(plus0203$`FFEL # of Loans Originated`)] <- 0
plus0203$`FFEL $ of Loans Originated`[is.na(plus0203$`FFEL $ of Loans Originated`)] <- 0
plus0203$`FFEL # of Disbursements`[is.na(plus0203$`FFEL # of Disbursements`)] <- 0
plus0203$`FFEL $ of Disbursements`[is.na(plus0203$`FFEL $ of Disbursements`)] <- 0

plus0304$`DL Recipients`[is.na(plus0304$`DL Recipients`)] <- 0
plus0304$`DL # of Loans Originated`[is.na(plus0304$`DL # of Loans Originated`)] <- 0
plus0304$`DL $ of Loans Originated`[is.na(plus0304$`DL $ of Loans Originated`)] <- 0
plus0304$`DL # of Disbursements`[is.na(plus0304$`DL # of Disbursements`)] <- 0
plus0304$`DL $ of Disbursements`[is.na(plus0304$`DL $ of Disbursements`)] <- 0
plus0304$`FFEL Recipients`[is.na(plus0304$`FFEL Recipients`)] <- 0
plus0304$`FFEL # of Loans Originated`[is.na(plus0304$`FFEL # of Loans Originated`)] <- 0
plus0304$`FFEL $ of Loans Originated`[is.na(plus0304$`FFEL $ of Loans Originated`)] <- 0
plus0304$`FFEL # of Disbursements`[is.na(plus0304$`FFEL # of Disbursements`)] <- 0
plus0304$`FFEL $ of Disbursements`[is.na(plus0304$`FFEL $ of Disbursements`)] <- 0

plus0405$`DL Recipients`[is.na(plus0405$`DL Recipients`)] <- 0
plus0405$`DL # of Loans Originated`[is.na(plus0405$`DL # of Loans Originated`)] <- 0
plus0405$`DL $ of Loans Originated`[is.na(plus0405$`DL $ of Loans Originated`)] <- 0
plus0405$`DL # of Disbursements`[is.na(plus0405$`DL # of Disbursements`)] <- 0
plus0405$`DL $ of Disbursements`[is.na(plus0405$`DL $ of Disbursements`)] <- 0
plus0405$`FFEL Recipients`[is.na(plus0405$`FFEL Recipients`)] <- 0
plus0405$`FFEL # of Loans Originated`[is.na(plus0405$`FFEL # of Loans Originated`)] <- 0
plus0405$`FFEL $ of Loans Originated`[is.na(plus0405$`FFEL $ of Loans Originated`)] <- 0
plus0405$`FFEL # of Disbursements`[is.na(plus0405$`FFEL # of Disbursements`)] <- 0
plus0405$`FFEL $ of Disbursements`[is.na(plus0405$`FFEL $ of Disbursements`)] <- 0

plus0506$`DL Recipients`[is.na(plus0506$`DL Recipients`)] <- 0
plus0506$`DL # of Loans Originated`[is.na(plus0506$`DL # of Loans Originated`)] <- 0
plus0506$`DL $ of Loans Originated`[is.na(plus0506$`DL $ of Loans Originated`)] <- 0
plus0506$`DL # of Disbursements`[is.na(plus0506$`DL # of Disbursements`)] <- 0
plus0506$`DL $ of Disbursements`[is.na(plus0506$`DL $ of Disbursements`)] <- 0
plus0506$`FFEL Recipients`[is.na(plus0506$`FFEL Recipients`)] <- 0
plus0506$`FFEL # of Loans Originated`[is.na(plus0506$`FFEL # of Loans Originated`)] <- 0
plus0506$`FFEL $ of Loans Originated`[is.na(plus0506$`FFEL $ of Loans Originated`)] <- 0
plus0506$`FFEL # of Disbursements`[is.na(plus0506$`FFEL # of Disbursements`)] <- 0
plus0506$`FFEL $ of Disbursements`[is.na(plus0506$`FFEL $ of Disbursements`)] <- 0

plus0607$`DL Recipients`[is.na(plus0607$`DL Recipients`)] <- 0
plus0607$`DL # of Loans Originated`[is.na(plus0607$`DL # of Loans Originated`)] <- 0
plus0607$`DL $ of Loans Originated`[is.na(plus0607$`DL $ of Loans Originated`)] <- 0
plus0607$`DL # of Disbursements`[is.na(plus0607$`DL # of Disbursements`)] <- 0
plus0607$`DL $ of Disbursements`[is.na(plus0607$`DL $ of Disbursements`)] <- 0
plus0607$`FFEL Recipients`[is.na(plus0607$`FFEL Recipients`)] <- 0
plus0607$`FFEL # of Loans Originated`[is.na(plus0607$`FFEL # of Loans Originated`)] <- 0
plus0607$`FFEL $ of Loans Originated`[is.na(plus0607$`FFEL $ of Loans Originated`)] <- 0
plus0607$`FFEL # of Disbursements`[is.na(plus0607$`FFEL # of Disbursements`)] <- 0
plus0607$`FFEL $ of Disbursements`[is.na(plus0607$`FFEL $ of Disbursements`)] <- 0

plus0708$`DL Recipients`[is.na(plus0708$`DL Recipients`)] <- 0
plus0708$`DL # of Loans Originated`[is.na(plus0708$`DL # of Loans Originated`)] <- 0
plus0708$`DL $ of Loans Originated`[is.na(plus0708$`DL $ of Loans Originated`)] <- 0
plus0708$`DL # of Disbursements`[is.na(plus0708$`DL # of Disbursements`)] <- 0
plus0708$`DL $ of Disbursements`[is.na(plus0708$`DL $ of Disbursements`)] <- 0
plus0708$`FFEL Recipients`[is.na(plus0708$`FFEL Recipients`)] <- 0
plus0708$`FFEL # of Loans Originated`[is.na(plus0708$`FFEL # of Loans Originated`)] <- 0
plus0708$`FFEL $ of Loans Originated`[is.na(plus0708$`FFEL $ of Loans Originated`)] <- 0
plus0708$`FFEL # of Disbursements`[is.na(plus0708$`FFEL # of Disbursements`)] <- 0
plus0708$`FFEL $ of Disbursements`[is.na(plus0708$`FFEL $ of Disbursements`)] <- 0

plus0809$`DL Recipients`[is.na(plus0809$`DL Recipients`)] <- 0
plus0809$`DL # of Loans Originated`[is.na(plus0809$`DL # of Loans Originated`)] <- 0
plus0809$`DL $ of Loans Originated`[is.na(plus0809$`DL $ of Loans Originated`)] <- 0
plus0809$`DL # of Disbursements`[is.na(plus0809$`DL # of Disbursements`)] <- 0
plus0809$`DL $ of Disbursements`[is.na(plus0809$`DL $ of Disbursements`)] <- 0
plus0809$`FFEL Recipients`[is.na(plus0809$`FFEL Recipients`)] <- 0
plus0809$`FFEL # of Loans Originated`[is.na(plus0809$`FFEL # of Loans Originated`)] <- 0
plus0809$`FFEL $ of Loans Originated`[is.na(plus0809$`FFEL $ of Loans Originated`)] <- 0
plus0809$`FFEL # of Disbursements`[is.na(plus0809$`FFEL # of Disbursements`)] <- 0
plus0809$`FFEL $ of Disbursements`[is.na(plus0809$`FFEL $ of Disbursements`)] <- 0

plus0910$`DL Recipients`[is.na(plus0910$`DL Recipients`)] <- 0
plus0910$`DL # of Loans Originated`[is.na(plus0910$`DL # of Loans Originated`)] <- 0
plus0910$`DL $ of Loans Originated`[is.na(plus0910$`DL $ of Loans Originated`)] <- 0
plus0910$`DL # of Disbursements`[is.na(plus0910$`DL # of Disbursements`)] <- 0
plus0910$`DL $ of Disbursements`[is.na(plus0910$`DL $ of Disbursements`)] <- 0
plus0910$`FFEL Recipients`[is.na(plus0910$`FFEL Recipients`)] <- 0
plus0910$`FFEL # of Loans Originated`[is.na(plus0910$`FFEL # of Loans Originated`)] <- 0
plus0910$`FFEL $ of Loans Originated`[is.na(plus0910$`FFEL $ of Loans Originated`)] <- 0
plus0910$`FFEL # of Disbursements`[is.na(plus0910$`FFEL # of Disbursements`)] <- 0
plus0910$`FFEL $ of Disbursements`[is.na(plus0910$`FFEL $ of Disbursements`)] <- 0

#################################################################
### Next we create the summed variables now that we know      ###
### there are no NAs.                                         ###
#################################################################

plus9900$`Recipients` <- plus9900$`DL Recipients` + plus9900$`FFEL Recipients`
plus9900$`# of Loans Originated` <- plus9900$`DL # of Loans Originated` + plus9900$`FFEL # of Loans Originated`
plus9900$`$ of Loans Originated` <- plus9900$`DL $ of Loans Originated` + plus9900$`FFEL $ of Loans Originated`
plus9900$`# of Disbursements` <- plus9900$`DL # of Disbursements` + plus9900$`FFEL # of Disbursements`
plus9900$`$ of Disbursements` <- plus9900$`DL $ of Disbursements` + plus9900$`FFEL $ of Disbursements`
plus9900 <- plus9900 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0001$`Recipients` <- plus0001$`DL Recipients` + plus0001$`FFEL Recipients`
plus0001$`# of Loans Originated` <- plus0001$`DL # of Loans Originated` + plus0001$`FFEL # of Loans Originated`
plus0001$`$ of Loans Originated` <- plus0001$`DL $ of Loans Originated` + plus0001$`FFEL $ of Loans Originated`
plus0001$`# of Disbursements` <- plus0001$`DL # of Disbursements` + plus0001$`FFEL # of Disbursements`
plus0001$`$ of Disbursements` <- plus0001$`DL $ of Disbursements` + plus0001$`FFEL $ of Disbursements`
plus0001 <- plus0001 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0102$`Recipients` <- plus0102$`DL Recipients` + plus0102$`FFEL Recipients`
plus0102$`# of Loans Originated` <- plus0102$`DL # of Loans Originated` + plus0102$`FFEL # of Loans Originated`
plus0102$`$ of Loans Originated` <- plus0102$`DL $ of Loans Originated` + plus0102$`FFEL $ of Loans Originated`
plus0102$`# of Disbursements` <- plus0102$`DL # of Disbursements` + plus0102$`FFEL # of Disbursements`
plus0102$`$ of Disbursements` <- plus0102$`DL $ of Disbursements` + plus0102$`FFEL $ of Disbursements`
plus0102 <- plus0102 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0203$`Recipients` <- plus0203$`DL Recipients` + plus0203$`FFEL Recipients`
plus0203$`# of Loans Originated` <- plus0203$`DL # of Loans Originated` + plus0203$`FFEL # of Loans Originated`
plus0203$`$ of Loans Originated` <- plus0203$`DL $ of Loans Originated` + plus0203$`FFEL $ of Loans Originated`
plus0203$`# of Disbursements` <- plus0203$`DL # of Disbursements` + plus0203$`FFEL # of Disbursements`
plus0203$`$ of Disbursements` <- plus0203$`DL $ of Disbursements` + plus0203$`FFEL $ of Disbursements`
plus0203 <- plus0203 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0304$`Recipients` <- plus0304$`DL Recipients` + plus0304$`FFEL Recipients`
plus0304$`# of Loans Originated` <- plus0304$`DL # of Loans Originated` + plus0304$`FFEL # of Loans Originated`
plus0304$`$ of Loans Originated` <- plus0304$`DL $ of Loans Originated` + plus0304$`FFEL $ of Loans Originated`
plus0304$`# of Disbursements` <- plus0304$`DL # of Disbursements` + plus0304$`FFEL # of Disbursements`
plus0304$`$ of Disbursements` <- plus0304$`DL $ of Disbursements` + plus0304$`FFEL $ of Disbursements`
plus0304 <- plus0304 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0405$`Recipients` <- plus0405$`DL Recipients` + plus0405$`FFEL Recipients`
plus0405$`# of Loans Originated` <- plus0405$`DL # of Loans Originated` + plus0405$`FFEL # of Loans Originated`
plus0405$`$ of Loans Originated` <- plus0405$`DL $ of Loans Originated` + plus0405$`FFEL $ of Loans Originated`
plus0405$`# of Disbursements` <- plus0405$`DL # of Disbursements` + plus0405$`FFEL # of Disbursements`
plus0405$`$ of Disbursements` <- plus0405$`DL $ of Disbursements` + plus0405$`FFEL $ of Disbursements`
plus0405 <- plus0405 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0506$`Recipients` <- plus0506$`DL Recipients` + plus0506$`FFEL Recipients`
plus0506$`# of Loans Originated` <- plus0506$`DL # of Loans Originated` + plus0506$`FFEL # of Loans Originated`
plus0506$`$ of Loans Originated` <- plus0506$`DL $ of Loans Originated` + plus0506$`FFEL $ of Loans Originated`
plus0506$`# of Disbursements` <- plus0506$`DL # of Disbursements` + plus0506$`FFEL # of Disbursements`
plus0506$`$ of Disbursements` <- plus0506$`DL $ of Disbursements` + plus0506$`FFEL $ of Disbursements`
plus0506 <- plus0506 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0607$`Recipients` <- plus0607$`DL Recipients` + plus0607$`FFEL Recipients`
plus0607$`# of Loans Originated` <- plus0607$`DL # of Loans Originated` + plus0607$`FFEL # of Loans Originated`
plus0607$`$ of Loans Originated` <- plus0607$`DL $ of Loans Originated` + plus0607$`FFEL $ of Loans Originated`
plus0607$`# of Disbursements` <- plus0607$`DL # of Disbursements` + plus0607$`FFEL # of Disbursements`
plus0607$`$ of Disbursements` <- plus0607$`DL $ of Disbursements` + plus0607$`FFEL $ of Disbursements`
plus0607 <- plus0607 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0708$`Recipients` <- plus0708$`DL Recipients` + plus0708$`FFEL Recipients`
plus0708$`# of Loans Originated` <- plus0708$`DL # of Loans Originated` + plus0708$`FFEL # of Loans Originated`
plus0708$`$ of Loans Originated` <- plus0708$`DL $ of Loans Originated` + plus0708$`FFEL $ of Loans Originated`
plus0708$`# of Disbursements` <- plus0708$`DL # of Disbursements` + plus0708$`FFEL # of Disbursements`
plus0708$`$ of Disbursements` <- plus0708$`DL $ of Disbursements` + plus0708$`FFEL $ of Disbursements`
plus0708 <- plus0708 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0809$`Recipients` <- plus0809$`DL Recipients` + plus0809$`FFEL Recipients`
plus0809$`# of Loans Originated` <- plus0809$`DL # of Loans Originated` + plus0809$`FFEL # of Loans Originated`
plus0809$`$ of Loans Originated` <- plus0809$`DL $ of Loans Originated` + plus0809$`FFEL $ of Loans Originated`
plus0809$`# of Disbursements` <- plus0809$`DL # of Disbursements` + plus0809$`FFEL # of Disbursements`
plus0809$`$ of Disbursements` <- plus0809$`DL $ of Disbursements` + plus0809$`FFEL $ of Disbursements`
plus0809 <- plus0809 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

plus0910$`Recipients` <- plus0910$`DL Recipients` + plus0910$`FFEL Recipients`
plus0910$`# of Loans Originated` <- plus0910$`DL # of Loans Originated` + plus0910$`FFEL # of Loans Originated`
plus0910$`$ of Loans Originated` <- plus0910$`DL $ of Loans Originated` + plus0910$`FFEL $ of Loans Originated`
plus0910$`# of Disbursements` <- plus0910$`DL # of Disbursements` + plus0910$`FFEL # of Disbursements`
plus0910$`$ of Disbursements` <- plus0910$`DL $ of Disbursements` + plus0910$`FFEL $ of Disbursements`
plus0910 <- plus0910 %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)

#################################################################
### Next we make the OPEID variable linkable with IPEDS data. ###
#################################################################

names(plus9900)[1] <- "OPEID"
names(plus0001)[1] <- "OPEID"
names(plus0102)[1] <- "OPEID"
names(plus0203)[1] <- "OPEID"
names(plus0304)[1] <- "OPEID"
names(plus0405)[1] <- "OPEID"
names(plus0506)[1] <- "OPEID"
names(plus0607)[1] <- "OPEID"
names(plus0708)[1] <- "OPEID"
names(plus0809)[1] <- "OPEID"
names(plus0910)[1] <- "OPEID"
names(plus1011)[1] <- "OPEID"
names(plus1112)[1] <- "OPEID"
names(plus1213)[1] <- "OPEID"
names(plus1314)[1] <- "OPEID"
names(plus1415)[1] <- "OPEID"
names(plus1516)[1] <- "OPEID"
names(plus1617)[1] <- "OPEID"
names(plus1718)[1] <- "OPEID"
names(plus1819)[1] <- "OPEID"
names(plus1920)[1] <- "OPEID"
names(plus2021)[1] <- "OPEID"

#################################################################
### Next we load in the IPEDS data on institutional           ###
### characteristics.                                          ###
#################################################################

hd9900 <- fread("ic99_hd.csv", header=TRUE, select=c("unitid", "instnm", "opeid", "sector", "control", "hbcu"))
names(hd9900) <- toupper(names(hd9900))
hd0001 <- fread("fa2000hd.csv", header=TRUE, select=c("unitid", "instnm", "opeid", "sector", "control", "hbcu"))
names(hd0001) <- toupper(names(hd0001))
hd0102 <- fread("fa2001hd.csv", header=TRUE, select=c("unitid", "instnm", "opeid", "sector", "control", "hbcu")) 
names(hd0102) <- toupper(names(hd0102))
hd0203 <- fread("hd2002.csv", header=TRUE, select=c("unitid", "instnm", "opeid", "sector", "control", "hbcu"))
names(hd0203) <- toupper(names(hd0203))
hd0304 <- fread("hd2003.csv", header=TRUE, select=c("unitid", "instnm", "opeid", "sector", "control", "hbcu"))
names(hd0304) <- toupper(names(hd0304))
hd0405 <- fread("hd2004.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd0506 <- fread("hd2005.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd0607 <- fread("hd2006.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd0708 <- fread("hd2007.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd0809 <- fread("hd2008.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd0910 <- fread("hd2009.csv", header=TRUE, select=c("unitid", "instnm", "opeid", "sector", "control", "hbcu"))
names(hd0910) <- toupper(names(hd0910))
hd1011 <- fread("hd2010.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1112 <- fread("hd2011.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1213 <- fread("hd2012.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1314 <- fread("hd2013.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1415 <- fread("hd2014.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1516 <- fread("hd2015.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1617 <- fread("hd2016.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1718 <- fread("hd2017.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1819 <- fread("hd2018.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd1920 <- fread("hd2019.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
hd2021 <- fread("hd2020.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))

#################################################################
### Next we make sure OPEIDs are stored as characters.        ###
#################################################################

plus9900$OPEID <- as.character(plus9900$OPEID)
plus0001$OPEID <- as.character(plus0001$OPEID)
plus0102$OPEID <- as.character(plus0102$OPEID)
plus0203$OPEID <- as.character(plus0203$OPEID)
plus0304$OPEID <- as.character(plus0304$OPEID)
plus0405$OPEID <- as.character(plus0405$OPEID)
plus0506$OPEID <- as.character(plus0506$OPEID)
plus0607$OPEID <- as.character(plus0607$OPEID)
plus0708$OPEID <- as.character(plus0708$OPEID)
plus0809$OPEID <- as.character(plus0809$OPEID)
plus0910$OPEID <- as.character(plus0910$OPEID)
plus1011$OPEID <- as.character(plus1011$OPEID)
plus1112$OPEID <- as.character(plus1112$OPEID)
plus1213$OPEID <- as.character(plus1213$OPEID)
plus1314$OPEID <- as.character(plus1314$OPEID)
plus1415$OPEID <- as.character(plus1415$OPEID)
plus1516$OPEID <- as.character(plus1516$OPEID)
plus1617$OPEID <- as.character(plus1617$OPEID)
plus1718$OPEID <- as.character(plus1718$OPEID)
plus1819$OPEID <- as.character(plus1819$OPEID)
plus1920$OPEID <- as.character(plus1920$OPEID)
plus2021$OPEID <- as.character(plus2021$OPEID)
hd9900$OPEID <- as.character(hd9900$OPEID)
hd0001$OPEID <- as.character(hd0001$OPEID)
hd0102$OPEID <- as.character(hd0102$OPEID)
hd0203$OPEID <- as.character(hd0203$OPEID)
hd0304$OPEID <- as.character(hd0304$OPEID)
hd0405$OPEID <- as.character(hd0405$OPEID)
hd0506$OPEID <- as.character(hd0506$OPEID)
hd0607$OPEID <- as.character(hd0607$OPEID)
hd0708$OPEID <- as.character(hd0708$OPEID)
hd0809$OPEID <- as.character(hd0809$OPEID)
hd0910$OPEID <- as.character(hd0910$OPEID)
hd1011$OPEID <- as.character(hd1011$OPEID)
hd1112$OPEID <- as.character(hd1112$OPEID)
hd1213$OPEID <- as.character(hd1213$OPEID)
hd1314$OPEID <- as.character(hd1314$OPEID)
hd1415$OPEID <- as.character(hd1415$OPEID)
hd1516$OPEID <- as.character(hd1516$OPEID)
hd1617$OPEID <- as.character(hd1617$OPEID)
hd1718$OPEID <- as.character(hd1718$OPEID)
hd1819$OPEID <- as.character(hd1819$OPEID)
hd1920$OPEID <- as.character(hd1920$OPEID)
hd2021$OPEID <- as.character(hd2021$OPEID)

#################################################################
### Next we add a 0 digit to any six-digit OPEIDs in the PLUS ###
### data.                                                     ###
#################################################################

plus9900$OPEID <- ifelse(nchar(plus9900$OPEID) == 6, paste("0", plus9900$OPEID, sep=""), plus9900$OPEID)
plus0001$OPEID <- ifelse(nchar(plus0001$OPEID) == 6, paste("0", plus0001$OPEID, sep=""), plus0001$OPEID)
plus0102$OPEID <- ifelse(nchar(plus0102$OPEID) == 6, paste("0", plus0102$OPEID, sep=""), plus0102$OPEID)
plus0203$OPEID <- ifelse(nchar(plus0203$OPEID) == 6, paste("0", plus0203$OPEID, sep=""), plus0203$OPEID)
plus0304$OPEID <- ifelse(nchar(plus0304$OPEID) == 6, paste("0", plus0304$OPEID, sep=""), plus0304$OPEID)
plus0405$OPEID <- ifelse(nchar(plus0405$OPEID) == 6, paste("0", plus0405$OPEID, sep=""), plus0405$OPEID)
plus0506$OPEID <- ifelse(nchar(plus0506$OPEID) == 6, paste("0", plus0506$OPEID, sep=""), plus0506$OPEID)
plus0607$OPEID <- ifelse(nchar(plus0607$OPEID) == 6, paste("0", plus0607$OPEID, sep=""), plus0607$OPEID)
plus0708$OPEID <- ifelse(nchar(plus0708$OPEID) == 6, paste("0", plus0708$OPEID, sep=""), plus0708$OPEID)
plus0809$OPEID <- ifelse(nchar(plus0809$OPEID) == 6, paste("0", plus0809$OPEID, sep=""), plus0809$OPEID)
plus0910$OPEID <- ifelse(nchar(plus0910$OPEID) == 6, paste("0", plus0910$OPEID, sep=""), plus0910$OPEID)
plus1011$OPEID <- ifelse(nchar(plus1011$OPEID) == 6, paste("0", plus1011$OPEID, sep=""), plus1011$OPEID)
plus1112$OPEID <- ifelse(nchar(plus1112$OPEID) == 6, paste("0", plus1112$OPEID, sep=""), plus1112$OPEID)
plus1213$OPEID <- ifelse(nchar(plus1213$OPEID) == 6, paste("0", plus1213$OPEID, sep=""), plus1213$OPEID)
plus1314$OPEID <- ifelse(nchar(plus1314$OPEID) == 6, paste("0", plus1314$OPEID, sep=""), plus1314$OPEID)
plus1415$OPEID <- ifelse(nchar(plus1415$OPEID) == 6, paste("0", plus1415$OPEID, sep=""), plus1415$OPEID)
plus1516$OPEID <- ifelse(nchar(plus1516$OPEID) == 6, paste("0", plus1516$OPEID, sep=""), plus1516$OPEID)
plus1617$OPEID <- ifelse(nchar(plus1617$OPEID) == 6, paste("0", plus1617$OPEID, sep=""), plus1617$OPEID)
plus1718$OPEID <- ifelse(nchar(plus1718$OPEID) == 6, paste("0", plus1718$OPEID, sep=""), plus1718$OPEID)
plus1819$OPEID <- ifelse(nchar(plus1819$OPEID) == 6, paste("0", plus1819$OPEID, sep=""), plus1819$OPEID)
plus1920$OPEID <- ifelse(nchar(plus1920$OPEID) == 6, paste("0", plus1920$OPEID, sep=""), plus1920$OPEID)
plus2021$OPEID <- ifelse(nchar(plus2021$OPEID) == 6, paste("0", plus2021$OPEID, sep=""), plus2021$OPEID)

#################################################################
### Next we add a 0 digit to any seven-digit OPEIDs in the    ###
### PLUS data.                                                ###
#################################################################

plus9900$OPEID <- ifelse(nchar(plus9900$OPEID) == 7, paste("0", plus9900$OPEID, sep=""), plus9900$OPEID)
plus0001$OPEID <- ifelse(nchar(plus0001$OPEID) == 7, paste("0", plus0001$OPEID, sep=""), plus0001$OPEID)
plus0102$OPEID <- ifelse(nchar(plus0102$OPEID) == 7, paste("0", plus0102$OPEID, sep=""), plus0102$OPEID)
plus0203$OPEID <- ifelse(nchar(plus0203$OPEID) == 7, paste("0", plus0203$OPEID, sep=""), plus0203$OPEID)
plus0304$OPEID <- ifelse(nchar(plus0304$OPEID) == 7, paste("0", plus0304$OPEID, sep=""), plus0304$OPEID)
plus0405$OPEID <- ifelse(nchar(plus0405$OPEID) == 7, paste("0", plus0405$OPEID, sep=""), plus0405$OPEID)
plus0506$OPEID <- ifelse(nchar(plus0506$OPEID) == 7, paste("0", plus0506$OPEID, sep=""), plus0506$OPEID)
plus0607$OPEID <- ifelse(nchar(plus0607$OPEID) == 7, paste("0", plus0607$OPEID, sep=""), plus0607$OPEID)
plus0708$OPEID <- ifelse(nchar(plus0708$OPEID) == 7, paste("0", plus0708$OPEID, sep=""), plus0708$OPEID)
plus0809$OPEID <- ifelse(nchar(plus0809$OPEID) == 7, paste("0", plus0809$OPEID, sep=""), plus0809$OPEID)
plus0910$OPEID <- ifelse(nchar(plus0910$OPEID) == 7, paste("0", plus0910$OPEID, sep=""), plus0910$OPEID)
plus1011$OPEID <- ifelse(nchar(plus1011$OPEID) == 7, paste("0", plus1011$OPEID, sep=""), plus1011$OPEID)
plus1112$OPEID <- ifelse(nchar(plus1112$OPEID) == 7, paste("0", plus1112$OPEID, sep=""), plus1112$OPEID)
plus1213$OPEID <- ifelse(nchar(plus1213$OPEID) == 7, paste("0", plus1213$OPEID, sep=""), plus1213$OPEID)
plus1314$OPEID <- ifelse(nchar(plus1314$OPEID) == 7, paste("0", plus1314$OPEID, sep=""), plus1314$OPEID)
plus1415$OPEID <- ifelse(nchar(plus1415$OPEID) == 7, paste("0", plus1415$OPEID, sep=""), plus1415$OPEID)
plus1516$OPEID <- ifelse(nchar(plus1516$OPEID) == 7, paste("0", plus1516$OPEID, sep=""), plus1516$OPEID)
plus1617$OPEID <- ifelse(nchar(plus1617$OPEID) == 7, paste("0", plus1617$OPEID, sep=""), plus1617$OPEID)
plus1718$OPEID <- ifelse(nchar(plus1718$OPEID) == 7, paste("0", plus1718$OPEID, sep=""), plus1718$OPEID)
plus1819$OPEID <- ifelse(nchar(plus1819$OPEID) == 7, paste("0", plus1819$OPEID, sep=""), plus1819$OPEID)
plus1920$OPEID <- ifelse(nchar(plus1920$OPEID) == 7, paste("0", plus1920$OPEID, sep=""), plus1920$OPEID)
plus2021$OPEID <- ifelse(nchar(plus2021$OPEID) == 7, paste("0", plus2021$OPEID, sep=""), plus2021$OPEID)

#################################################################
### Next we add a 0 digit to any six-digit OPEIDs in the      ###
### IPEDS data.                                               ###
#################################################################

hd1112$OPEID <- ifelse(nchar(hd1112$OPEID) == 6, paste("0", hd1112$OPEID, sep=""), hd1112$OPEID)
hd1213$OPEID <- ifelse(nchar(hd1213$OPEID) == 6, paste("0", hd1213$OPEID, sep=""), hd1213$OPEID)
hd1314$OPEID <- ifelse(nchar(hd1314$OPEID) == 6, paste("0", hd1314$OPEID, sep=""), hd1314$OPEID)
hd1415$OPEID <- ifelse(nchar(hd1415$OPEID) == 6, paste("0", hd1415$OPEID, sep=""), hd1415$OPEID)
hd1516$OPEID <- ifelse(nchar(hd1516$OPEID) == 6, paste("0", hd1516$OPEID, sep=""), hd1516$OPEID)
hd1819$OPEID <- ifelse(nchar(hd1819$OPEID) == 6, paste("0", hd1819$OPEID, sep=""), hd1819$OPEID)
hd1920$OPEID <- ifelse(nchar(hd1920$OPEID) == 6, paste("0", hd1920$OPEID, sep=""), hd1920$OPEID)
hd2021$OPEID <- ifelse(nchar(hd2021$OPEID) == 6, paste("0", hd2021$OPEID, sep=""), hd2021$OPEID)

#################################################################
### Next we add a 0 digit to any seven-digit OPEIDs in the    ###
### IPEDS data.                                               ###
#################################################################

hd1112$OPEID <- ifelse(nchar(hd1112$OPEID) == 7, paste("0", hd1112$OPEID, sep=""), hd1112$OPEID)
hd1213$OPEID <- ifelse(nchar(hd1213$OPEID) == 7, paste("0", hd1213$OPEID, sep=""), hd1213$OPEID)
hd1314$OPEID <- ifelse(nchar(hd1314$OPEID) == 7, paste("0", hd1314$OPEID, sep=""), hd1314$OPEID)
hd1415$OPEID <- ifelse(nchar(hd1415$OPEID) == 7, paste("0", hd1415$OPEID, sep=""), hd1415$OPEID)
hd1516$OPEID <- ifelse(nchar(hd1516$OPEID) == 7, paste("0", hd1516$OPEID, sep=""), hd1516$OPEID)
hd1819$OPEID <- ifelse(nchar(hd1819$OPEID) == 7, paste("0", hd1819$OPEID, sep=""), hd1819$OPEID)
hd1920$OPEID <- ifelse(nchar(hd1920$OPEID) == 7, paste("0", hd1920$OPEID, sep=""), hd1920$OPEID)
hd2021$OPEID <- ifelse(nchar(hd2021$OPEID) == 7, paste("0", hd2021$OPEID, sep=""), hd2021$OPEID)

#################################################################
### Now we join the IPEDS data to the PLUS data.              ###
#################################################################

data9900 <- left_join(x=plus9900, y=hd9900, by="OPEID")
data0001 <- left_join(x=plus0001, y=hd0001, by="OPEID")
data0102 <- left_join(x=plus0102, y=hd0102, by="OPEID")
data0203 <- left_join(x=plus0203, y=hd0203, by="OPEID")
data0304 <- left_join(x=plus0304, y=hd0304, by="OPEID")
data0405 <- left_join(x=plus0405, y=hd0405, by="OPEID")
data0506 <- left_join(x=plus0506, y=hd0506, by="OPEID")
data0607 <- left_join(x=plus0607, y=hd0607, by="OPEID")
data0708 <- left_join(x=plus0708, y=hd0708, by="OPEID")
data0809 <- left_join(x=plus0809, y=hd0809, by="OPEID")
data0910 <- left_join(x=plus0910, y=hd0910, by="OPEID")
data1011 <- left_join(x=plus1011, y=hd1011, by="OPEID")
data1112 <- left_join(x=plus1112, y=hd1112, by="OPEID")
data1213 <- left_join(x=plus1213, y=hd1213, by="OPEID")
data1314 <- left_join(x=plus1314, y=hd1314, by="OPEID")
data1415 <- left_join(x=plus1415, y=hd1415, by="OPEID")
data1516 <- left_join(x=plus1516, y=hd1516, by="OPEID")
data1617 <- left_join(x=plus1617, y=hd1617, by="OPEID")
data1718 <- left_join(x=plus1718, y=hd1718, by="OPEID")
data1819 <- left_join(x=plus1819, y=hd1819, by="OPEID")
data1920 <- left_join(x=plus1920, y=hd1920, by="OPEID")
data2021 <- left_join(x=plus2021, y=hd2021, by="OPEID")

##################################################################
### Now we load in the data on non-PLUS student financial aid. ###
##################################################################

sfa09 <- fread("sfa0809_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa10 <- fread("sfa0910_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa11 <- fread("sfa1011_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa12 <- fread("sfa1112_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa13 <- fread("sfa1213_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa14 <- fread("sfa1314_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa15 <- fread("sfa1415_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa16 <- fread("sfa1516_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa17 <- fread("sfa1617_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa18 <- fread("sfa1718_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa19 <- fread("sfa1819_rv.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS
sfa20 <- fread("sfa1920.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS 
sfa21 <- fread("sfa1920.csv", header=TRUE, select=c("UNITID", "UAGRNTT", "UFLOANT")) # UFLOANT does not include Parent PLUS # Imputing prior year data

opeid09 <- fread("hd2009.csv", header=TRUE, select=c("unitid", "opeid"))
names(opeid09) <- c("UNITID", "OPEID")
opeid10 <- fread("hd2010.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid11 <- fread("hd2011.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid12 <- fread("hd2012.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid13 <- fread("hd2013.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid14 <- fread("hd2014.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid15 <- fread("hd2015.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid16 <- fread("hd2016.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid17 <- fread("hd2017.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid18 <- fread("hd2018.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid19 <- fread("hd2019.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid20 <- fread("hd2020.csv", header=TRUE, select=c("UNITID", "OPEID"))
opeid21 <- fread("hd2020.csv", header=TRUE, select=c("UNITID", "OPEID")) # Imputing prior year data 

sfa09 <- right_join(x=opeid09, y=sfa09, by="UNITID")
sfa10 <- right_join(x=opeid10, y=sfa10, by="UNITID")
sfa11 <- right_join(x=opeid11, y=sfa11, by="UNITID")
sfa12 <- right_join(x=opeid12, y=sfa12, by="UNITID")
sfa13 <- right_join(x=opeid13, y=sfa13, by="UNITID")
sfa14 <- right_join(x=opeid14, y=sfa14, by="UNITID")
sfa15 <- right_join(x=opeid15, y=sfa15, by="UNITID")
sfa16 <- right_join(x=opeid16, y=sfa16, by="UNITID")
sfa17 <- right_join(x=opeid17, y=sfa17, by="UNITID")
sfa18 <- right_join(x=opeid18, y=sfa18, by="UNITID")
sfa19 <- right_join(x=opeid19, y=sfa19, by="UNITID")
sfa20 <- right_join(x=opeid20, y=sfa20, by="UNITID")
sfa21 <- right_join(x=opeid21, y=sfa21, by="UNITID")

sfa09 <- aggregate(data=sfa09, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
names(sfa09) <- c("OPEID", "UAGRNTT", "UFLOANT")
sfa10 <- aggregate(data=sfa10, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
names(sfa10) <- c("OPEID", "UAGRNTT", "UFLOANT")
sfa11 <- aggregate(data=sfa11, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa12 <- aggregate(data=sfa12, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa13 <- aggregate(data=sfa13, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa14 <- aggregate(data=sfa14, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa15 <- aggregate(data=sfa15, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa16 <- aggregate(data=sfa16, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa17 <- aggregate(data=sfa17, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa18 <- aggregate(data=sfa18, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa19 <- aggregate(data=sfa19, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa20 <- aggregate(data=sfa20, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)
sfa21 <- aggregate(data=sfa21, cbind(UAGRNTT, UFLOANT) ~ OPEID, FUN=sum)

sfa09$OPEID <- as.character(sfa09$OPEID)
sfa10$OPEID <- as.character(sfa10$OPEID)
sfa11$OPEID <- as.character(sfa11$OPEID)
sfa12$OPEID <- as.character(sfa12$OPEID)
sfa13$OPEID <- as.character(sfa13$OPEID)
sfa14$OPEID <- as.character(sfa14$OPEID)
sfa15$OPEID <- as.character(sfa15$OPEID)
sfa16$OPEID <- as.character(sfa16$OPEID)
sfa17$OPEID <- as.character(sfa17$OPEID)
sfa18$OPEID <- as.character(sfa18$OPEID)
sfa19$OPEID <- as.character(sfa19$OPEID)
sfa20$OPEID <- as.character(sfa20$OPEID)
sfa21$OPEID <- as.character(sfa21$OPEID)

sfa09$OPEID <- ifelse(nchar(sfa09$OPEID) == 6, paste("0", sfa09$OPEID, sep=""), sfa09$OPEID)
sfa10$OPEID <- ifelse(nchar(sfa10$OPEID) == 6, paste("0", sfa10$OPEID, sep=""), sfa10$OPEID)
sfa11$OPEID <- ifelse(nchar(sfa11$OPEID) == 6, paste("0", sfa11$OPEID, sep=""), sfa11$OPEID)
sfa12$OPEID <- ifelse(nchar(sfa12$OPEID) == 6, paste("0", sfa12$OPEID, sep=""), sfa12$OPEID)
sfa13$OPEID <- ifelse(nchar(sfa13$OPEID) == 6, paste("0", sfa13$OPEID, sep=""), sfa13$OPEID)
sfa14$OPEID <- ifelse(nchar(sfa14$OPEID) == 6, paste("0", sfa14$OPEID, sep=""), sfa14$OPEID)
sfa15$OPEID <- ifelse(nchar(sfa15$OPEID) == 6, paste("0", sfa15$OPEID, sep=""), sfa15$OPEID)
sfa16$OPEID <- ifelse(nchar(sfa16$OPEID) == 6, paste("0", sfa16$OPEID, sep=""), sfa16$OPEID)
sfa17$OPEID <- ifelse(nchar(sfa17$OPEID) == 6, paste("0", sfa17$OPEID, sep=""), sfa17$OPEID)
sfa18$OPEID <- ifelse(nchar(sfa18$OPEID) == 6, paste("0", sfa18$OPEID, sep=""), sfa18$OPEID)
sfa19$OPEID <- ifelse(nchar(sfa19$OPEID) == 6, paste("0", sfa19$OPEID, sep=""), sfa19$OPEID)
sfa20$OPEID <- ifelse(nchar(sfa20$OPEID) == 6, paste("0", sfa20$OPEID, sep=""), sfa20$OPEID)
sfa21$OPEID <- ifelse(nchar(sfa21$OPEID) == 6, paste("0", sfa21$OPEID, sep=""), sfa21$OPEID)

sfa09$OPEID <- ifelse(nchar(sfa09$OPEID) == 7, paste("0", sfa09$OPEID, sep=""), sfa09$OPEID)
sfa10$OPEID <- ifelse(nchar(sfa10$OPEID) == 7, paste("0", sfa10$OPEID, sep=""), sfa10$OPEID)
sfa11$OPEID <- ifelse(nchar(sfa11$OPEID) == 7, paste("0", sfa11$OPEID, sep=""), sfa11$OPEID)
sfa12$OPEID <- ifelse(nchar(sfa12$OPEID) == 7, paste("0", sfa12$OPEID, sep=""), sfa12$OPEID)
sfa13$OPEID <- ifelse(nchar(sfa13$OPEID) == 7, paste("0", sfa13$OPEID, sep=""), sfa13$OPEID)
sfa14$OPEID <- ifelse(nchar(sfa14$OPEID) == 7, paste("0", sfa14$OPEID, sep=""), sfa14$OPEID)
sfa15$OPEID <- ifelse(nchar(sfa15$OPEID) == 7, paste("0", sfa15$OPEID, sep=""), sfa15$OPEID)
sfa16$OPEID <- ifelse(nchar(sfa16$OPEID) == 7, paste("0", sfa16$OPEID, sep=""), sfa16$OPEID)
sfa17$OPEID <- ifelse(nchar(sfa17$OPEID) == 7, paste("0", sfa17$OPEID, sep=""), sfa17$OPEID)
sfa18$OPEID <- ifelse(nchar(sfa18$OPEID) == 7, paste("0", sfa18$OPEID, sep=""), sfa18$OPEID)
sfa19$OPEID <- ifelse(nchar(sfa19$OPEID) == 7, paste("0", sfa19$OPEID, sep=""), sfa19$OPEID)
sfa20$OPEID <- ifelse(nchar(sfa20$OPEID) == 7, paste("0", sfa20$OPEID, sep=""), sfa20$OPEID)
sfa21$OPEID <- ifelse(nchar(sfa21$OPEID) == 7, paste("0", sfa21$OPEID, sep=""), sfa21$OPEID)

#################################################################
### Next we merge the non-PLUS student financial aid data     ###
### into the rest of the data.                                ###
################################################################# 

data0809 <- left_join(x=data0809, y=sfa09, by="OPEID")
data0910 <- left_join(x=data0910, y=sfa10, by="OPEID")
data1011 <- left_join(x=data1011, y=sfa11, by="OPEID")
data1112 <- left_join(x=data1112, y=sfa12, by="OPEID")
data1213 <- left_join(x=data1213, y=sfa13, by="OPEID")
data1314 <- left_join(x=data1314, y=sfa14, by="OPEID")
data1415 <- left_join(x=data1415, y=sfa15, by="OPEID")
data1516 <- left_join(x=data1516, y=sfa16, by="OPEID")
data1617 <- left_join(x=data1617, y=sfa17, by="OPEID")
data1718 <- left_join(x=data1718, y=sfa18, by="OPEID")
data1819 <- left_join(x=data1819, y=sfa19, by="OPEID")
data1920 <- left_join(x=data1920, y=sfa20, by="OPEID")
data2021 <- left_join(x=data2021, y=sfa21, by="OPEID")

#################################################################
### Next we add NAs into the sets that lack student financial ###
### aid data.                                                 ###
#################################################################

data9900$UAGRNTT <- rep(NA, nrow(data9900))
data0001$UAGRNTT <- rep(NA, nrow(data0001))
data0102$UAGRNTT <- rep(NA, nrow(data0102))
data0203$UAGRNTT <- rep(NA, nrow(data0203))
data0304$UAGRNTT <- rep(NA, nrow(data0304))
data0405$UAGRNTT <- rep(NA, nrow(data0405))
data0506$UAGRNTT <- rep(NA, nrow(data0506))
data0607$UAGRNTT <- rep(NA, nrow(data0607))
data0708$UAGRNTT <- rep(NA, nrow(data0708))

data9900$UFLOANT <- rep(NA, nrow(data9900))
data0001$UFLOANT <- rep(NA, nrow(data0001))
data0102$UFLOANT <- rep(NA, nrow(data0102))
data0203$UFLOANT <- rep(NA, nrow(data0203))
data0304$UFLOANT <- rep(NA, nrow(data0304))
data0405$UFLOANT <- rep(NA, nrow(data0405))
data0506$UFLOANT <- rep(NA, nrow(data0506))
data0607$UFLOANT <- rep(NA, nrow(data0607))
data0708$UFLOANT <- rep(NA, nrow(data0708))

#################################################################
### Now we add year labels to the data before merging them.   ###
#################################################################

data9900$Year <- rep("2000", nrow(data9900))
data0001$Year <- rep("2001", nrow(data0001))
data0102$Year <- rep("2002", nrow(data0102))
data0203$Year <- rep("2003", nrow(data0203))
data0304$Year <- rep("2004", nrow(data0304))
data0405$Year <- rep("2005", nrow(data0405))
data0506$Year <- rep("2006", nrow(data0506))
data0607$Year <- rep("2007", nrow(data0607))
data0708$Year <- rep("2008", nrow(data0708))
data0809$Year <- rep("2009", nrow(data0809))
data0910$Year <- rep("2010", nrow(data0910))
data1011$Year <- rep("2011", nrow(data1011))
data1112$Year <- rep("2012", nrow(data1112))
data1213$Year <- rep("2013", nrow(data1213))
data1314$Year <- rep("2014", nrow(data1314))
data1415$Year <- rep("2015", nrow(data1415))
data1516$Year <- rep("2016", nrow(data1516))
data1617$Year <- rep("2017", nrow(data1617))
data1718$Year <- rep("2018", nrow(data1718))
data1819$Year <- rep("2019", nrow(data1819))
data1920$Year <- rep("2020", nrow(data1920))
data2021$Year <- rep("2021", nrow(data2021))

#################################################################
### Now we merge all the data into one set.                   ###
#################################################################

allData <- rbind(data9900,
                 data0001,
                 data0102,
                 data0203,
                 data0304,
                 data0405,
                 data0506,
                 data0607,
                 data0708,
                 data0809,
                 data0910,
                 data1011,
                 data1112,
                 data1213,
                 data1314,
                 data1415,
                 data1516,
                 data1617,
                 data1718,
                 data1819,
                 data1920,
                 data2021)

#################################################################
### Now we need to ensure some data points are numeric.       ###
#################################################################

allData$`$ of Loans Originated` <- as.numeric(allData$`$ of Loans Originated`)
allData$`$ of Disbursements` <- as.numeric(allData$`$ of Disbursements`)
allData$`Recipients` <- as.numeric(allData$`Recipients`)
allData$`UAGRNTT` <- as.numeric(allData$`UAGRNTT`)
allData$`UFLOANT` <- as.numeric(allData$`UFLOANT`)

#################################################################
### And now we create an HBCU+Control variable.               ###
#################################################################

allData$Group <- rep(NA, nrow(allData))
allData$Group[allData$HBCU==1 & allData$CONTROL==1] <- "Public HBCUs"
allData$Group[allData$HBCU==2 & allData$CONTROL==1] <- "Public Non-HBCUs"
allData$Group[allData$HBCU==1 & allData$CONTROL==2] <- "Private HBCUs"
allData$Group[allData$HBCU==2 & allData$CONTROL==2] <- "Private Non-HBCUs"
allData$Group[allData$HBCU==2 & allData$CONTROL==3] <- "For-profits"

#################################################################
### Now we adjust for inflation.                              ###
#################################################################

allData$InflationMultiplier <- rep(NA, nrow(allData))
  allData$InflationMultiplier[allData$Year=="2000"] <- 1.68078
  allData$InflationMultiplier[allData$Year=="2001"] <- 1.62031
  allData$InflationMultiplier[allData$Year=="2002"] <- 1.60201
  allData$InflationMultiplier[allData$Year=="2003"] <- 1.56145
  allData$InflationMultiplier[allData$Year=="2004"] <- 1.53194
  allData$InflationMultiplier[allData$Year=="2005"] <- 1.48776
  allData$InflationMultiplier[allData$Year=="2006"] <- 1.43074
  allData$InflationMultiplier[allData$Year=="2007"] <- 1.40165
  allData$InflationMultiplier[allData$Year=="2008"] <- 1.34412
  allData$InflationMultiplier[allData$Year=="2009"] <- 1.34371
  allData$InflationMultiplier[allData$Year=="2010"] <- 1.30934
  allData$InflationMultiplier[allData$Year=="2011"] <- 1.28831
  allData$InflationMultiplier[allData$Year=="2012"] <- 1.25170
  allData$InflationMultiplier[allData$Year=="2013"] <- 1.23205
  allData$InflationMultiplier[allData$Year=="2014"] <- 1.21290
  allData$InflationMultiplier[allData$Year=="2015"] <- 1.21398
  allData$InflationMultiplier[allData$Year=="2016"] <- 1.19754
  allData$InflationMultiplier[allData$Year=="2017"] <- 1.16833
  allData$InflationMultiplier[allData$Year=="2018"] <- 1.14463
  allData$InflationMultiplier[allData$Year=="2019"] <- 1.12715
  allData$InflationMultiplier[allData$Year=="2020"] <- 1.09980
  allData$InflationMultiplier[allData$Year=="2021"] <- 1.08462
allData$InflationMultiplier <- as.numeric(allData$InflationMultiplier)
allData$`$ of Loans Originated` <- allData$`$ of Loans Originated` * allData$InflationMultiplier
allData$`$ of Disbursements` <- allData$`$ of Disbursements` * allData$InflationMultiplier
allData$`UAGRNTT` <- allData$`UAGRNTT` * allData$InflationMultiplier
allData$`UFLOANT` <- allData$`UFLOANT` * allData$InflationMultiplier

tblMay10 <- aggregate(data=allData, cbind(`$ of Disbursements`, `Recipients`) ~ Year, FUN=sum)
tblMay10$`Average disbursement` <- tblMay10$`$ of Disbursements` / tblMay10$Recipients
ggplot(data=tblMay10, mapping=aes(x=Year, y=`Average disbursement`)) + geom_point(stat="identity") + scale_y_continuous()
ggplot(data=tblMay10, mapping=aes(x=Year, y=`Recipients`)) + geom_point(stat="identity") + scale_y_continuous()

# Quick pulls for the report
tblMay10$`$ of Disbursements`[tblMay10$Year=="2000"] # STAT 6
tblMay10$`$ of Disbursements`[tblMay10$Year=="2016"] # STAT 7

# Texas A&M totals
TexasAM <- allData %>% filter(OPEID %in% c(
  "00363200", # Texas A&M University
  "00363000", # Prairie View A&M University
  "00356500", # Texas A&M University-Commerce
  "00363100", # Tarleton State University
  "00366500", # West Texas A&M University
  "00363900", # Texas A&M University - Kingsville
  "01116100", # Texas A&M University - Corpus Christi
  "00965100", # Texas A&M International University
  "03170300", # Texas A&M University - Texarkana
  "04229500", # Texas A&M University - Central Texas
  "04248500"  # Texas A&M University - San Antonio
))
tblAM <- aggregate(data=TexasAM, `$ of Disbursements` ~ Year, FUN=sum)
tblAM$`$ of Disbursements`[tblAM$Year==2009] # STAT 9
tblAM$`$ of Disbursements`[tblAM$Year==2019] # STAT 10


##################################################################
### Now we aggregate to show disbursements over time by group. ###
##################################################################

# Chart of Parent PLUS disbursements over time, with HBCU breakout 
tbl1 <- aggregate(data=allData, `$ of Disbursements` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
ggplot(data=tbl1, mapping=aes(x=Year, y=`$ of Disbursements`, color=Group)) + geom_bar(stat="identity", fill="white") + ggtitle("Total Parent PLUS Disbursements, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels=scales::dollar_format())

# Chart of Parent PLUS disbursements over time, without HBCU breakout 
tbl1Z <- aggregate(data=allData, `$ of Disbursements` ~ Year + `CONTROL`, FUN=sum) %>% filter(CONTROL %in% c(1, 2, 3))
tbl1Z$Control <- rep(NA, nrow(tbl1Z))
tbl1Z$Control[tbl1Z$CONTROL==1] <- "Public"
tbl1Z$Control[tbl1Z$CONTROL==2] <- "Nonprofit"
tbl1Z$Control[tbl1Z$CONTROL==3] <- "For-profit"
tbl1Z$Control <- as.factor(tbl1Z$Control)
ggplot(data=tbl1Z, mapping=aes(x=Year, y=`$ of Disbursements`, color=`Control`)) + geom_bar(stat="identity", fill="white") + ggtitle("Total Parent PLUS Disbursements, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels=scales::dollar_format()) # FIG 1

# By the way, what's the percentage increase by sector? 
(tbl1Z$`$ of Disbursements`[tbl1Z$CONTROL==1 & tbl1Z$Year==2017] / tbl1Z$`$ of Disbursements`[tbl1Z$CONTROL==1 & tbl1Z$Year==2000]) # Public # STAT 8
(tbl1Z$`$ of Disbursements`[tbl1Z$CONTROL==2 & tbl1Z$Year==2017] / tbl1Z$`$ of Disbursements`[tbl1Z$CONTROL==2 & tbl1Z$Year==2000]) # Nonprofit
(tbl1Z$`$ of Disbursements`[tbl1Z$CONTROL==3 & tbl1Z$Year==2017] / tbl1Z$`$ of Disbursements`[tbl1Z$CONTROL==3 & tbl1Z$Year==2000]) # For-profit 

# Table of HBCUs' share of Parent PLUS disbursements over time 
tbl1X <- reshape2::dcast(data=tbl1, Group ~ Year, value.var="$ of Disbursements")
write.csv(tbl1X, "output03172022-1.csv", row.names=FALSE)
tbl1R <- aggregate(data=allData, `Recipients` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl1Y <- reshape2::dcast(data=tbl1R, Group ~ Year, value.var="Recipients")
write.csv(tbl1Y, "output03172022-2.csv", row.names=FALSE)

##################################################################
### Our next aggregates show the percent change in Parent PLUS ###
### disbursements over time by group.                          ###
##################################################################

# Percent change in Parent PLUS disbursements over time, with HBCU breakout
tbl2 <- tbl1
tbl2$`% change in $ of Disbursements`[tbl2$Group=="For-profits"] <- tbl2$`$ of Disbursements`[tbl2$Group=="For-profits"] / tbl2$`$ of Disbursements`[tbl2$Group=="For-profits" & tbl2$Year=="2000"]
tbl2$`% change in $ of Disbursements`[tbl2$Group=="Private HBCUs"] <- tbl2$`$ of Disbursements`[tbl2$Group=="Private HBCUs"] / tbl2$`$ of Disbursements`[tbl2$Group=="Private HBCUs" & tbl2$Year=="2000"]
tbl2$`% change in $ of Disbursements`[tbl2$Group=="Private Non-HBCUs"] <- tbl2$`$ of Disbursements`[tbl2$Group=="Private Non-HBCUs"] / tbl2$`$ of Disbursements`[tbl2$Group=="Private Non-HBCUs" & tbl2$Year=="2000"]
tbl2$`% change in $ of Disbursements`[tbl2$Group=="Public HBCUs"] <- tbl2$`$ of Disbursements`[tbl2$Group=="Public HBCUs"] / tbl2$`$ of Disbursements`[tbl2$Group=="Public HBCUs" & tbl2$Year=="2000"]
tbl2$`% change in $ of Disbursements`[tbl2$Group=="Public Non-HBCUs"] <- tbl2$`$ of Disbursements`[tbl2$Group=="Public Non-HBCUs"] / tbl2$`$ of Disbursements`[tbl2$Group=="Public Non-HBCUs" & tbl2$Year=="2000"]
ggplot(data=tbl2, mapping=aes(x=Year, y=`% change in $ of Disbursements`, group=Group)) + geom_line(aes(color=Group)) + geom_point() + ggtitle("Percentage Change in Annual Parent PLUS Disbursements, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1))

# Percent change in Parent PLUS disbursements over time, without HBCU breakout
tbl2B <- tbl1Z
tbl2B$`% change in $ of Disbursements`[tbl2B$CONTROL==3] <- tbl2B$`$ of Disbursements`[tbl2B$CONTROL==3] / tbl2B$`$ of Disbursements`[tbl2B$CONTROL==3 & tbl2B$Year=="2000"]
tbl2B$`% change in $ of Disbursements`[tbl2B$CONTROL==2] <- tbl2B$`$ of Disbursements`[tbl2B$CONTROL==2] / tbl2B$`$ of Disbursements`[tbl2B$CONTROL==2 & tbl2B$Year=="2000"]
tbl2B$`% change in $ of Disbursements`[tbl2B$CONTROL==1] <- tbl2B$`$ of Disbursements`[tbl2B$CONTROL==1] / tbl2B$`$ of Disbursements`[tbl2B$CONTROL==1 & tbl2B$Year=="2000"]
tbl2B$CONTROL2 <- ifelse(tbl2B$CONTROL == 1, "Public", 
                         ifelse(tbl2B$CONTROL == 2, "Nonprofit", 
                                ifelse(tbl2B$CONTROL == 3, "For-profit", NA)))
ggplot(data=tbl2B, mapping=aes(x=Year, y=`% change in $ of Disbursements`, group=CONTROL2)) + geom_line(aes(color=CONTROL2)) + geom_point() + ggtitle("Percentage Change in Annual Parent PLUS Disbursements, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1))

#################################################################
### Next we show how the average disbursement changes over    ###
### time.                                                     ###
#################################################################

# Average Parent PLUS disbursements over time, with HBCU breakout
tbl3A <- aggregate(data=allData, `$ of Disbursements` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl3B <- aggregate(data=allData, `Recipients` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl3 <- full_join(x=tbl3A, y=tbl3B, by=c("Year", "Group"))
tbl3$`Average Award Year Loan` <- tbl3$`$ of Disbursements` / tbl3$Recipients
ggplot(data=tbl3, mapping=aes(x=Year, y=`Average Award Year Loan`, group=Group)) + geom_line(aes(color=Group)) + geom_point() + ggtitle("Average Parent PLUS Disbursements, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(limits=c(0, 24000), labels=scales::dollar_format())

# Average Parent PLUS disbursements over time, without HBCU breakout
tbl3C <- aggregate(data=allData, `$ of Disbursements` ~ Year + CONTROL, FUN=sum) %>% filter(CONTROL %in% c(1, 2, 3))
tbl3D <- aggregate(data=allData, `Recipients` ~ Year + CONTROL, FUN=sum) %>% filter(CONTROL %in% c(1, 2, 3))
tbl3E <- full_join(x=tbl3C, y=tbl3D, by=c("Year", "CONTROL"))
tbl3E$CONTROL <- as.factor(tbl3E$CONTROL)
tbl3E$`Average Award Year Loan` <- tbl3E$`$ of Disbursements` / tbl3E$Recipients
ggplot(data=tbl3E, mapping=aes(x=Year, y=`Average Award Year Loan`, group=CONTROL)) + geom_line(aes(color=CONTROL)) + geom_point() + ggtitle("Average Parent PLUS Disbursements, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(limits=c(0, 24000), labels=scales::dollar_format())

# Now with no breakout
tbl3F <- aggregate(data=allData, cbind(`$ of Disbursements`, Recipients) ~ Year, FUN=sum)
tbl3F$`Average disbursement` <- tbl3F$`$ of Disbursements` / tbl3F$Recipients # STAT 16

#################################################################
### We now use the student financial aid data to examine      ###
### Parent PLUS's share of all undergraduate aid.             ###
#################################################################

# Parent PLUS as a share of total financial aid, with HBCU breakout 
allFinAid <- allData %>% filter(Year %in% c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021"))
allFinAid$`Total Undergraduate Grants and Loans` <- allFinAid$UAGRNTT + allFinAid$UFLOANT + allFinAid$`$ of Disbursements`
tbl4A <- aggregate(data=allFinAid, `$ of Disbursements` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl4B <- aggregate(data=allFinAid, `Total Undergraduate Grants and Loans` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl4 <- full_join(x=tbl4A, y=tbl4B, by=c("Year", "Group"))
tbl4$`Parent PLUS's Share of Undergraduate Loans and Grants` <- tbl4$`$ of Disbursements` / tbl4$`Total Undergraduate Grants and Loans`
ggplot(data=tbl4, mapping=aes(x=Year, y=`Parent PLUS's Share of Undergraduate Loans and Grants`, group=Group)) + geom_line(aes(color=Group)) + geom_point() + ggtitle("Parent PLUS's Share of Undergraduate Loans and Grants, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1))

# Parent PLUS as a share of total financial aid, with a different HBCU breakout 
allFinAid2 <- allFinAid
allFinAid2$Group[allFinAid2$HBCU==2] <- "Non-HBCU"
tbl4A.1 <- aggregate(data=allFinAid2, `$ of Disbursements` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl4B.1 <- aggregate(data=allFinAid2, `Total Undergraduate Grants and Loans` ~ Year + Group, FUN=sum) %>% filter(is.na(Group)==FALSE)
tbl4.1 <- full_join(x=tbl4A.1, y=tbl4B.1, by=c("Year", "Group"))
tbl4.1$`Parent PLUS's Share of Undergraduate Loans and Grants` <- tbl4.1$`$ of Disbursements` / tbl4.1$`Total Undergraduate Grants and Loans`
ggplot(data=tbl4.1, mapping=aes(x=Year, y=`Parent PLUS's Share of Undergraduate Loans and Grants`, group=Group)) + geom_line(aes(color=Group)) + geom_point() + ggtitle("Parent PLUS's Share of Undergraduate Loans and Grants, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(lim=c(0, .3), labels = scales::percent_format(accuracy = 1))

# Parent PLUS as a share of total financial aid, without HBCU breakout 
tbl4C <- aggregate(data=allFinAid, `$ of Disbursements` ~ Year + CONTROL, FUN=sum) %>% filter(CONTROL %in% c(1, 2, 3))
tbl4D <- aggregate(data=allFinAid, `Total Undergraduate Grants and Loans` ~ Year + CONTROL, FUN=sum) %>% filter(CONTROL %in% c(1, 2, 3))
tbl4E <- full_join(x=tbl4C, y=tbl4D, by=c("Year", "CONTROL"))
tbl4E$`Parent PLUS's Share of Undergraduate Loans and Grants` <- tbl4E$`$ of Disbursements` / tbl4E$`Total Undergraduate Grants and Loans`
tbl4E$CONTROL <- as.factor(tbl4E$CONTROL)
ggplot(data=tbl4E, mapping=aes(x=Year, y=`Parent PLUS's Share of Undergraduate Loans and Grants`, group=CONTROL)) + geom_line(aes(color=CONTROL)) + geom_point() + ggtitle("Parent PLUS's Share of Undergraduate Loans and Grants, 2000 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1))

#################################################################
### Now I want to do this for all MSI categories.             ###
#################################################################

allFinAid3 <- allFinAid
MSI <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "OPEID", 
  "UNITID",
  "PBI", 
  "ANNHI",
  "TRIBAL", 
  "AANAPII", 
  "HSI", 
  "NANTI"
))
allFinAid3 <- left_join(x=allFinAid3, y=MSI, by="UNITID")
allFinAid3$`Parent PLUS's Share of Undergraduate Loans and Grants` <- allFinAid3$`$ of Disbursements` / allFinAid3$`Total Undergraduate Grants and Loans`

allFinAid.HBCU <- allFinAid3 %>% filter(HBCU==1)
allFinAid.PBI <- allFinAid3 %>% filter(PBI==1)
allFinAid.ANNHI <- allFinAid3 %>% filter(ANNHI==1)
allFinAid.TRIBAL <- allFinAid3 %>% filter(TRIBAL==1)
allFinAid.AANAPII <- allFinAid3 %>% filter(AANAPII==1)
allFinAid.HSI <- allFinAid3 %>% filter(HSI==1)
allFinAid.NANTI <- allFinAid3 %>% filter(NANTI==1)
allFinAid.nonMSI <- allFinAid3 %>% filter((HBCU != 1) & (PBI  != 1) & (ANNHI  != 1) & (TRIBAL  != 1) & (AANAPII  != 1) & (HSI  != 1) & (NANTI  != 1))

allFinAid.HBCU$`MSI Category` <- rep("HBCU", nrow(allFinAid.HBCU))
allFinAid.PBI$`MSI Category` <- rep("PBI", nrow(allFinAid.PBI))
allFinAid.ANNHI$`MSI Category` <- rep("ANNHI", nrow(allFinAid.ANNHI))
allFinAid.TRIBAL$`MSI Category` <- rep("TCU", nrow(allFinAid.TRIBAL))
allFinAid.AANAPII$`MSI Category` <- rep("AANAPII", nrow(allFinAid.AANAPII))
allFinAid.HSI$`MSI Category` <- rep("HSI", nrow(allFinAid.HSI))
allFinAid.NANTI$`MSI Category` <- rep("NANTI", nrow(allFinAid.NANTI))
allFinAid.nonMSI$`MSI Category` <- rep("Not an MSI", nrow(allFinAid.nonMSI))

allFinAid.HBCU <- allFinAid.HBCU %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.PBI <- allFinAid.PBI %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.ANNHI <- allFinAid.ANNHI %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.TRIBAL <- allFinAid.TRIBAL %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.AANAPII <- allFinAid.AANAPII %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.HSI <- allFinAid.HSI %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.NANTI <- allFinAid.NANTI %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)
allFinAid.nonMSI <- allFinAid.nonMSI %>% select(UNITID, Year, `MSI Category`, `$ of Disbursements`, `Total Undergraduate Grants and Loans`)

allFinAid.MSI <- rbind(allFinAid.HBCU, allFinAid.PBI, allFinAid.ANNHI, allFinAid.TRIBAL, allFinAid.AANAPII, allFinAid.HSI, allFinAid.NANTI, allFinAid.nonMSI)

tblMSI <- aggregate(data=allFinAid.MSI, cbind(`$ of Disbursements`, `Total Undergraduate Grants and Loans`) ~ `MSI Category` + Year, FUN=sum)
tblMSI$`Parent PLUS's Share of Undergraduate Loans and Grants` <- tblMSI$`$ of Disbursements` / tblMSI$`Total Undergraduate Grants and Loans`

ggplot(data=tblMSI, mapping=aes(x=Year, y=`Parent PLUS's Share of Undergraduate Loans and Grants`, group=`MSI Category`)) + geom_line(aes(color=`MSI Category`)) + geom_point() + labs(y="Parent PLUS's Share of Undergraduate Loans and Grants") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) # FIGURE 2


#################################################################
### Now we can examine Parent PLUS statistics by institution. ###
#################################################################

# Top institutions for Parent PLUS's share of undergraduate loans and grants
allFinAid$`PLUS share` <- allFinAid$`$ of Disbursements` / allFinAid$`Total Undergraduate Grants and Loans`
tbl5.noMin <- allFinAid %>% filter(Year=="2020") %>% select(INSTNM, `$ of Disbursements`, `Total Undergraduate Grants and Loans`, `PLUS share`) %>% arrange(desc(`PLUS share`)) 
tbl5.5milMin <- tbl5.noMin %>% filter(`$ of Disbursements` > 5000000) # STAT 11

# Top institutions for growth in Parent PLUS's share of undergraduate loans and grants
allFinAid2010 <- allFinAid %>% filter(Year=="2010") %>% select(UNITID, INSTNM, `$ of Disbursements`, `UAGRNTT`, `UFLOANT`, `Total Undergraduate Grants and Loans`, `PLUS share`) %>% filter(is.na(`$ of Disbursements`)==FALSE) %>% filter(is.na(`PLUS share`)==FALSE) 
allFinAid2020 <- allFinAid %>% filter(Year=="2020") %>% select(UNITID, INSTNM, `$ of Disbursements`, `UAGRNTT`, `UFLOANT`, `Total Undergraduate Grants and Loans`, `PLUS share`) %>% filter(is.na(`$ of Disbursements`)==FALSE) %>% filter(is.na(`PLUS share`)==FALSE)

#################################################################
### Now we take the same comparison data but set minimum      ###
### thresholds for Parent PLUS disbursements by institution.  ###
#################################################################

allFinAidComp <- full_join(x=allFinAid2010, y=allFinAid2020, by="UNITID")
allFinAidComp$`Relative % Change, 2010 to 2020` <- ((allFinAidComp$`PLUS share.y` / allFinAidComp$`PLUS share.x`) - 1)
tbl6.relative.500Kmin <- allFinAidComp %>% filter(`$ of Disbursements.x` > 500000) %>% filter(`$ of Disbursements.y` > 500000) %>% arrange(desc(`Relative % Change, 2010 to 2020`)) %>% select(UNITID, INSTNM.x, `$ of Disbursements.x`, `Total Undergraduate Grants and Loans.x`, `PLUS share.x`, INSTNM.y, `$ of Disbursements.y`, `Total Undergraduate Grants and Loans.y`, `PLUS share.y`, `Relative % Change, 2010 to 2020`)

allFinAidComp$`Absolute % Change, 2010 to 2020` <- (allFinAidComp$`PLUS share.y` - allFinAidComp$`PLUS share.x`)
tbl6.absolute.500Kmin <- allFinAidComp %>% filter(`$ of Disbursements.x` > 500000) %>% filter(`$ of Disbursements.y` > 500000) %>% arrange(desc(`Absolute % Change, 2010 to 2020`)) %>% select(UNITID, INSTNM.x, `$ of Disbursements.x`, `Total Undergraduate Grants and Loans.x`, `PLUS share.x`, INSTNM.y, `$ of Disbursements.y`, `Total Undergraduate Grants and Loans.y`, `PLUS share.y`, `Absolute % Change, 2010 to 2020`)

tbl6.relative.5Mmin <- tbl6.relative.500Kmin %>% filter(`$ of Disbursements.x` > 5000000) %>% filter(`$ of Disbursements.y` > 5000000)
tbl6.absolute.5Mmin <- tbl6.absolute.500Kmin %>% filter(`$ of Disbursements.x` > 5000000) %>% filter(`$ of Disbursements.y` > 5000000)

#################################################################
###                                                           ###
###          Section 2: Student Loan Portfolio Data           ###
###                                                           ###
#################################################################

#################################################################
### First we load in the data and ensure that we can tell     ###
### which quarter is which.                                   ###
#################################################################

portfolio <- read.csv("PortfoliobyLoanType.csv", header=TRUE)
portfolio$FiscalQuarter <- paste(portfolio$Federal.Fiscal.Year, portfolio$X, sep=" ")

##################################################################
### Next we format the numbers so that they are expressed in   ###
### 1 or $1 units, not $1,000,000,000 units or 1,000,000 units.###
##################################################################

portfolio$`Stafford Dollars` <- portfolio$Stafford.dollars * 1000000000
portfolio$`Grad PLUS Dollars` <- portfolio$Grad.PLUS.dollars * 1000000000
portfolio$`Parent PLUS Dollars` <- portfolio$Parent.PLUS.dollars * 1000000000
portfolio$`Perkins Dollars` <- portfolio$Parent.PLUS.dollars * 1000000000
portfolio$`Consolidation Dollars` <- portfolio$Consolidation.dollars * 1000000000

portfolio$`Stafford Recipients` <- portfolio$Stafford.recipients * 1000000
portfolio$`Grad PLUS Recipients` <- portfolio$Grad.PLUS.recipients * 1000000
portfolio$`Parent PLUS Recipients` <- portfolio$Parent.PLUS.recipients * 1000000
portfolio$`Perkins Recipients` <- portfolio$Parent.PLUS.recipients * 1000000
portfolio$`Consolidation Recipients` <- portfolio$Consolidation.recipients * 1000000

portfolio$`Parent PLUS Dollars`[portfolio$Federal.Fiscal.Year=="2021" & portfolio$X=="Q4"] # STAT 1
portfolio$`Parent PLUS Recipients`[portfolio$Federal.Fiscal.Year=="2021" & portfolio$X=="Q4"] # STAT 2

#################################################################
### Next we sum up the whole portfolio and express the types  ###
### of loans as shares of the total.                          ###
#################################################################

portfolio$`All Dollars` <- (portfolio$`Stafford Dollars` +
                            portfolio$`Grad PLUS Dollars` +
                            portfolio$`Parent PLUS Dollars` +
                            portfolio$`Perkins Dollars` +
                            portfolio$`Consolidation Dollars`)
portfolio$`Stafford Share of Portfolio` <- portfolio$`Stafford Dollars` / portfolio$`All Dollars`
portfolio$`Grad PLUS Share of Portfolio` <- portfolio$`Grad PLUS Dollars` / portfolio$`All Dollars`
portfolio$`Parent PLUS Share of Portfolio` <- portfolio$`Parent PLUS Dollars` / portfolio$`All Dollars`
portfolio$`Perkins Share of Portfolio` <- portfolio$`Perkins Dollars` / portfolio$`All Dollars`
portfolio$`Consolidation Share of Portfolio` <- portfolio$`Consolidation Dollars` / portfolio$`All Dollars`

#################################################################
### Now we plot the outstanding dollars over time.            ###
#################################################################

portfolio2 <- reshape2::melt(data=portfolio, id.vars="FiscalQuarter", measure.vars=c("Stafford Dollars", "Grad PLUS Dollars", "Parent PLUS Dollars", "Perkins Dollars", "Consolidation Dollars"))
names(portfolio2) <- c("Fiscal Quarter", "Loan Program", "Outstanding Dollars")
ggplot(data=portfolio2, mapping=aes(x=`Fiscal Quarter`, y=`Outstanding Dollars`, color=`Loan Program`)) + geom_bar(stat="identity", fill="white") + ggtitle("Outstanding Dollars in Student Loan Portoflio by Program: 2014 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::dollar_format())

#################################################################
### Next we plot the loan types' shares of the portfolio over ###
### time.                                                     ###
#################################################################

portfolio3 <- reshape2::melt(data=portfolio, id.vars="FiscalQuarter", measure.vars=c("Stafford Share of Portfolio", "Grad PLUS Share of Portfolio", "Parent PLUS Share of Portfolio", "Perkins Share of Portfolio", "Consolidation Share of Portfolio"))
names(portfolio3) <- c("Fiscal Quarter", "Loan Program", "Share of Total Portfolio")
ggplot(data=portfolio3, mapping=aes(x=`Fiscal Quarter`, y=`Share of Total Portfolio`, color=`Loan Program`)) + geom_bar(stat="identity", fill="white") + ggtitle("Oustanding Dollars in Student Loan Portoflio by Program: 2014 to 2021") + theme(axis.text.x = element_text(angle = 45)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1))

#################################################################
### Finally we isolate the Parent PLUS data to easily view    ###
### its share of the portfolio over time.                     ###
#################################################################

portfolio3 %>% filter(`Loan Program`=="Parent PLUS Share of Portfolio") %>% select(`Fiscal Quarter`, `Share of Total Portfolio`)


#################################################################
###                                                           ###
###      Section 3: Total Outstanding PLUS balances           ###
###                                                           ###
#################################################################

#################################################################
### First we load in the institution-level Scorecard data     ###
### and include total Parent PLUS outstanding debt and the    ###
### estimates of undergrads with parents taking out PLUS.     ###
#################################################################

CSI <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM", 
  "HBCU",
  "CONTROL",
  "LPPPLUS_CNT",
  "LPPPLUS_AMT", 
  "PPLUS_PCT_LOW",
  "PPLUS_PCT_HIGH",
  "PPLUS_PCT_LOW_POOLED_SUPP",
  "PPLUS_PCT_HIGH_POOLED_SUPP", 
  "MD_EARN_WNE_P10",
  "MN_EARN_WNE_P10", 
  "HIGHDEG"
)) %>% filter(duplicated(OPEID6)==FALSE)
hd <- fread("hd2020.csv", header=TRUE, select=c("UNITID", "SECTOR"))
CSI <- left_join(x=CSI, y=hd, by="UNITID")

#################################################################
### Next we filter out the schools without data on            ###
### outstanding debt and apply some formatting.               ###
#################################################################

CSI$PPLUS_PCT_LOW_POOLED_SUPP <- as.numeric(CSI$PPLUS_PCT_LOW_POOLED_SUPP)
CSI$PPLUS_PCT_HIGH_POOLED_SUPP <- as.numeric(CSI$PPLUS_PCT_HIGH_POOLED_SUPP)
CSI$PPLUS_PCT_LOW <- as.numeric(CSI$PPLUS_PCT_LOW)
CSI$PPLUS_PCT_HIGH <- as.numeric(CSI$PPLUS_PCT_HIGH)
CSI$MN_EARN_WNE_P10 <- as.numeric(CSI$MN_EARN_WNE_P10)
CSI$LPPPLUS_CNT <- as.numeric(CSI$LPPPLUS_CNT)
CSI$LPPPLUS_AMT <- as.numeric(CSI$LPPPLUS_AMT)
CSI$HIGHDEG <- as.numeric(CSI$HIGHDEG)

CSI$Counter <- rep(1, nrow(CSI))
CSI$PrivacySuppressed <- ifelse(CSI$LPPPLUS_CNT %in% c("NULL", "PrivacySuppressed"), 1, 0)
CSI2 <- CSI %>% filter(PrivacySuppressed == 0) 

#################################################################
### The next lines provide the sector-level totals of         ###
### outstanding debt and borrowers.                           ###
#################################################################

# All institutions 
sum(CSI2$Counter) 
abs(sum(CSI2$Counter) - sum(CSI$Counter))
sum(CSI2$LPPPLUS_CNT, na.rm=TRUE)
sum(CSI2$LPPPLUS_AMT, na.rm=TRUE)
sum(CSI2$LPPPLUS_AMT) / sum(CSI2$LPPPLUS_CNT)

# Public HBCUs
sum(CSI2$Counter[CSI2$HBCU==1 & CSI2$CONTROL==1]) 
abs(sum(CSI2$Counter[CSI2$HBCU==1 & CSI2$CONTROL==1]) - sum(CSI$Counter[CSI$HBCU==1 & CSI$CONTROL==1]))
sum(CSI2$LPPPLUS_CNT[CSI2$HBCU==1 & CSI2$CONTROL==1]) 
sum(CSI2$LPPPLUS_AMT[CSI2$HBCU==1 & CSI2$CONTROL==1])
sum(CSI2$LPPPLUS_AMT[CSI2$HBCU==1 & CSI2$CONTROL==1]) / sum(CSI2$LPPPLUS_CNT[CSI2$HBCU==1 & CSI2$CONTROL==1])

# Private HBCUs
sum(CSI2$Counter[CSI2$HBCU==1 & CSI2$CONTROL==2]) 
abs(sum(CSI2$Counter[CSI2$HBCU==1 & CSI2$CONTROL==2]) - sum(CSI$Counter[CSI$HBCU==1 & CSI$CONTROL==2]))
sum(CSI2$LPPPLUS_CNT[CSI2$HBCU==1 & CSI2$CONTROL==2]) 
sum(CSI2$LPPPLUS_AMT[CSI2$HBCU==1 & CSI2$CONTROL==2])
sum(CSI2$LPPPLUS_AMT[CSI2$HBCU==1 & CSI2$CONTROL==2]) / sum(CSI2$LPPPLUS_CNT[CSI2$HBCU==1 & CSI2$CONTROL==2]) 

# Public four-years: 
sum(CSI2$Counter[CSI2$SECTOR==1], na.rm=TRUE) 
abs(sum(CSI2$Counter[CSI2$SECTOR==1], na.rm=TRUE) - sum(CSI$Counter[CSI$SECTOR==1], na.rm=TRUE))
sum(CSI2$LPPPLUS_CNT[CSI2$SECTOR==1], na.rm=TRUE) 
sum(CSI2$LPPPLUS_AMT[CSI2$SECTOR==1], na.rm=TRUE)
sum(CSI2$LPPPLUS_AMT[CSI2$SECTOR==1], na.rm=TRUE) / sum(CSI2$LPPPLUS_CNT[CSI2$SECTOR==1], na.rm=TRUE)

# Nonprofit four-years: 
sum(CSI2$Counter[CSI2$SECTOR==2], na.rm=TRUE) 
abs(sum(CSI2$Counter[CSI2$SECTOR==2], na.rm=TRUE) - sum(CSI$Counter[CSI$SECTOR==2], na.rm=TRUE))
sum(CSI2$LPPPLUS_CNT[CSI2$SECTOR==2], na.rm=TRUE) 
sum(CSI2$LPPPLUS_AMT[CSI2$SECTOR==2], na.rm=TRUE)
sum(CSI2$LPPPLUS_AMT[CSI2$SECTOR==2], na.rm=TRUE) / sum(CSI2$LPPPLUS_CNT[CSI2$SECTOR==2], na.rm=TRUE)

# For-profit four-years: 
sum(CSI2$Counter[CSI2$SECTOR==3], na.rm=TRUE) 
abs(sum(CSI2$Counter[CSI2$SECTOR==3], na.rm=TRUE) - sum(CSI$Counter[CSI$SECTOR==3], na.rm=TRUE))
sum(CSI2$LPPPLUS_CNT[CSI2$SECTOR==3], na.rm=TRUE) 
sum(CSI2$LPPPLUS_AMT[CSI2$SECTOR==3], na.rm=TRUE)
sum(CSI2$LPPPLUS_AMT[CSI2$SECTOR==3], na.rm=TRUE) / sum(CSI2$LPPPLUS_CNT[CSI2$SECTOR==3], na.rm=TRUE)

#################################################################
### Next we estimate the number of PLUS students at each      ###
### institution.                                              ###
#################################################################

# Where Parent PLUS loans are taken out most often: 
CSI3 <- CSI %>% filter(is.na(PPLUS_PCT_LOW)==FALSE) %>% filter(is.na(PPLUS_PCT_HIGH)==FALSE) %>% filter(is.na(MN_EARN_WNE_P10)==FALSE) %>% filter(LPPPLUS_CNT >= 500) # TABLE A2 # STAT 13

median(CSI3$MN_EARN_WNE_P10, na.rm=TRUE)
median(CSI3$PPLUS_PCT_HIGH, na.rm=TRUE)
median(CSI3$PPLUS_PCT_LOW, na.rm=TRUE)

# Where the average outstanding PLUS balance is greatest  
CSI3.5 <- CSI %>% filter(is.na(LPPPLUS_AMT)==FALSE) %>% filter(is.na(LPPPLUS_CNT)==FALSE) %>% filter(is.na(MN_EARN_WNE_P10)==FALSE) %>% filter(LPPPLUS_CNT >= 500)
CSI3.5$`Average outstanding Parent PLUS balance` <- CSI3.5$LPPPLUS_AMT / CSI3.5$LPPPLUS_CNT # TABLE A3

median(CSI3.5$MN_EARN_WNE_P10, na.rm=TRUE)
median(CSI3.5$`Average outstanding Parent PLUS balance`, na.rm=TRUE)


#################################################################
### Now we take the same data we were using before and rank   ###
### the total amount of loan debt by institution.             ###
#################################################################

# Amounts by institution
CSI4 <-  CSI %>% select(UNITID, 
                        INSTNM, 
                        HBCU,
                        CONTROL,
                        LPPPLUS_CNT,
                        LPPPLUS_AMT, 
                        PPLUS_PCT_LOW,
                        PPLUS_PCT_HIGH)
CSI4$LPPPLUS_CNT <- as.numeric(CSI4$LPPPLUS_CNT)
CSI4$LPPPLUS_AMT <- as.numeric(CSI4$LPPPLUS_AMT)
CSI4$AVGBALANCE <- CSI4$LPPPLUS_AMT / CSI4$LPPPLUS_CNT
CSI4 <- CSI4 %>% arrange(desc(LPPPLUS_AMT)) # STAT 12
write.csv(CSI4, "output-top-institutions-by-PLUS-balance.csv", row.names=FALSE)

#################################################################
###                                                           ###
###     Section 4: CIP Codes Most Associated with PLUS        ###
###                                                           ###
#################################################################

#################################################################
### First we load the program-level Scorecard data and filter ###
### for undergraduate programs.                               ###
#################################################################

CSP <- fread("Most-Recent-Cohorts-Field-of-Study.csv", header=TRUE, select=c(
  "UNITID",                 # Unit ID for institution
  "CIPCODE",                # Classification of Instructional Programs (CIP) code for the field of study
  "CREDLEV",                # Level of credential
  "CONTROL",                # Control of institution 
  "IPEDSCOUNT1",            # Number of awards to all students in year 1 of the pooled debt cohort
  "IPEDSCOUNT2",            # Number of awards to all students in year 2 of the pooled debt cohort
  "DEBT_ALL_PP_EVAL_N",     # Student recipient count for average/median Parent PLUS loan debt disbursed at this institution
  "DEBT_ALL_PP_EVAL_MEAN",  # Average Parent PLUS loan debt disbursed at this institution
  "DEBT_ALL_PP_EVAL_MDN",   # Median Parent PLUS loan debt disbursed at this institution
  "EARN_MDN_HI_2YR"         # Median earnings of graduates working and not enrolled 2 years after completing highest credential
)) %>% filter(CREDLEV <= 3)

#################################################################
### Next we set numeric data as numbers and format the CIPs.  ###
#################################################################

CSP$EARN_MDN_HI_2YR <- as.numeric(CSP$EARN_MDN_HI_2YR)
CSP$DEBT_ALL_PP_EVAL_MEAN <- as.numeric(CSP$DEBT_ALL_PP_EVAL_MEAN)
CSP$IPEDSCOUNT1 <- as.numeric(CSP$IPEDSCOUNT1)
CSP$IPEDSCOUNT2 <- as.numeric(CSP$IPEDSCOUNT2)
CSP$DEBT_ALL_PP_EVAL_N <- as.numeric(CSP$DEBT_ALL_PP_EVAL_N)
CSP$CIPCODE <- as.character(CSP$CIPCODE)

CSP$CIPCODE <- ifelse(nchar(CSP$CIPCODE) == 1, paste("0", CSP$CIPCODE, sep=""), CSP$CIPCODE)
CSP$CIPCODE <- ifelse(nchar(CSP$CIPCODE) == 2, paste("0", CSP$CIPCODE, sep=""), CSP$CIPCODE)
CSP$CIPCODE <- ifelse(nchar(CSP$CIPCODE) == 3, paste("0", CSP$CIPCODE, sep=""), CSP$CIPCODE)

#################################################################
### We now filter for programs that have PLUS data and cohort ###
### totals.                                                   ###
#################################################################

CSP <- CSP %>% filter(IPEDSCOUNT1 != "NULL") %>% filter(IPEDSCOUNT2 != "NULL")
CSP <- CSP %>% filter(DEBT_ALL_PP_EVAL_N != "PrivacySuppressed")
CSP$IPEDSCOUNT <- CSP$IPEDSCOUNT1 + CSP$IPEDSCOUNT2

#################################################################
### Now we take total cohort students and total borrowers     ###
### and aggregate.                                            ###
#################################################################

tbl7a <- aggregate(data=CSP, IPEDSCOUNT ~ CIPCODE + CREDLEV, FUN=sum)
tbl7b <- aggregate(data=CSP, DEBT_ALL_PP_EVAL_N ~ CIPCODE + CREDLEV, FUN=sum)
tbl7 <- inner_join(x=tbl7a, y=tbl7b, by=c("CIPCODE", "CREDLEV"))

median(tbl7$PLUSpct, na.rm=TRUE)

#################################################################
### Now we load in CIP code names and format to match.        ###
#################################################################

allCIP <- fread("CIPCode2010.csv", header=TRUE, select=c(
  "CIPCode", 
  "CIPTitle"
))
allCIP$CIPCode <- as.character(allCIP$CIPCode)
allCIP$CIPCode <- ifelse(nchar(allCIP$CIPCode) == 1, paste("0", allCIP$CIPCode, sep=""), allCIP$CIPCode)
allCIP$CIPCode <- ifelse(nchar(allCIP$CIPCode) == 4, paste("0", allCIP$CIPCode, sep=""), allCIP$CIPCode)
allCIP <- allCIP %>% filter(nchar(allCIP$CIPCode)==5)
allCIP$CIPCODE <- paste(substr(allCIP$CIPCode, 1, 2), substr(allCIP$CIPCode, 4, 5), sep="")
allCIP <- allCIP %>% select(CIPCODE, CIPTitle)

#################################################################
### Next we add in missing rows.                              ###
#################################################################

allCIP <- allCIP %>% add_row(CIPCODE="0100", CIPTitle="Agriculture, General.")
allCIP <- allCIP %>% add_row(CIPCODE="0110", CIPTitle="Food Science and Technology.")
allCIP <- allCIP %>% add_row(CIPCODE="0410", CIPTitle="Real Estate Development.")
allCIP <- allCIP %>% add_row(CIPCODE="1110", CIPTitle="Computer/Information Technology Administration and Management.")
allCIP <- allCIP %>% add_row(CIPCODE="1310", CIPTitle="Special Education and Teaching.")
allCIP <- allCIP %>% add_row(CIPCODE="1410", CIPTitle="Electrical, Electronics, and Communications Engineering.")
allCIP <- allCIP %>% add_row(CIPCODE="1420", CIPTitle="Metallurgical Engineering.")
allCIP <- allCIP %>% add_row(CIPCODE="1500", CIPTitle="Engineering Technologies/Technicians, General.")
allCIP <- allCIP %>% add_row(CIPCODE="1510", CIPTitle="Construction Engineering Technology/Technician.")
allCIP <- allCIP %>% add_row(CIPCODE="2200", CIPTitle="Non-Professional Legal Studies.")
allCIP <- allCIP %>% add_row(CIPCODE="2610", CIPTitle="Pharmacology and Toxicology.")
allCIP <- allCIP %>% add_row(CIPCODE="3000", CIPTitle="Multi-/Interdisciplinary Studies, General.")
allCIP <- allCIP %>% add_row(CIPCODE="3020", CIPTitle="International/Globalization Studies.")
allCIP <- allCIP %>% add_row(CIPCODE="4010", CIPTitle="Materials Sciences.")
allCIP <- allCIP %>% add_row(CIPCODE="4400", CIPTitle="Human Services, General.")
allCIP <- allCIP %>% add_row(CIPCODE="4510", CIPTitle="Political Science and Government.")
allCIP <- allCIP %>% add_row(CIPCODE="4600", CIPTitle="Construction Trades, General.")
allCIP <- allCIP %>% add_row(CIPCODE="5010", CIPTitle="Arts, Entertainment,and Media Management.")
allCIP <- allCIP %>% add_row(CIPCODE="5100", CIPTitle="Health Services/Allied Health/Health Sciences, General.")
allCIP <- allCIP %>% add_row(CIPCODE="5110", CIPTitle="Clinical/Medical Laboratory Science/Research and Allied Professions.")
allCIP <- allCIP %>% add_row(CIPCODE="5120", CIPTitle="Pharmacy, Pharmaceutical Sciences, and Administration.")
allCIP <- allCIP %>% add_row(CIPCODE="5210", CIPTitle="Human Resources Management and Services.")
allCIP <- allCIP %>% add_row(CIPCODE="5220", CIPTitle="Construction Management.")

#################################################################
### Here, we link the CIP names and filter for a minimum      ###
### number of students.                                       ###
#################################################################

tbl7 <- right_join(x=allCIP, y=tbl7, by="CIPCODE")
tbl7$PLUSpct <- tbl7$DEBT_ALL_PP_EVAL_N / tbl7$IPEDSCOUNT
tbl7$CREDLEV2 <- ifelse(tbl7$CREDLEV==1, "Undergraduate Certificate or Diploma", 
                        ifelse(tbl7$CREDLEV==2, "Associate Degree", "Bachelor's Degree"))
tbl7 <- tbl7 %>% filter(IPEDSCOUNT > 200) %>% arrange(desc(PLUSpct)) %>% filter(duplicated(CIPCODE)==FALSE) # TABLE A1
write.csv(tbl7, "output-PLUS-programs-03-23-2022.csv", row.names=FALSE)


#################################################################
###                                                           ###
###          Section 5: PLUS, Earnings, and Race              ###
###                                                           ###
#################################################################

#################################################################
### First we take the program-level Scorecard we had loaded,  ###
### and we will also load in IPEDS data on completions by     ###
### race and filter for undergraduate awards.                 ###
#################################################################

CSP <- CSP %>% filter(is.na(EARN_MDN_HI_2YR) == FALSE)
c2019 <- fread("c2019_a_rv.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "CIPCODE",  # CIP Code -  2020 Classification
  "MAJORNUM", # First or Second Major
  "AWLEVEL",  # Award Level code
  "CTOTALT",  # Grand total
  "CBKAAT",   # Black or African American total
  "CHISPT"    # Hispanic or Latino total
)) %>% filter(AWLEVEL %in% c(1, 2, 3, 4, 5)) %>% filter(MAJORNUM==1) # Bachelor's degree or lower, first major only

#################################################################
### Now we set some of these numeric data as numbers.         ###
#################################################################

c2019$CBKAAT <- as.numeric(c2019$CBKAAT)
c2019$CHISPT <- as.numeric(c2019$CHISPT)
c2019$CTOTALT <- as.numeric(c2019$CTOTALT)

#################################################################
### Now we do the same for 2018 completion data.              ###
#################################################################

c2018 <- fread("c2018_a_rv.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "CIPCODE",  # CIP Code -  2020 Classification
  "MAJORNUM", # First or Second Major
  "AWLEVEL",  # Award Level code
  "CTOTALT",  # Grand total
  "CBKAAT",   # Black or African American total
  "CHISPT"    # Hispanic or Latino total
)) %>% filter(AWLEVEL %in% c(1, 2, 3, 4, 5)) %>% filter(MAJORNUM==1) # Bachelor's degree or lower, first major only
c2018$CBKAAT <- as.numeric(c2018$CBKAAT)
c2018$CHISPT <- as.numeric(c2018$CHISPT)
c2018$CTOTALT <- as.numeric(c2018$CTOTALT)

##################################################################
### Now we join the 2019 and 2018 data and sum awards by race. ###
### We then find the Black and Hispanic shares of awardees.    ###
##################################################################

c20XX <- inner_join(x=c2019, y=c2018, by=c("UNITID", "CIPCODE", "AWLEVEL"))
c20XX$CBKAAT <- c20XX$CBKAAT.x + c20XX$CBKAAT.y
c20XX$CHISPT <- c20XX$CHISPT.x + c20XX$CHISPT.y
c20XX$CTOTALT <- c20XX$CTOTALT.x + c20XX$CTOTALT.y
c20XX$CREDLEV <- ifelse(c20XX$AWLEVEL==5, 3, # If bachelor's, set to 3
                        ifelse(c20XX$AWLEVEL==3, 2, # If associate's, set to 2
                               1)) # If certificate, set to 1 
c20XX$BlackShare <- c20XX$CBKAAT / c20XX$CTOTALT
c20XX$HispanicShare <- c20XX$CHISPT / c20XX$CTOTALT

#################################################################
### Next we format the CIP names.                             ###
#################################################################

c20XX$CIPCODE <- as.character(c20XX$CIPCODE)
c20XX$CIPCODE <- as.character(c20XX$CIPCODE)
c20XX$CIPCODE <- ifelse(nchar(c20XX$CIPCODE) == 1, paste("0", c20XX$CIPCODE, sep=""), c20XX$CIPCODE)
c20XX$CIPCODE <- ifelse(nchar(c20XX$CIPCODE) == 4, paste("0", c20XX$CIPCODE, sep=""), c20XX$CIPCODE)
c20XX$CIPCODE <- ifelse(nchar(c20XX$CIPCODE) == 6, paste("0", c20XX$CIPCODE, sep=""), c20XX$CIPCODE)
c20XX$CIPCODE <- paste(substr(c20XX$CIPCODE, 1, 2), substr(c20XX$CIPCODE, 4, 5), sep="")

#################################################################
### Now we simplify the data set we are working with and link ###
### with the Parent PLUS data on earnings. We then filter for ###
### a minimum number of awards and those with PLUS data.      ###
#################################################################

c20XX <- c20XX %>% select(UNITID, CIPCODE, CREDLEV, CBKAAT, CHISPT, CTOTALT, BlackShare, HispanicShare)
c20XX$UNITID <- as.character(c20XX$UNITID)
CSP <- inner_join(x=CSP, y=c20XX, by=c("UNITID", "CIPCODE", "CREDLEV"))
CSP <- right_join(x=allCIP, y=CSP, by="CIPCODE")
CSP <- CSP %>% filter(CTOTALT > 100)
CSP <- CSP %>% filter(is.na(DEBT_ALL_PP_EVAL_MEAN)==FALSE)

#################################################################
### We now calculate the ratio of PLUS borrowers to awardees. ###
#################################################################

CSP$`PLUS per award` <- CSP$DEBT_ALL_PP_EVAL_N / CSP$IPEDSCOUNT

#################################################################
### Next we separate the data by credential level.            ###
#################################################################

CSP.Bachelors <- CSP %>% filter(CREDLEV==3)
CSP.Associate <- CSP %>% filter(CREDLEV==2)
CSP.Certificate <- CSP %>% filter(CREDLEV==1)

#################################################################
### Now, for each of the credential-level datasets, we rank   ###
### programs by their share of awardees who are Black and     ###
### Hispanic.                                                 ###
#################################################################

# Certificates:
CSP.Certificate$BlackRank <- rank(CSP.Certificate$BlackShare, na.last=TRUE, ties.method="average")
CSP.Certificate$HispanicRank <- rank(CSP.Certificate$HispanicShare, na.last=TRUE, ties.method="average")
CSP.Certificate.Top100Black <- CSP.Certificate %>% filter(BlackRank >= (nrow(CSP.Certificate) - 100))
CSP.Certificate.Top100Hispanic <- CSP.Certificate %>% filter(HispanicRank >= (nrow(CSP.Certificate) - 100))

# Associate's: 
CSP.Associate$BlackRank <- rank(CSP.Associate$BlackShare, na.last=TRUE, ties.method="average")
CSP.Associate$HispanicRank <- rank(CSP.Associate$HispanicShare, na.last=TRUE, ties.method="average")
CSP.Associate.Top100Black <- CSP.Associate %>% filter(BlackRank >= (nrow(CSP.Associate) - 100))
CSP.Associate.Top100Hispanic <- CSP.Associate %>% filter(HispanicRank >= (nrow(CSP.Associate) - 100))

# Bachelor's: 
CSP.Bachelors$BlackRank <- rank(CSP.Bachelors$BlackShare, na.last=TRUE, ties.method="average")
CSP.Bachelors$HispanicRank <- rank(CSP.Bachelors$HispanicShare, na.last=TRUE, ties.method="average")
CSP.Bachelors.Top100Black <- CSP.Bachelors %>% filter(BlackRank >= (nrow(CSP.Bachelors) - 100))
CSP.Bachelors.Top100Hispanic <- CSP.Bachelors %>% filter(HispanicRank >= (nrow(CSP.Bachelors) - 100))

#################################################################
### Now we can go in and make charts of PLUS borrowing,       ###
### earnings, and race.                                       ###
#################################################################

# Certificate, top 100 Black highlighted 
ggplot(data=CSP.Certificate, mapping=aes(x=DEBT_ALL_PP_EVAL_MEAN, y=EARN_MDN_HI_2YR)) + geom_point(alpha = 0.3) + geom_point(data=CSP.Certificate.Top100Black, alpha=0.8, color='#E69F00') + labs(x="Average Parent PLUS amount borrowed", y="Median earnings 2 years after program completion", title="Parent PLUS borrowing and median earnings: Certificate programs", subtitle="Top 100 certificate programs by Black share of completers highlighted yellow") + scale_y_continuous(labels=scales::dollar_format()) + scale_x_continuous(labels=scales::dollar_format()) 

# Certificate, top 100 Hispanic highlighted 
ggplot(data=CSP.Certificate, mapping=aes(x=DEBT_ALL_PP_EVAL_MEAN, y=EARN_MDN_HI_2YR)) + geom_point(alpha = 0.3) + geom_point(data=CSP.Certificate.Top100Hispanic, alpha=0.8, color='#00FF00') + labs(x="Average Parent PLUS amount borrowed", y="Median earnings 2 years after program completion", title="Parent PLUS borrowing and median earnings: Certificate programs", subtitle="Top 100 certificate programs by Hispanic/Latino share of completers highlighted green") + scale_y_continuous(labels=scales::dollar_format()) + scale_x_continuous(labels=scales::dollar_format()) 

# Associate, top 100 Black highlighted 
ggplot(data=CSP.Associate, mapping=aes(x=DEBT_ALL_PP_EVAL_MEAN, y=EARN_MDN_HI_2YR)) + geom_point(alpha = 0.3) + geom_point(data=CSP.Associate.Top100Black, alpha=0.8, color='#E69F00') + labs(x="Average Parent PLUS amount borrowed", y="Median earnings 2 years after program completion", title="Parent PLUS borrowing and median earnings: Associate programs", subtitle="Top 100 associate programs by Black share of completers highlighted yellow") + scale_y_continuous(labels=scales::dollar_format()) + scale_x_continuous(labels=scales::dollar_format()) 

# Associate, top 100 Hispanic highlighted 
ggplot(data=CSP.Associate, mapping=aes(x=DEBT_ALL_PP_EVAL_MEAN, y=EARN_MDN_HI_2YR)) + geom_point(alpha = 0.3) + geom_point(data=CSP.Associate.Top100Hispanic, alpha=0.8, color='#00FF00') + labs(x="Average Parent PLUS amount borrowed", y="Median earnings 2 years after program completion", title="Parent PLUS borrowing and median earnings: Associate programs", subtitle="Top 100 associate programs by Hispanic/Latino share of completers highlighted green") + scale_y_continuous(labels=scales::dollar_format()) + scale_x_continuous(labels=scales::dollar_format())

# Bachelors, top 100 Black highlighted 
ggplot(data=CSP.Bachelors, mapping=aes(x=DEBT_ALL_PP_EVAL_MEAN, y=EARN_MDN_HI_2YR)) + geom_point(alpha = 0.3) + geom_point(data=CSP.Bachelors.Top100Black, alpha=0.8, color='#E69F00') + labs(x="Average Parent PLUS amount borrowed", y="Median earnings 2 years after program completion", title="Parent PLUS borrowing and median earnings: Bachelor's programs", subtitle="Top 100 bachelor's programs by Black share of completers highlighted yellow") + scale_y_continuous(labels=scales::dollar_format()) + scale_x_continuous(labels=scales::dollar_format()) 

# Bachelors, top 100 Hispanic highlighted 
ggplot(data=CSP.Bachelors, mapping=aes(x=DEBT_ALL_PP_EVAL_MEAN, y=EARN_MDN_HI_2YR)) + geom_point(alpha = 0.3) + geom_point(data=CSP.Bachelors.Top100Hispanic, alpha=0.8, color='#00FF00') + labs(x="Average Parent PLUS amount borrowed", y="Median earnings 2 years after program completion", title="Parent PLUS borrowing and median earnings: Bachelor's programs", subtitle="Top 100 bachelor's programs by Hispanic/Latino share of completers highlighted green") + scale_y_continuous(labels=scales::dollar_format()) + scale_x_continuous(labels=scales::dollar_format())

#################################################################
### Lastly, we take the correlations of PLUS and earnings.    ###
#################################################################

cor(x=CSP.Bachelors$`PLUS per award`, y=CSP.Bachelors$EARN_MDN_HI_2YR)
cor(x=CSP.Associate$`PLUS per award`, y=CSP.Associate$EARN_MDN_HI_2YR)
cor(x=CSP.Certificate$`PLUS per award`, y=CSP.Certificate$EARN_MDN_HI_2YR)


#################################################################
###                                                           ###
###       Section 6: Analysis of Low-SES at UMBC              ###
###                                                           ###
#################################################################


#################################################################
### First we load in student financial aid data from 2009,    ###
### filter for UMBC, and format it.                           ###
#################################################################

sfa0910 <- fread("sfa0910_rv.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "SCUGRAD",  # Total number of undergraduates - financial aid cohort
  "UPGRNTN",  # Number of undergraduate students awarded Pell grants
  "UPGRNTP",  # Percent of undergraduate students awarded Pell grants
  "GRN4N12",  # Number in income level (0-30,000), 2009-10
  "GRN4N22",  # Number in income level (30,001-48,000), 2009-10
  "GRN4N32",  # Number in income level (48,001-75,000), 2009-10
  "GRN4N42",  # Number in income level (75,001-110,000), 2009-10
  "GRN4N52"   # Number in income level (110,001 or more), 2009-10
)) %>% filter(UNITID=="163268")
sfa0910$GRN4N12 <- as.numeric(sfa0910$GRN4N12)
sfa0910$GRN4N22 <- as.numeric(sfa0910$GRN4N22)
sfa0910$GRN4N32 <- as.numeric(sfa0910$GRN4N32)
sfa0910$GRN4N42 <- as.numeric(sfa0910$GRN4N42)
sfa0910$GRN4N52 <- as.numeric(sfa0910$GRN4N52)
sfa0910$GRN4N12[is.na(sfa0910$GRN4N12)] <- 0
sfa0910$GRN4N22[is.na(sfa0910$GRN4N22)] <- 0
sfa0910$GRN4N32[is.na(sfa0910$GRN4N32)] <- 0
sfa0910$GRN4N42[is.na(sfa0910$GRN4N42)] <- 0
sfa0910$GRN4N52[is.na(sfa0910$GRN4N52)] <- 0

#################################################################
### Now we define the percentage of students who are low-SES. ###
#################################################################

sfa0910$PellPct <- sfa0910$UPGRNTN / sfa0910$SCUGRAD
sfa0910$LowIncPct <- sfa0910$GRN4N12 / (sfa0910$GRN4N12 + sfa0910$GRN4N22 + sfa0910$GRN4N32 + sfa0910$GRN4N42 + sfa0910$GRN4N52)

#################################################################
### Now we do the same for data from 2019.                    ###
#################################################################

sfa1920 <- fread("sfa1920.csv", header=TRUE, select=c(
  "UNITID",   # Unique identification number of the institution
  "SCUGRAD",  # Total number of undergraduates - financial aid cohort
  "UPGRNTN",  # Number of undergraduate students awarded Pell grants
  "UPGRNTP",  # Percent of undergraduate students awarded Pell grants
  "GRN4N12",  # Number in income level (0-30,000), 2009-10
  "GRN4N22",  # Number in income level (30,001-48,000), 2009-10
  "GRN4N32",  # Number in income level (48,001-75,000), 2009-10
  "GRN4N42",  # Number in income level (75,001-110,000), 2009-10
  "GRN4N52"   # Number in income level (110,001 or more), 2009-10
)) %>% filter(UNITID=="163268")
sfa1920$GRN4N12 <- as.numeric(sfa1920$GRN4N12)
sfa1920$GRN4N22 <- as.numeric(sfa1920$GRN4N22)
sfa1920$GRN4N32 <- as.numeric(sfa1920$GRN4N32)
sfa1920$GRN4N42 <- as.numeric(sfa1920$GRN4N42)
sfa1920$GRN4N52 <- as.numeric(sfa1920$GRN4N52)
sfa1920$GRN4N12[is.na(sfa1920$GRN4N12)] <- 0
sfa1920$GRN4N22[is.na(sfa1920$GRN4N22)] <- 0
sfa1920$GRN4N32[is.na(sfa1920$GRN4N32)] <- 0
sfa1920$GRN4N42[is.na(sfa1920$GRN4N42)] <- 0
sfa1920$GRN4N52[is.na(sfa1920$GRN4N52)] <- 0
sfa1920$PellPct <- sfa1920$UPGRNTN / sfa1920$SCUGRAD
sfa1920$LowIncPct <- sfa1920$GRN4N12 / (sfa1920$GRN4N12 + sfa1920$GRN4N22 + sfa1920$GRN4N32 + sfa1920$GRN4N42 + sfa1920$GRN4N52)

#################################################################
### Now we just merge the data.                               ###
#################################################################

sfaUMBC <- full_join(x=sfa0910, y=sfa1920, by="UNITID")


#################################################################
###                                                           ###
### Section 7: Parent PLUS borrowing vs State appropriations  ###
###                                                           ###
#################################################################

#################################################################
### First we load in NPSAS data on PLUS borrowing by state    ###
### four-year sector and SHEEO data on state appropriations.  ###
### Then we chart the relationship.                           ###
#################################################################

statePLUS <- read.csv("PLUS by State.csv", header=TRUE)
stateApprops <- read.csv("Approps by State.csv", header=TRUE)
states <- left_join(x=statePLUS, y=stateApprops, by="State")
ggplot(data=states, mapping=aes(x=Four.Year.Education.Appropriations.per.FTE, y=Percent)) + geom_point() + geom_smooth(method=lm, se=FALSE) + labs(x="Four-year education appropriations per FTE", y="Percent of public four-year students receiving Parent PLUS") + scale_y_continuous(labels=scales::percent_format()) + scale_x_continuous(labels=scales::dollar_format())

#################################################################
### Now we do the same for direct subsidized/unsubsidized     ###
### loans at public four-years.                               ###
#################################################################

stateSubAndUnsub <- read.csv("Sub and unsub loans by State.csv", header=TRUE) # NPSAS table retrieval number: uyyouw 
states2 <- left_join(x=stateSubAndUnsub, y=stateApprops, by="State")
ggplot(data=states2, mapping=aes(x=Four.Year.Education.Appropriations.per.FTE, y=Percent)) + geom_point() + geom_smooth(method=lm, se=FALSE) + labs(x="Four-year education appropriations per FTE", y="Percent of public four-year students receiving Direct Subsidized or Unsubsidized Loan") + scale_y_continuous(lim=c(0, .8), labels=scales::percent_format()) + scale_x_continuous(labels=scales::dollar_format())

#################################################################
### Now we do the same just for direct subsidized loans at    ###
### public four-years.                                        ###
#################################################################

stateSub <- read.csv("Sub loans by State.csv", header=TRUE) # NPSAS table retrieval number: jjiyry 
states3 <- left_join(x=stateSub, y=stateApprops, by="State")
ggplot(data=states3, mapping=aes(x=Four.Year.Education.Appropriations.per.FTE, y=Percent)) + geom_point() + geom_smooth(method=lm, se=FALSE) + labs(x="Four-year education appropriations per FTE", y="Percent of public four-year students receiving Direct SubsidizedLoan") + scale_y_continuous(lim=c(0, .8), labels=scales::percent_format()) + scale_x_continuous(labels=scales::dollar_format())


#################################################################
###                                                           ###
###      Section 8: Dollar-based repayment rates (DBRR)       ###
###                                                           ###
#################################################################

##################################################################
### First we load in the institution-level Scorecard data with ###
### the the repayment rates in the 1, 4, 5, 10, and 20 year    ###
### cohorts.                                                   ###
#################################################################

CSI7 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "INSTNM", 
  "OPEID6",
  "HBCU",
  "CONTROL",
  "DBRR1_PP_UG_N", 
  "DBRR1_PP_UG_RT",
  "DBRR4_PP_UG_N", 
  "DBRR4_PP_UG_RT",
  "DBRR5_PP_UG_N", 
  "DBRR5_PP_UG_RT",
  "DBRR10_PP_UG_N", 
  "DBRR10_PP_UG_RT",
  "DBRR20_PP_UG_N", 
  "DBRR20_PP_UG_RT"
))  %>% filter(duplicated(OPEID6)==FALSE) # 5,289

#################################################################
### Next we filter out schools that lack complete data.       ###
#################################################################

CSI7 <- CSI7 %>% filter(DBRR1_PP_UG_N != "PrivacySuppressed") %>% filter(DBRR1_PP_UG_N != "NULL") # 2,841
CSI7 <- CSI7 %>% filter(DBRR4_PP_UG_N != "PrivacySuppressed") %>% filter(DBRR4_PP_UG_N != "NULL") # 2,515
CSI7 <- CSI7 %>% filter(DBRR5_PP_UG_N != "PrivacySuppressed") %>% filter(DBRR5_PP_UG_N != "NULL") # 2,515
CSI7 <- CSI7 %>% filter(DBRR10_PP_UG_N != "PrivacySuppressed") %>% filter(DBRR10_PP_UG_N != "NULL") # 2,232
CSI7 <- CSI7 %>% filter(DBRR20_PP_UG_N != "PrivacySuppressed") %>% filter(DBRR20_PP_UG_N != "NULL") # 1,827

#################################################################
### Now we apply minimum cohort thresholds per school.        ###
#################################################################

CSI7$DBRR1_PP_UG_N <- as.numeric(CSI7$DBRR1_PP_UG_N)
CSI7 <- CSI7 %>% filter(DBRR1_PP_UG_N >= 50) # 2,390 
CSI7$DBRR4_PP_UG_N <- as.numeric(CSI7$DBRR4_PP_UG_N)
CSI7 <- CSI7 %>% filter(DBRR4_PP_UG_N >= 50) # 2,317
CSI7$DBRR5_PP_UG_N <- as.numeric(CSI7$DBRR5_PP_UG_N)
CSI7 <- CSI7 %>% filter(DBRR5_PP_UG_N >= 50) # 2,317
CSI7$DBRR10_PP_UG_N <- as.numeric(CSI7$DBRR10_PP_UG_N)
CSI7 <- CSI7 %>% filter(DBRR10_PP_UG_N >= 50) # 2,218
CSI7$DBRR20_PP_UG_N <- as.numeric(CSI7$DBRR20_PP_UG_N)
CSI7 <- CSI7 %>% filter(DBRR20_PP_UG_N >= 50) # 1,875

#################################################################
### Now we have to convert the data into long-form.           ###
#################################################################

DBRR1 <- CSI7 %>% select(UNITID, DBRR1_PP_UG_RT)
names(DBRR1) <- c("UNITID", "DBRR_PP_UG_RT")
DBRR1$`Years Since Repayment Start` <- rep(1, nrow(DBRR1))

DBRR4 <- CSI7 %>% select(UNITID, DBRR4_PP_UG_RT)
names(DBRR4) <- c("UNITID", "DBRR_PP_UG_RT")
DBRR4$`Years Since Repayment Start` <- rep(4, nrow(DBRR4))

DBRR5 <- CSI7 %>% select(UNITID, DBRR5_PP_UG_RT)
names(DBRR5) <- c("UNITID", "DBRR_PP_UG_RT")
DBRR5$`Years Since Repayment Start` <- rep(5, nrow(DBRR5))

DBRR10 <- CSI7 %>% select(UNITID, DBRR10_PP_UG_RT)
names(DBRR10) <- c("UNITID", "DBRR_PP_UG_RT")
DBRR10$`Years Since Repayment Start` <- rep(10, nrow(DBRR10))

DBRR20 <- CSI7 %>% select(UNITID, DBRR20_PP_UG_RT)
names(DBRR20) <- c("UNITID", "DBRR_PP_UG_RT")
DBRR20$`Years Since Repayment Start` <- rep(20, nrow(DBRR20))

#################################################################
### Now we make rows for the years not equal to 1, 4, 5, 10,  ###
### or 20 for the benefit of our charts.                      ###
#################################################################

DBRR2 <- CSI7 %>% select(UNITID)
DBRR3 <- CSI7 %>% select(UNITID)
# DBRR4 <- CSI7 %>% select(UNITID)
# DBRR5 <- CSI7 %>% select(UNITID)
DBRR6 <- CSI7 %>% select(UNITID)
DBRR7 <- CSI7 %>% select(UNITID)
DBRR8 <- CSI7 %>% select(UNITID)
DBRR9 <- CSI7 %>% select(UNITID)
# DBRR10 <- CSI7 %>% select(UNITID)
DBRR11 <- CSI7 %>% select(UNITID)
DBRR12 <- CSI7 %>% select(UNITID)
DBRR13 <- CSI7 %>% select(UNITID)
DBRR14 <- CSI7 %>% select(UNITID)
DBRR15 <- CSI7 %>% select(UNITID)
DBRR16 <- CSI7 %>% select(UNITID)
DBRR17 <- CSI7 %>% select(UNITID)
DBRR18 <- CSI7 %>% select(UNITID)
DBRR19 <- CSI7 %>% select(UNITID)
DBRR2$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR2))
DBRR3$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR3))
# DBRR4$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR4))
# DBRR5$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR5))
DBRR6$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR6))
DBRR7$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR7))
DBRR8$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR8))
DBRR9$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR9))
# DBRR10$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR10))
DBRR11$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR11))
DBRR12$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR12))
DBRR13$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR13))
DBRR14$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR14))
DBRR15$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR15))
DBRR16$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR16))
DBRR17$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR17))
DBRR18$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR18))
DBRR19$DBRR_PP_UG_RT <- rep(NA, nrow(DBRR19))
DBRR2$`Years Since Repayment Start` <- rep(2, nrow(DBRR2))
DBRR3$`Years Since Repayment Start` <- rep(3, nrow(DBRR3))
# DBRR4$`Years Since Repayment Start` <- rep(4, nrow(DBRR4))
# DBRR5$`Years Since Repayment Start` <- rep(5, nrow(DBRR5))
DBRR6$`Years Since Repayment Start` <- rep(6, nrow(DBRR6))
DBRR7$`Years Since Repayment Start` <- rep(7, nrow(DBRR7))
DBRR8$`Years Since Repayment Start` <- rep(8, nrow(DBRR8))
DBRR9$`Years Since Repayment Start` <- rep(9, nrow(DBRR9))
# DBRR10$`Years Since Repayment Start` <- rep(10, nrow(DBRR10))
DBRR11$`Years Since Repayment Start` <- rep(11, nrow(DBRR11))
DBRR12$`Years Since Repayment Start` <- rep(12, nrow(DBRR12))
DBRR13$`Years Since Repayment Start` <- rep(13, nrow(DBRR13))
DBRR14$`Years Since Repayment Start` <- rep(14, nrow(DBRR14))
DBRR15$`Years Since Repayment Start` <- rep(15, nrow(DBRR15))
DBRR16$`Years Since Repayment Start` <- rep(16, nrow(DBRR16))
DBRR17$`Years Since Repayment Start` <- rep(17, nrow(DBRR17))
DBRR18$`Years Since Repayment Start` <- rep(18, nrow(DBRR18))
DBRR19$`Years Since Repayment Start` <- rep(19, nrow(DBRR19))

#################################################################
### Now we bind all these together into one long data frame.  ###
### We then add basic information about the schools back in.  ### 
#################################################################

DBRR <- rbind(DBRR1, DBRR2, DBRR3, DBRR4, DBRR5, 
              DBRR6, DBRR7, DBRR8, DBRR9, DBRR10, 
              DBRR11, DBRR12, DBRR13, DBRR14, DBRR15, 
              DBRR16, DBRR17, DBRR18, DBRR19, DBRR20)
DBRR$DBRR_PP_UG_RT <- as.numeric(DBRR$DBRR_PP_UG_RT)
CSI7names <- CSI7 %>% select(UNITID, INSTNM, HBCU, CONTROL)
DBRR <- right_join(x=CSI7names, y=DBRR, by="UNITID")

#################################################################
### At this point, filters can be made to view certain        ###
### institutions. One of these lines allows you to see the    ###
### repayment charts of five random institutions.             ###
#################################################################

DBRRexample <- DBRR %>% filter(INSTNM %in% sample(DBRR$INSTNM, 5))
# DBRRexample <- DBRR %>% filter((HBCU==1) & (CONTROL==2))

#################################################################
### Now we generate the chart.                                ###
#################################################################

DBRRexample <- na.omit(DBRRexample)
ggplot(data=DBRRexample, mapping=aes(x=`Years Since Repayment Start`, y=DBRR_PP_UG_RT, color=INSTNM)) + geom_line() + geom_point() + scale_y_continuous(limits=c(0, 1.5)) + scale_x_continuous(breaks=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)) + labs(title = "Ratio of outstanding Parent PLUS balance to original disbursements: 1, 4, 5, 10, and 20-year cohorts", subtitle = "Minimum 50 borrowers per cohort", y = "Ratio of outstanding balance to original disbursement")


#################################################################
###                                                           ###
###   Section 9: Calculating how state investment has fallen  ###
###                                                           ###
#################################################################

#################################################################
### First we load in the data from SHEEO.                     ###
#################################################################

SHEF <- fread("SHEEO_SHEF_FY20_Report_Data.csv", header=TRUE, select=c(
  "State", 
  "FY", 
  "CPI (Inflation) Adjustment", 
  "Total State Support", 
  "Total State and Local Support", 
  "State Tax Appropriations",
  "Gross FTE Enrollment", 
  "Education Appropriations"
)) %>% filter(State != "U.S.")

#################################################################
### Next we adjust for inflation.                             ###
#################################################################

# In the CSV I replaced all "$-" values with 0s. 
SHEF$`Adjusted Total State and Local Support` <- SHEF$`Total State and Local Support` / SHEF$`CPI (Inflation) Adjustment`
SHEF$`Adjusted Education Appropriations` <- SHEF$`Education Appropriations` / SHEF$`CPI (Inflation) Adjustment`
SHEF$`Adjusted State Tax Appropriations` <- SHEF$`State Tax Appropriations` / SHEF$`CPI (Inflation) Adjustment`

#################################################################
### Next we load in historical data on enrollment from NCES.  ###
#################################################################

# NCES Digest of Education Statistics -- Table 307.10 -- Public institutions only
NCESFTE <- read.csv("tabn30710.csv", header=TRUE) %>% filter(Year >= 1979)
NCESFTE$Year <- NCESFTE$Year + 1 # This is to reflect the fact that we're looking at fall semester enrollment 
names(NCESFTE) <- c("FY", "Total FTE enrollment", "Four-year FTE enrollment", "Two-year FTE enrollment")

#################################################################
### Now we take the sums of appropriations and FTE enrollment ###
### over time and plot charts.                                ###
#################################################################

tbl9A <- aggregate(data=SHEF, `Adjusted Education Appropriations` ~ FY, FUN=sum)
tbl9B <- aggregate(data=NCESFTE, `Total FTE enrollment` ~ FY, FUN=sum)
tbl9C <- full_join(x=tbl9A, y=tbl9B, by="FY")
tbl9C$`Adjusted Education Appropriations per Public FTE` <- tbl9C$`Adjusted Education Appropriations` / tbl9C$`Total FTE enrollment`
ggplot(data=tbl9C, mapping=aes(x=FY, y=`Adjusted Education Appropriations per Public FTE`)) + geom_line()

tbl9D <- aggregate(data=SHEF, `Adjusted State Tax Appropriations` ~ FY, FUN=sum)
tbl9E <- full_join(x=tbl9D, y=tbl9B, by="FY") %>% filter(FY >= 2000)
tbl9E$`Adjusted State Tax Appropriations per Public FTE` <- tbl9E$`Adjusted State Tax Appropriations` / tbl9E$`Total FTE enrollment`
ggplot(data=tbl9E, mapping=aes(x=FY, y=`Adjusted State Tax Appropriations per Public FTE`)) + geom_line()


#################################################################
###                                                           ###
###     Section 10: Family-Workforce Data from the PSID       ###
###                                                           ###
#################################################################

#################################################################
### First we load in the data from the PSID.                  ###
#################################################################

PSID <- read.csv("J305313.csv", header=TRUE)
names(PSID) <- c("Release number 1980", 
                 "Interview Number 1980", 
                 "Age of youngest child 1980", 
                 "Head employment status 1980", # We would like to know about 
                 # what you do--are you (HEAD) working now, looking for work, 
                 # retired, a student, (a housewife), or what?
                 "Spouse employment status 1980", # We would like to know about 
                 # what your (Wife/friend) does--is she working now, looking for 
                 # work, retired, a housewife, or what?
                 "Marital status 1980", # Are you married, single, widowed, 
                 # divorced, or separated?
                 "Ignore this one",
                 "Family weight 1980",
                 "Release Number 2019",
                 "Interview Number 2019", 
                 "Age of youngest child 2019", 
                 "Marital status 2019", # Are (you/Reference Person) married, 
                 # widowed, divorced, separated, or have you never been married?
                 "Head employment status 2019", #  We would like to know about 
                 # what (you do/Reference Person does) -- (are you/is Reference 
                 # Person) working now, looking for work, retired, keeping 
                 # house, a student, or what?
                 "Spouse employment status 2019", # We would like to know about
                 # what (you do/[Spouse/Partner] does)--(are you/is 
                 # [Spouse/Partner]) working now, looking for work, retired, 
                 # keeping house, a student, or what?
                 "Ignore this one too", 
                 "Family weight 2019"
                 )

#################################################################
### Now we separate the dataset into two based on year.       ###
#################################################################

# Total PSID file: 14,973 files 
PSID1980 <- PSID %>% filter(is.na(`Family weight 1980`)==FALSE) # 6,533
PSID2019 <- PSID %>% filter(is.na(`Family weight 2019`)==FALSE) # 9,569

###################################################################
### Next we filter for married families with children under 18. ###
###################################################################

PSID1980.married.withKids <- PSID1980 %>% filter(`Marital status 1980` == 1) %>% filter(`Age of youngest child 1980` %in% c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)) # 2,419
PSID2019.married.withKids <- PSID2019 %>% filter(`Marital status 2019` == 1) %>% filter(`Age of youngest child 2019` %in% c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)) # 2,010 

#################################################################
### Now we assign variables to tell us whether the spouses    ###
### in the workforce, and we mark when a family is a one-     ###
### breadwinner household.                                    ###
#################################################################

PSID1980.married.withKids$Spouse1Workforce <- ifelse(PSID1980.married.withKids$`Head employment status 1980` %in% c(1, 2, 3), 1, 0)
PSID1980.married.withKids$Spouse2Workforce <- ifelse(PSID1980.married.withKids$`Spouse employment status 1980` %in% c(1, 2, 3), 1, 0)
PSID2019.married.withKids$Spouse1Workforce <- ifelse(PSID2019.married.withKids$`Head employment status 2019` %in% c(1, 2, 3), 1, 0)
PSID2019.married.withKids$Spouse2Workforce <- ifelse(PSID2019.married.withKids$`Spouse employment status 2019` %in% c(1, 2, 3), 1, 0)

PSID1980.married.withKids$OneBreadwinner <- ifelse(PSID1980.married.withKids$Spouse1Workforce + PSID1980.married.withKids$Spouse2Workforce == 1, 1, 0)
PSID2019.married.withKids$OneBreadwinner <- ifelse(PSID2019.married.withKids$Spouse1Workforce + PSID2019.married.withKids$Spouse2Workforce == 1, 1, 0)

#################################################################
### Now we aggregate these two sets of data and we calculate  ###
### the percentage of married households with children that   ###
### have just one breadwinner.                                ###
#################################################################

tblP1 <- aggregate(data=PSID1980.married.withKids, `Family weight 1980` ~ OneBreadwinner, FUN=sum)
tblP1$Year <- rep("1980", nrow(tblP1))
tblP2 <- aggregate(data=PSID2019.married.withKids, `Family weight 2019` ~ OneBreadwinner, FUN=sum)
tblP2$Year <- rep("2019", nrow(tblP2))
tblP <- full_join(x=tblP1, y=tblP2, by="OneBreadwinner")
tblP$`Family weight 1980`[tblP$OneBreadwinner==1] / (tblP$`Family weight 1980`[tblP$OneBreadwinner==1] + tblP$`Family weight 1980`[tblP$OneBreadwinner==0])
tblP$`Family weight 2019`[tblP$OneBreadwinner==1] / (tblP$`Family weight 2019`[tblP$OneBreadwinner==1] + tblP$`Family weight 2019`[tblP$OneBreadwinner==0])

#################################################################
###                                                           ###
###   Section 11: Comparing DBRR across all loan programs     ###
###                                                           ###
#################################################################

#################################################################
### First we load in institution-level Scorecard data for     ###
### federal Direct Loans to undergrads, to graduate students, ###
### and to Parent PLUS borrowers, for X=1, 4, 5, 10, and 20.  ###
### We also remove duplicated rows when it comes to OPEID.    ###
#################################################################

CSI5 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM",       
  "HBCU", 
  "DBRR1_FED_UG_NUM", # Undergraduate federal student loan dollar-based 1-year repayment rate numerator	
  "DBRR1_FED_UG_DEN", # Undergraduate federal student loan dollar-based 1-year repayment rate denominator	
  "DBRR1_FED_GR_NUM", # Graduate federal student loan dollar-based 1-year repayment rate numerator	
  "DBRR1_FED_GR_DEN", # Graduate federal student loan dollar-based 1-year repayment rate denominator	
  "DBRR1_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 1-year repayment rate numerator	
  "DBRR1_PP_UG_DEN",   # Undergraduate Parent PLUS Loan dollar-based 1-year repayment rate denominator	
  "DBRR4_FED_UG_NUM", # Undergraduate federal student loan dollar-based 4-year repayment rate numerator	
  "DBRR4_FED_UG_DEN", # Undergraduate federal student loan dollar-based 4-year repayment rate denominator	
  "DBRR4_FED_GR_NUM", # Graduate federal student loan dollar-based 4-year repayment rate numerator	
  "DBRR4_FED_GR_DEN", # Graduate federal student loan dollar-based 4-year repayment rate denominator	
  "DBRR4_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 4-year repayment rate numerator	
  "DBRR4_PP_UG_DEN",   # Undergraduate Parent PLUS Loan dollar-based 4-year repayment rate denominator
  "DBRR5_FED_UG_NUM", # Undergraduate federal student loan dollar-based 5-year repayment rate numerator	
  "DBRR5_FED_UG_DEN", # Undergraduate federal student loan dollar-based 5-year repayment rate denominator	
  "DBRR5_FED_GR_NUM", # Graduate federal student loan dollar-based 5-year repayment rate numerator	
  "DBRR5_FED_GR_DEN", # Graduate federal student loan dollar-based 5-year repayment rate denominator	
  "DBRR5_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 5-year repayment rate numerator	
  "DBRR5_PP_UG_DEN",   # Undergraduate Parent PLUS Loan dollar-based 5-year repayment rate denominator
  "DBRR10_FED_UG_NUM", # Undergraduate federal student loan dollar-based 10-year repayment rate numerator	
  "DBRR10_FED_UG_DEN", # Undergraduate federal student loan dollar-based 10-year repayment rate denominator	
  "DBRR10_FED_GR_NUM", # Graduate federal student loan dollar-based 10-year repayment rate numerator	
  "DBRR10_FED_GR_DEN", # Graduate federal student loan dollar-based 10-year repayment rate denominator	
  "DBRR10_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 10-year repayment rate numerator	
  "DBRR10_PP_UG_DEN",   # Undergraduate Parent PLUS Loan dollar-based 10-year repayment rate denominator
  "DBRR20_FED_UG_NUM", # Undergraduate federal student loan dollar-based 20-year repayment rate numerator	
  "DBRR20_FED_UG_DEN", # Undergraduate federal student loan dollar-based 20-year repayment rate denominator	
  "DBRR20_FED_GR_NUM", # Graduate federal student loan dollar-based 20-year repayment rate numerator	
  "DBRR20_FED_GR_DEN", # Graduate federal student loan dollar-based 20-year repayment rate denominator	
  "DBRR20_PP_UG_NUM",  # Undergraduate Parent PLUS Loan dollar-based 20-year repayment rate numerator	
  "DBRR20_PP_UG_DEN"   # Undergraduate Parent PLUS Loan dollar-based 20-year repayment rate denominator
)) %>% filter(duplicated(OPEID6)==FALSE)

#################################################################
### Here we set all suppressed and null values to zero.       ###
#################################################################

CSI5$DBRR1_FED_UG_NUM[CSI5$DBRR1_FED_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR1_FED_UG_DEN[CSI5$DBRR1_FED_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR1_FED_GR_NUM[CSI5$DBRR1_FED_GR_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR1_FED_GR_DEN[CSI5$DBRR1_FED_GR_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR1_PP_UG_NUM[CSI5$DBRR1_PP_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR1_PP_UG_DEN[CSI5$DBRR1_PP_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR4_FED_UG_NUM[CSI5$DBRR4_FED_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR4_FED_UG_DEN[CSI5$DBRR4_FED_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR4_FED_GR_NUM[CSI5$DBRR4_FED_GR_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR4_FED_GR_DEN[CSI5$DBRR4_FED_GR_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR4_PP_UG_NUM[CSI5$DBRR4_PP_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR4_PP_UG_DEN[CSI5$DBRR4_PP_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR5_FED_UG_NUM[CSI5$DBRR5_FED_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR5_FED_UG_DEN[CSI5$DBRR5_FED_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR5_FED_GR_NUM[CSI5$DBRR5_FED_GR_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR5_FED_GR_DEN[CSI5$DBRR5_FED_GR_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR5_PP_UG_NUM[CSI5$DBRR5_PP_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR5_PP_UG_DEN[CSI5$DBRR5_PP_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR10_FED_UG_NUM[CSI5$DBRR10_FED_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR10_FED_UG_DEN[CSI5$DBRR10_FED_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR10_FED_GR_NUM[CSI5$DBRR10_FED_GR_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR10_FED_GR_DEN[CSI5$DBRR10_FED_GR_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR10_PP_UG_NUM[CSI5$DBRR10_PP_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR10_PP_UG_DEN[CSI5$DBRR10_PP_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR20_FED_UG_NUM[CSI5$DBRR20_FED_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR20_FED_UG_DEN[CSI5$DBRR20_FED_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR20_FED_GR_NUM[CSI5$DBRR20_FED_GR_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR20_FED_GR_DEN[CSI5$DBRR20_FED_GR_DEN %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR20_PP_UG_NUM[CSI5$DBRR20_PP_UG_NUM %in% c("PrivacySuppressed", "NULL")] <- 0
CSI5$DBRR20_PP_UG_DEN[CSI5$DBRR20_PP_UG_DEN %in% c("PrivacySuppressed", "NULL")] <- 0

#################################################################
### Now we set numeric data as numbers.                       ###
#################################################################

CSI5$DBRR1_FED_UG_NUM <- as.numeric(CSI5$DBRR1_FED_UG_NUM)
CSI5$DBRR1_FED_UG_DEN <- as.numeric(CSI5$DBRR1_FED_UG_DEN)
CSI5$DBRR1_FED_GR_NUM <- as.numeric(CSI5$DBRR1_FED_GR_NUM)
CSI5$DBRR1_FED_GR_DEN <- as.numeric(CSI5$DBRR1_FED_GR_DEN)
CSI5$DBRR1_PP_UG_NUM <- as.numeric(CSI5$DBRR1_PP_UG_NUM)
CSI5$DBRR1_PP_UG_DEN <- as.numeric(CSI5$DBRR1_PP_UG_DEN)
CSI5$DBRR4_FED_UG_NUM <- as.numeric(CSI5$DBRR4_FED_UG_NUM)
CSI5$DBRR4_FED_UG_DEN <- as.numeric(CSI5$DBRR4_FED_UG_DEN)
CSI5$DBRR4_FED_GR_NUM <- as.numeric(CSI5$DBRR4_FED_GR_NUM)
CSI5$DBRR4_FED_GR_DEN <- as.numeric(CSI5$DBRR4_FED_GR_DEN)
CSI5$DBRR4_PP_UG_NUM <- as.numeric(CSI5$DBRR4_PP_UG_NUM)
CSI5$DBRR4_PP_UG_DEN <- as.numeric(CSI5$DBRR4_PP_UG_DEN)
CSI5$DBRR5_FED_UG_NUM <- as.numeric(CSI5$DBRR5_FED_UG_NUM)
CSI5$DBRR5_FED_UG_DEN <- as.numeric(CSI5$DBRR5_FED_UG_DEN)
CSI5$DBRR5_FED_GR_NUM <- as.numeric(CSI5$DBRR5_FED_GR_NUM)
CSI5$DBRR5_FED_GR_DEN <- as.numeric(CSI5$DBRR5_FED_GR_DEN)
CSI5$DBRR5_PP_UG_NUM <- as.numeric(CSI5$DBRR5_PP_UG_NUM)
CSI5$DBRR5_PP_UG_DEN <- as.numeric(CSI5$DBRR5_PP_UG_DEN)
CSI5$DBRR10_FED_UG_NUM <- as.numeric(CSI5$DBRR10_FED_UG_NUM)
CSI5$DBRR10_FED_UG_DEN <- as.numeric(CSI5$DBRR10_FED_UG_DEN)
CSI5$DBRR10_FED_GR_NUM <- as.numeric(CSI5$DBRR10_FED_GR_NUM)
CSI5$DBRR10_FED_GR_DEN <- as.numeric(CSI5$DBRR10_FED_GR_DEN)
CSI5$DBRR10_PP_UG_NUM <- as.numeric(CSI5$DBRR10_PP_UG_NUM)
CSI5$DBRR10_PP_UG_DEN <- as.numeric(CSI5$DBRR10_PP_UG_DEN)
CSI5$DBRR20_FED_UG_NUM <- as.numeric(CSI5$DBRR20_FED_UG_NUM)
CSI5$DBRR20_FED_UG_DEN <- as.numeric(CSI5$DBRR20_FED_UG_DEN)
CSI5$DBRR20_FED_GR_NUM <- as.numeric(CSI5$DBRR20_FED_GR_NUM)
CSI5$DBRR20_FED_GR_DEN <- as.numeric(CSI5$DBRR20_FED_GR_DEN)
CSI5$DBRR20_PP_UG_NUM <- as.numeric(CSI5$DBRR20_PP_UG_NUM)
CSI5$DBRR20_PP_UG_DEN <- as.numeric(CSI5$DBRR20_PP_UG_DEN)

#################################################################
### Now we create the dataframe that will hold the aggregated ###
### totals.                                                   ###
#################################################################

tblR <- data.frame("Year" = c(1, 1, 1, 
                              4, 4, 4,
                              5, 5, 5, 
                              10, 10, 10, 
                              20, 20, 20),
                   "Loan program" = c(
                     "Undergrad", "Graduate", "Parent PLUS", 
                     "Undergrad", "Graduate", "Parent PLUS", 
                     "Undergrad", "Graduate", "Parent PLUS", 
                     "Undergrad", "Graduate", "Parent PLUS", 
                     "Undergrad", "Graduate", "Parent PLUS"), 
                   "Numerator" = c(
                     sum(CSI5$DBRR1_FED_UG_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR1_FED_GR_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR1_PP_UG_NUM, na.rm=TRUE),     
                     sum(CSI5$DBRR4_FED_UG_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR4_FED_GR_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR4_PP_UG_NUM, na.rm=TRUE),      
                     sum(CSI5$DBRR5_FED_UG_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR5_FED_GR_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR5_PP_UG_NUM, na.rm=TRUE),
                     sum(CSI5$DBRR10_FED_UG_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR10_FED_GR_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR10_PP_UG_NUM, na.rm=TRUE),
                     sum(CSI5$DBRR20_FED_UG_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR20_FED_GR_NUM, na.rm=TRUE), 
                     sum(CSI5$DBRR20_PP_UG_NUM, na.rm=TRUE)
                   ), 
                   "Denominator" = c(
                     sum(CSI5$DBRR1_FED_UG_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR1_FED_GR_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR1_PP_UG_DEN, na.rm=TRUE),     
                     sum(CSI5$DBRR4_FED_UG_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR4_FED_GR_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR4_PP_UG_DEN, na.rm=TRUE),      
                     sum(CSI5$DBRR5_FED_UG_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR5_FED_GR_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR5_PP_UG_DEN, na.rm=TRUE),
                     sum(CSI5$DBRR10_FED_UG_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR10_FED_GR_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR10_PP_UG_DEN, na.rm=TRUE),
                     sum(CSI5$DBRR20_FED_UG_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR20_FED_GR_DEN, na.rm=TRUE), 
                     sum(CSI5$DBRR20_PP_UG_DEN, na.rm=TRUE)                     
                   ))

#################################################################
### We now fill in rows for the years that are not 1, 4, 5,   ###
### 10, or 20. This helps create an accurate graph.           ###
#################################################################

tblR <- tblR %>% add_row(Year = 2, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 2, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 2, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 3, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 3, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 3, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 6, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 6, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 6, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 7, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 7, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 7, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 8, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 8, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 8, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 9, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 9, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 9, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 11, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 11, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 11, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 12, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 12, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 12, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 13, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 13, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 13, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 14, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 14, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 14, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 15, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 15, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 15, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 16, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 16, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 16, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 17, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 17, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 17, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 18, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 18, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 18, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

tblR <- tblR %>% add_row(Year = 19, Loan.program = "Undergrad", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 19, Loan.program = "Graduate", Numerator = NA, Denominator = NA)
tblR <- tblR %>% add_row(Year = 19, Loan.program = "Parent PLUS", Numerator = NA, Denominator = NA)

#################################################################
### We add the repayment rate variable and make our chart.    ###
#################################################################

tblR <- tblR %>% arrange(Year, Loan.program)
tblR$`Repayment Rate` <- tblR$Numerator / tblR$Denominator
tblR.example <- tblR
tblR.example <- na.omit(tblR.example)
ggplot(data=tblR.example, mapping=aes(x=Year, y=`Repayment Rate`, color=Loan.program)) + geom_line() + geom_point() + scale_y_continuous(limits=c(0, 1.5)) + scale_x_continuous(breaks=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)) + labs(title = "Ratio of outstanding Parent PLUS balance to original disbursements: 1, 4, 5, 10, and 20-year cohorts", y = "Ratio of outstanding balance to original disbursement", x = "Years Since Repayment Start")


#################################################################
###                                                           ###
###         Section 12: Comparing BBRR by sector              ###
###                                                           ###
#################################################################

#################################################################
### First we load in the BBRR variables from the Scorecard    ###
### institution-level dataset for X=1, 2, and 3.              ###
#################################################################

CSI6 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM",       
  "HBCU", 
  "CONTROL",
  "BBRR1_PP_UG_N",	# Undergraduate student Parent PLUS Loan borrower-based 1-year borrower count
  "BBRR1_PP_UG_DFLT",	# Percentage of undergraduate student Parent PLUS Loan borrowers in default after 1 year
  "BBRR1_PP_UG_DLNQ",	# Percentage of undergraduate student Parent PLUS Loan borrowers in delinquency after 1 year
  "BBRR1_PP_UG_FBR",	# Percentage of undergraduate student Parent PLUS Loan borrowers in forbearance after 1 year
  "BBRR1_PP_UG_DFR",	# Percentage of undergraduate student Parent PLUS Loan borrowers in deferment after 1 year
  "BBRR1_PP_UG_NOPROG",	# Percentage of undergraduate student Parent PLUS Loan borrowers not making progress after 1 year
  "BBRR1_PP_UG_MAKEPROG",	# Percentage of undergraduate student Parent PLUS Loan borrowers making progress after 1 year
  "BBRR1_PP_UG_PAIDINFULL",	# Percentage of undergraduate student Parent PLUS Loan borrowers paid in full after 1 year
  "BBRR1_PP_UG_DISCHARGE",	# Percentage of undergraduate student Parent PLUS Loan borrowers with all loans discharged after 1 year
  "BBRR1_PP_UGCOMP_N",	# Undergraduate completer undergraduate student Parent PLUS Loan borrower-based 1-year borrower count
  "BBRR1_PP_UGCOMP_DFLT",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in default after 1 year
  "BBRR1_PP_UGCOMP_DLNQ",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in delinquency after 1 year
  "BBRR1_PP_UGCOMP_FBR",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in forbearance after 1 year
  "BBRR1_PP_UGCOMP_DFR",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in deferment after 1 year
  "BBRR1_PP_UGCOMP_NOPROG",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers not making progress after 1 year
  "BBRR1_PP_UGCOMP_MAKEPROG",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers making progress after 1 year
  "BBRR1_PP_UGCOMP_PAIDINFULL",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers paid in full after 1 year
  "BBRR1_PP_UGCOMP_DISCHARGE",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers with all loans discharged after 1 year
  "BBRR1_PP_UGNOCOMP_N",	# Undergraduate non-completer undergraduate student Parent PLUS Loan borrower-based 1-year borrower count
  "BBRR1_PP_UGNOCOMP_DFLT",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in default after 1 year
  "BBRR1_PP_UGNOCOMP_DLNQ",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in delinquency after 1 year
  "BBRR1_PP_UGNOCOMP_FBR",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in forbearance after 1 year
  "BBRR1_PP_UGNOCOMP_DFR",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in deferment after 1 year
  "BBRR1_PP_UGNOCOMP_NOPROG",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers not making progress after 1 year
  "BBRR1_PP_UGNOCOMP_MAKEPROG",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers making progress after 1 year
  "BBRR1_PP_UGNOCOMP_PAIDINFULL",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers paid in full after 1 year
  "BBRR1_PP_UGNOCOMP_DISCHARGE",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers with all loans discharged after 1 year
  "BBRR2_PP_UG_N",	# Undergraduate student Parent PLUS Loan borrower-based 2-year borrower count
  "BBRR2_PP_UG_DFLT",	# Percentage of undergraduate student Parent PLUS Loan borrowers in default after 2 years
  "BBRR2_PP_UG_DLNQ",	# Percentage of undergraduate student Parent PLUS Loan borrowers in delinquency after 2 years
  "BBRR2_PP_UG_FBR",	# Percentage of undergraduate student Parent PLUS Loan borrowers in forbearance after 2 years
  "BBRR2_PP_UG_DFR",	# Percentage of undergraduate student Parent PLUS Loan borrowers in deferment after 2 years
  "BBRR2_PP_UG_NOPROG",	# Percentage of undergraduate student Parent PLUS Loan borrowers not making progress after 2 years
  "BBRR2_PP_UG_MAKEPROG",	# Percentage of undergraduate student Parent PLUS Loan borrowers making progress after 2 years
  "BBRR2_PP_UG_PAIDINFULL",	# Percentage of undergraduate student Parent PLUS Loan borrowers paid in full after 2 years
  "BBRR2_PP_UG_DISCHARGE",	# Percentage of undergraduate student Parent PLUS Loan borrowers with all loans discharged after 2 years
  "BBRR2_PP_UGCOMP_N",	# Undergraduate completer undergraduate student Parent PLUS Loan borrower-based 2-year borrower count
  "BBRR2_PP_UGCOMP_DFLT",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in default after 2 years
  "BBRR2_PP_UGCOMP_DLNQ",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in delinquency after 2 years
  "BBRR2_PP_UGCOMP_FBR",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in forbearance after 2 years
  "BBRR2_PP_UGCOMP_DFR",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in deferment after 2 years
  "BBRR2_PP_UGCOMP_NOPROG",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers not making progress after 2 years
  "BBRR2_PP_UGCOMP_MAKEPROG",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers making progress after 2 years
  "BBRR2_PP_UGCOMP_PAIDINFULL",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers paid in full after 2 years
  "BBRR2_PP_UGCOMP_DISCHARGE",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers with all loans discharged after 2 years
  "BBRR2_PP_UGNOCOMP_N",	# Undergraduate non-completer undergraduate student Parent PLUS Loan borrower-based 2-year borrower count
  "BBRR2_PP_UGNOCOMP_DFLT",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in default after 2 years
  "BBRR2_PP_UGNOCOMP_DLNQ",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in delinquency after 2 years
  "BBRR2_PP_UGNOCOMP_FBR",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in forbearance after 2 years
  "BBRR2_PP_UGNOCOMP_DFR",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in deferment after 2 years
  "BBRR2_PP_UGNOCOMP_NOPROG",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers not making progress after 2 years
  "BBRR2_PP_UGNOCOMP_MAKEPROG",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers making progress after 2 years
  "BBRR2_PP_UGNOCOMP_PAIDINFULL",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers paid in full after 2 years
  "BBRR2_PP_UGNOCOMP_DISCHARGE",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers with all loans discharged after 2 years
  "BBRR3_PP_UG_N",	# Undergraduate student Parent PLUS Loan borrower-based 3-year borrower count
  "BBRR3_PP_UG_DFLT",	# Percentage of undergraduate student Parent PLUS Loan borrowers in default after 3 years
  "BBRR3_PP_UG_DLNQ",	# Percentage of undergraduate student Parent PLUS Loan borrowers in delinquency after 3 years
  "BBRR3_PP_UG_FBR",	# Percentage of undergraduate student Parent PLUS Loan borrowers in forbearance after 3 years
  "BBRR3_PP_UG_DFR",	# Percentage of undergraduate student Parent PLUS Loan borrowers in deferment after 3 years
  "BBRR3_PP_UG_NOPROG",	# Percentage of undergraduate student Parent PLUS Loan borrowers not making progress after 3 years
  "BBRR3_PP_UG_MAKEPROG",	# Percentage of undergraduate student Parent PLUS Loan borrowers making progress after 3 years
  "BBRR3_PP_UG_PAIDINFULL",	# Percentage of undergraduate student Parent PLUS Loan borrowers paid in full after 3 years
  "BBRR3_PP_UG_DISCHARGE",	# Percentage of undergraduate student Parent PLUS Loan borrowers with all loans discharged after 3 years
  "BBRR3_PP_UGCOMP_N",	# Undergraduate completer undergraduate student Parent PLUS Loan borrower-based 3-year borrower count
  "BBRR3_PP_UGCOMP_DFLT",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in default after 3 years
  "BBRR3_PP_UGCOMP_DLNQ",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in delinquency after 3 years
  "BBRR3_PP_UGCOMP_FBR",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in forbearance after 3 years
  "BBRR3_PP_UGCOMP_DFR",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers in deferment after 3 years
  "BBRR3_PP_UGCOMP_NOPROG",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers not making progress after 3 years
  "BBRR3_PP_UGCOMP_MAKEPROG",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers making progress after 3 years
  "BBRR3_PP_UGCOMP_PAIDINFULL",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers paid in full after 3 years
  "BBRR3_PP_UGCOMP_DISCHARGE",	# Percentage of undergraduate completer undergraduate student Parent PLUS Loan borrowers with all loans discharged after 3 years
  "BBRR3_PP_UGNOCOMP_N",	# Undergraduate non-completer undergraduate student Parent PLUS Loan borrower-based 3-year borrower count
  "BBRR3_PP_UGNOCOMP_DFLT",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in default after 3 years
  "BBRR3_PP_UGNOCOMP_DLNQ",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in delinquency after 3 years
  "BBRR3_PP_UGNOCOMP_FBR",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in forbearance after 3 years
  "BBRR3_PP_UGNOCOMP_DFR",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers in deferment after 3 years
  "BBRR3_PP_UGNOCOMP_NOPROG",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers not making progress after 3 years
  "BBRR3_PP_UGNOCOMP_MAKEPROG",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers making progress after 3 years
  "BBRR3_PP_UGNOCOMP_PAIDINFULL",	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers paid in full after 3 years
  "BBRR3_PP_UGNOCOMP_DISCHARGE"	# Percentage of undergraduate non-completer undergraduate student Parent PLUS Loan borrowers with all loans discharged after 3 years
)) %>% filter(duplicated(OPEID6)==FALSE)

#################################################################
### Now we need to set the numeric variables as numbers.      ###
#################################################################

CSI6$BBRR3_PP_UGCOMP_DFLT.modified <- as.numeric(ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="<=0.05", "0.025", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="<-0.10", "0.05", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="<=0.20", "0.1", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.03-0.04", "0.035", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.05-0.06", "0.055", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.05-0.09", "0.07", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.07-0.08", "0.075", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.09-0.10", "0.095", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.10-0.14", "0.12", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.10-0.19", "0.145", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.11-0.12", "0.115", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.13-0.14", "0.135", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.15-0.16", "0.155", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.17-0.18", "0.175", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.15-0.19", "0.17", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.19-0.20", "0.195", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.20-0.24", "0.22", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.20-0.29", "0.245", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.20-0.39", "0.295", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.21-0.22", "0.215",  ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.23-0.24", "0.235", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.25-0.29", "0.27", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.27-0.28", "0.275", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.30-0.34", "0.32", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.30-0.39", "0.345", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.31-0.32", "0.315", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.40-0.49", "0.445", ifelse(CSI6$BBRR3_PP_UGCOMP_DFLT=="0.40-0.59", "0.495", NA)))))))))))))))))))))))))))))

CSI6$BBRR3_PP_UGNOCOMP_DFLT.modified <- as.numeric(ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="<=0.05", "0.025", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="<-0.10", "0.05", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="<=0.20", "0.1", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.03-0.04", "0.035", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.05-0.06", "0.055", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.05-0.09", "0.07", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.07-0.08", "0.075", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.09-0.10", "0.095", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.10-0.14", "0.12", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.10-0.19", "0.145", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.11-0.12", "0.115", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.13-0.14", "0.135", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.15-0.16", "0.155", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.17-0.18", "0.175", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.15-0.19", "0.17", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.19-0.20", "0.195", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.20-0.24", "0.22", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.20-0.29", "0.245", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.20-0.39", "0.295", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.21-0.22", "0.215",  ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.23-0.24", "0.235", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.25-0.29", "0.27", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.27-0.28", "0.275", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.30-0.34", "0.32", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.30-0.39", "0.345", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.31-0.32", "0.315", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.40-0.49", "0.445", ifelse(CSI6$BBRR3_PP_UGNOCOMP_DFLT=="0.40-0.59", "0.495", NA)))))))))))))))))))))))))))))

CSI6$BBRR3_PP_UGCOMP_MAKEPROG.modified <- as.numeric(ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="<=0.05", "0.025", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="<-0.10", "0.05", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="<=0.20", "0.1", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.03-0.04", "0.035", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.05-0.06", "0.055", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.05-0.09", "0.07", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.07-0.08", "0.075", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.09-0.10", "0.095", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.10-0.14", "0.12", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.10-0.19", "0.145", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.11-0.12", "0.115", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.13-0.14", "0.135", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.15-0.16", "0.155", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.17-0.18", "0.175", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.15-0.19", "0.17", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.19-0.20", "0.195", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.20-0.24", "0.22", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.20-0.29", "0.245", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.20-0.39", "0.295", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.21-0.22", "0.215",  ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.23-0.24", "0.235", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.25-0.29", "0.27", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.27-0.28", "0.275", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.30-0.34", "0.32", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.30-0.39", "0.345", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.31-0.32", "0.315", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.40-0.49", "0.445", ifelse(CSI6$BBRR3_PP_UGCOMP_MAKEPROG=="0.40-0.59", "0.495", NA)))))))))))))))))))))))))))))

CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG.modified <- as.numeric(ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="<=0.05", "0.025", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="<-0.10", "0.05", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="<=0.20", "0.1", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.03-0.04", "0.035", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.05-0.06", "0.055", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.05-0.09", "0.07", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.07-0.08", "0.075", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.09-0.10", "0.095", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.10-0.14", "0.12", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.10-0.19", "0.145", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.11-0.12", "0.115", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.13-0.14", "0.135", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.15-0.16", "0.155", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.17-0.18", "0.175", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.15-0.19", "0.17", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.19-0.20", "0.195", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.20-0.24", "0.22", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.20-0.29", "0.245", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.20-0.39", "0.295", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.21-0.22", "0.215",  ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.23-0.24", "0.235", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.25-0.29", "0.27", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.27-0.28", "0.275", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.30-0.34", "0.32", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.30-0.39", "0.345", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.31-0.32", "0.315", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.40-0.49", "0.445", ifelse(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG=="0.40-0.59", "0.495", NA)))))))))))))))))))))))))))))



CSI6$BBRR1_PP_UG_N <- as.numeric(CSI6$BBRR1_PP_UG_N)
CSI6$BBRR1_PP_UG_DFLT <- as.numeric(CSI6$BBRR1_PP_UG_DFLT)
CSI6$BBRR1_PP_UG_DLNQ <- as.numeric(CSI6$BBRR1_PP_UG_DLNQ)
CSI6$BBRR1_PP_UG_FBR <- as.numeric(CSI6$BBRR1_PP_UG_FBR)
CSI6$BBRR1_PP_UG_DFR <- as.numeric(CSI6$BBRR1_PP_UG_DFR)
CSI6$BBRR1_PP_UG_NOPROG <- as.numeric(CSI6$BBRR1_PP_UG_NOPROG)
CSI6$BBRR1_PP_UG_MAKEPROG <- as.numeric(CSI6$BBRR1_PP_UG_MAKEPROG)
CSI6$BBRR1_PP_UG_PAIDINFULL <- as.numeric(CSI6$BBRR1_PP_UG_PAIDINFULL)
CSI6$BBRR1_PP_UG_DISCHARGE <- as.numeric(CSI6$BBRR1_PP_UG_DISCHARGE)	
CSI6$BBRR1_PP_UGCOMP_N <- as.numeric(CSI6$BBRR1_PP_UGCOMP_N)
CSI6$BBRR1_PP_UGCOMP_DFLT <- as.numeric(CSI6$BBRR1_PP_UGCOMP_DFLT)
CSI6$BBRR1_PP_UGCOMP_DLNQ <- as.numeric(CSI6$BBRR1_PP_UGCOMP_DLNQ)
CSI6$BBRR1_PP_UGCOMP_FBR <- as.numeric(CSI6$BBRR1_PP_UGCOMP_FBR)
CSI6$BBRR1_PP_UGCOMP_DFR <- as.numeric(CSI6$BBRR1_PP_UGCOMP_DFR)
CSI6$BBRR1_PP_UGCOMP_NOPROG <- as.numeric(CSI6$BBRR1_PP_UGCOMP_NOPROG)
CSI6$BBRR1_PP_UGCOMP_MAKEPROG <- as.numeric(CSI6$BBRR1_PP_UGCOMP_MAKEPROG)
CSI6$BBRR1_PP_UGCOMP_PAIDINFULL <- as.numeric(CSI6$BBRR1_PP_UGCOMP_PAIDINFULL)
CSI6$BBRR1_PP_UGCOMP_DISCHARGE <- as.numeric(CSI6$BBRR1_PP_UGCOMP_DISCHARGE)
CSI6$BBRR1_PP_UGNOCOMP_N <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_N)
CSI6$BBRR1_PP_UGNOCOMP_DFLT <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_DFLT)
CSI6$BBRR1_PP_UGNOCOMP_DLNQ <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_DLNQ)	
CSI6$BBRR1_PP_UGNOCOMP_FBR <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_FBR)	
CSI6$BBRR1_PP_UGNOCOMP_DFR <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_DFR)	
CSI6$BBRR1_PP_UGNOCOMP_NOPROG <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_NOPROG)	
CSI6$BBRR1_PP_UGNOCOMP_MAKEPROG <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_MAKEPROG)
CSI6$BBRR1_PP_UGNOCOMP_PAIDINFULL <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_PAIDINFULL)	
CSI6$BBRR1_PP_UGNOCOMP_DISCHARGE <- as.numeric(CSI6$BBRR1_PP_UGNOCOMP_DISCHARGE)	
CSI6$BBRR2_PP_UG_N <- as.numeric(CSI6$BBRR2_PP_UG_N)	
CSI6$BBRR2_PP_UG_DFLT <- as.numeric(CSI6$BBRR2_PP_UG_DFLT)
CSI6$BBRR2_PP_UG_DLNQ <- as.numeric(CSI6$BBRR2_PP_UG_DLNQ)	
CSI6$BBRR2_PP_UG_FBR <- as.numeric(CSI6$BBRR2_PP_UG_FBR)	
CSI6$BBRR2_PP_UG_DFR <- as.numeric(CSI6$BBRR2_PP_UG_DFR)	
CSI6$BBRR2_PP_UG_NOPROG <- as.numeric(CSI6$BBRR2_PP_UG_NOPROG)	
CSI6$BBRR2_PP_UG_MAKEPROG <- as.numeric(CSI6$BBRR2_PP_UG_MAKEPROG)	
CSI6$BBRR2_PP_UG_PAIDINFULL <- as.numeric(CSI6$BBRR2_PP_UG_PAIDINFULL)	
CSI6$BBRR2_PP_UG_DISCHARGE <- as.numeric(CSI6$BBRR2_PP_UG_DISCHARGE)
CSI6$BBRR2_PP_UGCOMP_N <- as.numeric(CSI6$BBRR2_PP_UGCOMP_N)
CSI6$BBRR2_PP_UGCOMP_DFLT <- as.numeric(CSI6$BBRR2_PP_UGCOMP_DFLT)
CSI6$BBRR2_PP_UGCOMP_DLNQ <- as.numeric(CSI6$BBRR2_PP_UGCOMP_DLNQ)
CSI6$BBRR2_PP_UGCOMP_FBR <- as.numeric(CSI6$BBRR2_PP_UGCOMP_FBR)
CSI6$BBRR2_PP_UGCOMP_DFR <- as.numeric(CSI6$BBRR2_PP_UGCOMP_DFR)
CSI6$BBRR2_PP_UGCOMP_NOPROG <- as.numeric(CSI6$BBRR2_PP_UGCOMP_NOPROG)
CSI6$BBRR2_PP_UGCOMP_MAKEPROG <- as.numeric(CSI6$BBRR2_PP_UGCOMP_MAKEPROG)	
CSI6$BBRR2_PP_UGCOMP_PAIDINFULL <- as.numeric(CSI6$BBRR2_PP_UGCOMP_PAIDINFULL)
CSI6$BBRR2_PP_UGCOMP_DISCHARGE <- as.numeric(CSI6$BBRR2_PP_UGCOMP_DISCHARGE)	
CSI6$BBRR2_PP_UGNOCOMP_N <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_N)	
CSI6$BBRR2_PP_UGNOCOMP_DFLT <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_DFLT)	
CSI6$BBRR2_PP_UGNOCOMP_DLNQ <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_DLNQ)	
CSI6$BBRR2_PP_UGNOCOMP_FBR <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_FBR)	
CSI6$BBRR2_PP_UGNOCOMP_DFR <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_DFR)	
CSI6$BBRR2_PP_UGNOCOMP_NOPROG <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_NOPROG)	
CSI6$BBRR2_PP_UGNOCOMP_MAKEPROG <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_MAKEPROG)	
CSI6$BBRR2_PP_UGNOCOMP_PAIDINFULL <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_PAIDINFULL)	
CSI6$BBRR2_PP_UGNOCOMP_DISCHARGE <- as.numeric(CSI6$BBRR2_PP_UGNOCOMP_DISCHARGE)	
CSI6$BBRR3_PP_UG_N <- as.numeric(CSI6$BBRR3_PP_UG_N)	
CSI6$BBRR3_PP_UG_DFLT <- as.numeric(CSI6$BBRR3_PP_UG_DFLT)
CSI6$BBRR3_PP_UG_DLNQ <- as.numeric(CSI6$BBRR3_PP_UG_DLNQ)
CSI6$BBRR3_PP_UG_FBR <- as.numeric(CSI6$BBRR3_PP_UG_FBR)	
CSI6$BBRR3_PP_UG_DFR <- as.numeric(CSI6$BBRR3_PP_UG_DFR)	
CSI6$BBRR3_PP_UG_NOPROG <- as.numeric(CSI6$BBRR3_PP_UG_NOPROG)	
CSI6$BBRR3_PP_UG_MAKEPROG <- as.numeric(CSI6$BBRR3_PP_UG_MAKEPROG)	
CSI6$BBRR3_PP_UG_PAIDINFULL <- as.numeric(CSI6$BBRR3_PP_UG_PAIDINFULL)	
CSI6$BBRR3_PP_UG_DISCHARGE <- as.numeric(CSI6$BBRR3_PP_UG_DISCHARGE)	
CSI6$BBRR3_PP_UGCOMP_N <- as.numeric(CSI6$BBRR3_PP_UGCOMP_N)	
CSI6$BBRR3_PP_UGCOMP_DFLT <- as.numeric(CSI6$BBRR3_PP_UGCOMP_DFLT)	
CSI6$BBRR3_PP_UGCOMP_DLNQ <- as.numeric(CSI6$BBRR3_PP_UGCOMP_DLNQ)	
CSI6$BBRR3_PP_UGCOMP_FBR <- as.numeric(CSI6$BBRR3_PP_UGCOMP_FBR)	
CSI6$BBRR3_PP_UGCOMP_DFR <- as.numeric(CSI6$BBRR3_PP_UGCOMP_DFR)	
CSI6$BBRR3_PP_UGCOMP_NOPROG <- as.numeric(CSI6$BBRR3_PP_UGCOMP_NOPROG)	
CSI6$BBRR3_PP_UGCOMP_MAKEPROG <- as.numeric(CSI6$BBRR3_PP_UGCOMP_MAKEPROG)	
CSI6$BBRR3_PP_UGCOMP_PAIDINFULL <- as.numeric(CSI6$BBRR3_PP_UGCOMP_PAIDINFULL)	
CSI6$BBRR3_PP_UGCOMP_DISCHARGE <- as.numeric(CSI6$BBRR3_PP_UGCOMP_DISCHARGE)	
CSI6$BBRR3_PP_UGNOCOMP_N <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_N)	
CSI6$BBRR3_PP_UGNOCOMP_DFLT <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_DFLT)	
CSI6$BBRR3_PP_UGNOCOMP_DLNQ <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_DLNQ)	
CSI6$BBRR3_PP_UGNOCOMP_FBR <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_FBR)	
CSI6$BBRR3_PP_UGNOCOMP_DFR <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_DFR)
CSI6$BBRR3_PP_UGNOCOMP_NOPROG <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_NOPROG)	
CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG)	
CSI6$BBRR3_PP_UGNOCOMP_PAIDINFULL <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_PAIDINFULL)
CSI6$BBRR3_PP_UGNOCOMP_DISCHARGE <- as.numeric(CSI6$BBRR3_PP_UGNOCOMP_DISCHARGE)

#################################################################
### At this point we convert the borrower percentages in raw  ###
### borrower totals.                                          ###
#################################################################

# CSI6$BBRR1_PP_UG_N 
CSI6$BBRR1_PP_UG_DFLT_N <- CSI6$BBRR1_PP_UG_DFLT * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_DLNQ_N <- CSI6$BBRR1_PP_UG_DLNQ * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_FBR_N <- CSI6$BBRR1_PP_UG_FBR * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_DFR_N <- CSI6$BBRR1_PP_UG_DFR * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_NOPROG_N <- CSI6$BBRR1_PP_UG_NOPROG * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_MAKEPROG_N <- CSI6$BBRR1_PP_UG_MAKEPROG * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_PAIDINFULL_N <- CSI6$BBRR1_PP_UG_PAIDINFULL * CSI6$BBRR1_PP_UG_N
CSI6$BBRR1_PP_UG_DISCHARGE_N <- CSI6$BBRR1_PP_UG_DISCHARGE * CSI6$BBRR1_PP_UG_N
# CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_DFLT_N <- CSI6$BBRR1_PP_UGCOMP_DFLT * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_DLNQ_N <- CSI6$BBRR1_PP_UGCOMP_DLNQ * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_FBR_N <- CSI6$BBRR1_PP_UGCOMP_FBR * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_DFR_N <- CSI6$BBRR1_PP_UGCOMP_DFR * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_NOPROG_N <- CSI6$BBRR1_PP_UGCOMP_NOPROG * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_MAKEPROG_N <- CSI6$BBRR1_PP_UGCOMP_MAKEPROG * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_PAIDINFULL_N <- CSI6$BBRR1_PP_UGCOMP_PAIDINFULL * CSI6$BBRR1_PP_UGCOMP_N 
CSI6$BBRR1_PP_UGCOMP_DISCHARGE_N <- CSI6$BBRR1_PP_UGCOMP_DISCHARGE * CSI6$BBRR1_PP_UGCOMP_N 
# CSI6$BBRR1_PP_UGNOCOMP_N 
CSI6$BBRR1_PP_UGNOCOMP_DFLT_N <- CSI6$BBRR1_PP_UGNOCOMP_DFLT * CSI6$BBRR1_PP_UGNOCOMP_N 
CSI6$BBRR1_PP_UGNOCOMP_DLNQ_N <- CSI6$BBRR1_PP_UGNOCOMP_DLNQ * CSI6$BBRR1_PP_UGNOCOMP_N 	
CSI6$BBRR1_PP_UGNOCOMP_FBR_N <- CSI6$BBRR1_PP_UGNOCOMP_FBR * CSI6$BBRR1_PP_UGNOCOMP_N 
CSI6$BBRR1_PP_UGNOCOMP_DFR_N <- CSI6$BBRR1_PP_UGNOCOMP_DFR * CSI6$BBRR1_PP_UGNOCOMP_N 
CSI6$BBRR1_PP_UGNOCOMP_NOPROG_N <- CSI6$BBRR1_PP_UGNOCOMP_NOPROG * CSI6$BBRR1_PP_UGNOCOMP_N 	
CSI6$BBRR1_PP_UGNOCOMP_MAKEPROG_N <- CSI6$BBRR1_PP_UGNOCOMP_MAKEPROG * CSI6$BBRR1_PP_UGNOCOMP_N 
CSI6$BBRR1_PP_UGNOCOMP_PAIDINFULL_N <- CSI6$BBRR1_PP_UGNOCOMP_PAIDINFULL * CSI6$BBRR1_PP_UGNOCOMP_N 	
CSI6$BBRR1_PP_UGNOCOMP_DISCHARGE_N <- CSI6$BBRR1_PP_UGNOCOMP_DISCHARGE * CSI6$BBRR1_PP_UGNOCOMP_N 	
# CSI6$BBRR2_PP_UG_N 
CSI6$BBRR2_PP_UG_DFLT_N <- CSI6$BBRR2_PP_UG_DFLT * CSI6$BBRR2_PP_UG_N
CSI6$BBRR2_PP_UG_DLNQ_N <- CSI6$BBRR2_PP_UG_DLNQ * CSI6$BBRR2_PP_UG_N	
CSI6$BBRR2_PP_UG_FBR_N <- CSI6$BBRR2_PP_UG_FBR * CSI6$BBRR2_PP_UG_N	
CSI6$BBRR2_PP_UG_DFR_N <- CSI6$BBRR2_PP_UG_DFR * CSI6$BBRR2_PP_UG_N	
CSI6$BBRR2_PP_UG_NOPROG_N <- CSI6$BBRR2_PP_UG_NOPROG * CSI6$BBRR2_PP_UG_N	
CSI6$BBRR2_PP_UG_MAKEPROG_N <- CSI6$BBRR2_PP_UG_MAKEPROG * CSI6$BBRR2_PP_UG_N	
CSI6$BBRR2_PP_UG_PAIDINFULL_N <- CSI6$BBRR2_PP_UG_PAIDINFULL * CSI6$BBRR2_PP_UG_N	
CSI6$BBRR2_PP_UG_DISCHARGE_N <- CSI6$BBRR2_PP_UG_DISCHARGE * CSI6$BBRR2_PP_UG_N
# CSI6$BBRR2_PP_UGCOMP_N 
CSI6$BBRR2_PP_UGCOMP_DFLT_N <- CSI6$BBRR2_PP_UGCOMP_DFLT * CSI6$BBRR2_PP_UGCOMP_N
CSI6$BBRR2_PP_UGCOMP_DLNQ_N <- CSI6$BBRR2_PP_UGCOMP_DLNQ * CSI6$BBRR2_PP_UGCOMP_N
CSI6$BBRR2_PP_UGCOMP_FBR_N <- CSI6$BBRR2_PP_UGCOMP_FBR * CSI6$BBRR2_PP_UGCOMP_N
CSI6$BBRR2_PP_UGCOMP_DFR_N <- CSI6$BBRR2_PP_UGCOMP_DFR * CSI6$BBRR2_PP_UGCOMP_N
CSI6$BBRR2_PP_UGCOMP_NOPROG_N <- CSI6$BBRR2_PP_UGCOMP_NOPROG * CSI6$BBRR2_PP_UGCOMP_N
CSI6$BBRR2_PP_UGCOMP_MAKEPROG_N <- CSI6$BBRR2_PP_UGCOMP_MAKEPROG * CSI6$BBRR2_PP_UGCOMP_N	
CSI6$BBRR2_PP_UGCOMP_PAIDINFULL_N <- CSI6$BBRR2_PP_UGCOMP_PAIDINFULL * CSI6$BBRR2_PP_UGCOMP_N
CSI6$BBRR2_PP_UGCOMP_DISCHARGE_N <- CSI6$BBRR2_PP_UGCOMP_DISCHARGE * CSI6$BBRR2_PP_UGCOMP_N
# CSI6$BBRR2_PP_UGNOCOMP_N 	
CSI6$BBRR2_PP_UGNOCOMP_DFLT_N <- CSI6$BBRR2_PP_UGNOCOMP_DFLT * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_DLNQ_N <- CSI6$BBRR2_PP_UGNOCOMP_DLNQ * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_FBR_N <- CSI6$BBRR2_PP_UGNOCOMP_FBR * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_DFR_N <- CSI6$BBRR2_PP_UGNOCOMP_DFR * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_NOPROG_N <- CSI6$BBRR2_PP_UGNOCOMP_NOPROG * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_MAKEPROG_N <- CSI6$BBRR2_PP_UGNOCOMP_MAKEPROG * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_PAIDINFULL_N <- CSI6$BBRR2_PP_UGNOCOMP_PAIDINFULL * CSI6$BBRR2_PP_UGNOCOMP_N
CSI6$BBRR2_PP_UGNOCOMP_DISCHARGE_N <- CSI6$BBRR2_PP_UGNOCOMP_DISCHARGE * CSI6$BBRR2_PP_UGNOCOMP_N
# CSI6$BBRR3_PP_UG_N 
CSI6$BBRR3_PP_UG_DFLT_N <- CSI6$BBRR3_PP_UG_DFLT * CSI6$BBRR3_PP_UG_N
CSI6$BBRR3_PP_UG_DLNQ_N <- CSI6$BBRR3_PP_UG_DLNQ * CSI6$BBRR3_PP_UG_N
CSI6$BBRR3_PP_UG_FBR_N <- CSI6$BBRR3_PP_UG_FBR * CSI6$BBRR3_PP_UG_N
CSI6$BBRR3_PP_UG_DFR_N <- CSI6$BBRR3_PP_UG_DFR * CSI6$BBRR3_PP_UG_N
CSI6$BBRR3_PP_UG_NOPROG_N <- CSI6$BBRR3_PP_UG_NOPROG * CSI6$BBRR3_PP_UG_N	
CSI6$BBRR3_PP_UG_MAKEPROG_N <- CSI6$BBRR3_PP_UG_MAKEPROG * CSI6$BBRR3_PP_UG_N	
CSI6$BBRR3_PP_UG_PAIDINFULL_N <- CSI6$BBRR3_PP_UG_PAIDINFULL * CSI6$BBRR3_PP_UG_N
CSI6$BBRR3_PP_UG_DISCHARGE_N <- CSI6$BBRR3_PP_UG_DISCHARGE * CSI6$BBRR3_PP_UG_N
# CSI6$BBRR3_PP_UGCOMP_N 	
CSI6$BBRR3_PP_UGCOMP_DFLT_N <- CSI6$BBRR3_PP_UGCOMP_DFLT * CSI6$BBRR3_PP_UGCOMP_N 
CSI6$BBRR3_PP_UGCOMP_DLNQ_N <- CSI6$BBRR3_PP_UGCOMP_DLNQ * CSI6$BBRR3_PP_UGCOMP_N 
CSI6$BBRR3_PP_UGCOMP_FBR_N <- CSI6$BBRR3_PP_UGCOMP_FBR * CSI6$BBRR3_PP_UGCOMP_N 		
CSI6$BBRR3_PP_UGCOMP_DFR_N <- CSI6$BBRR3_PP_UGCOMP_DFR * CSI6$BBRR3_PP_UGCOMP_N 		
CSI6$BBRR3_PP_UGCOMP_NOPROG_N <- CSI6$BBRR3_PP_UGCOMP_NOPROG * CSI6$BBRR3_PP_UGCOMP_N 		
CSI6$BBRR3_PP_UGCOMP_MAKEPROG_N <- CSI6$BBRR3_PP_UGCOMP_MAKEPROG * CSI6$BBRR3_PP_UGCOMP_N 		
CSI6$BBRR3_PP_UGCOMP_PAIDINFULL_N <- CSI6$BBRR3_PP_UGCOMP_PAIDINFULL * CSI6$BBRR3_PP_UGCOMP_N 		
CSI6$BBRR3_PP_UGCOMP_DISCHARGE_N <- CSI6$BBRR3_PP_UGCOMP_DISCHARGE * CSI6$BBRR3_PP_UGCOMP_N 		
# CSI6$BBRR3_PP_UGNOCOMP_N 	
CSI6$BBRR3_PP_UGNOCOMP_DFLT_N <- CSI6$BBRR3_PP_UGNOCOMP_DFLT * CSI6$BBRR3_PP_UGNOCOMP_N 		
CSI6$BBRR3_PP_UGNOCOMP_DLNQ_N <- CSI6$BBRR3_PP_UGNOCOMP_DLNQ * CSI6$BBRR3_PP_UGNOCOMP_N 		
CSI6$BBRR3_PP_UGNOCOMP_FBR_N <- CSI6$BBRR3_PP_UGNOCOMP_FBR * CSI6$BBRR3_PP_UGNOCOMP_N 	
CSI6$BBRR3_PP_UGNOCOMP_DFR_N <- CSI6$BBRR3_PP_UGNOCOMP_DFR * CSI6$BBRR3_PP_UGNOCOMP_N 	
CSI6$BBRR3_PP_UGNOCOMP_NOPROG_N <- CSI6$BBRR3_PP_UGNOCOMP_NOPROG * CSI6$BBRR3_PP_UGNOCOMP_N 		
CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG_N <- CSI6$BBRR3_PP_UGNOCOMP_MAKEPROG * CSI6$BBRR3_PP_UGNOCOMP_N 	
CSI6$BBRR3_PP_UGNOCOMP_PAIDINFULL_N <- CSI6$BBRR3_PP_UGNOCOMP_PAIDINFULL * CSI6$BBRR3_PP_UGNOCOMP_N 	
CSI6$BBRR3_PP_UGNOCOMP_DISCHARGE_N <- CSI6$BBRR3_PP_UGNOCOMP_DISCHARGE * CSI6$BBRR3_PP_UGNOCOMP_N 	

#################################################################
### At this point, we filter out schools that do not have     ###
### the data we need for all variables.                       ###
#################################################################

CSI6.1 <- CSI6 %>% filter(is.na(BBRR1_PP_UG_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_DFLT_N)==FALSE
                          &
                          is.na(BBRR1_PP_UG_DLNQ_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_FBR_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_DFR_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_NOPROG_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_MAKEPROG_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_PAIDINFULL_N)==FALSE 
                          &
                          is.na(BBRR1_PP_UG_DISCHARGE)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_DFLT_N)==FALSE
                          &
                          is.na(BBRR2_PP_UG_DLNQ_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_FBR_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_DFR_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_NOPROG_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_MAKEPROG_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_PAIDINFULL_N)==FALSE 
                          &
                          is.na(BBRR2_PP_UG_DISCHARGE)==FALSE
                          &
                          is.na(BBRR3_PP_UG_N)==FALSE
                          &
                          is.na(BBRR3_PP_UG_DFLT_N)==FALSE
                          &
                          is.na(BBRR3_PP_UG_DLNQ_N)==FALSE
                          &
                          is.na(BBRR3_PP_UG_FBR_N)==FALSE 
                          &
                          is.na(BBRR3_PP_UG_DFR_N)==FALSE 
                          &
                          is.na(BBRR3_PP_UG_NOPROG_N)==FALSE 
                          &
                          is.na(BBRR3_PP_UG_MAKEPROG_N)==FALSE 
                          &
                          is.na(BBRR3_PP_UG_PAIDINFULL_N)==FALSE 
                          &
                          is.na(BBRR3_PP_UG_DISCHARGE)==FALSE
)

#################################################################
### Now we sum up these raw borrower totals and we bind these ###
### into one dataframe.                                       ###
#################################################################

tblB1.all <- aggregate(data=CSI6.1, cbind(BBRR1_PP_UG_N,
                                        BBRR1_PP_UG_DFLT_N, 
                                        BBRR1_PP_UG_DLNQ_N, 
                                        BBRR1_PP_UG_FBR_N, 
                                        BBRR1_PP_UG_DFR_N, 
                                        BBRR1_PP_UG_NOPROG_N, 
                                        BBRR1_PP_UG_MAKEPROG_N, 
                                        BBRR1_PP_UG_PAIDINFULL_N, 
                                        BBRR1_PP_UG_DISCHARGE_N) ~ CONTROL, FUN=sum)
tblB1.all$Year <- rep("1", nrow(tblB1.all))
names(tblB1.all) <- c("CONTROL", 
                      "BBRR_PP_UG_N",
                      "BBRR_PP_UG_DFLT_N", 
                      "BBRR_PP_UG_DLNQ_N", 
                      "BBRR_PP_UG_FBR_N", 
                      "BBRR_PP_UG_DFR_N", 
                      "BBRR_PP_UG_NOPROG_N", 
                      "BBRR_PP_UG_MAKEPROG_N", 
                      "BBRR_PP_UG_PAIDINFULL_N", 
                      "BBRR_PP_UG_DISCHARGE_N", 
                      "Year")
tblB2.all <- aggregate(data=CSI6.1, cbind(BBRR2_PP_UG_N,
                                        BBRR2_PP_UG_DFLT_N, 
                                        BBRR2_PP_UG_DLNQ_N, 
                                        BBRR2_PP_UG_FBR_N, 
                                        BBRR2_PP_UG_DFR_N, 
                                        BBRR2_PP_UG_NOPROG_N, 
                                        BBRR2_PP_UG_MAKEPROG_N, 
                                        BBRR2_PP_UG_PAIDINFULL_N, 
                                        BBRR2_PP_UG_DISCHARGE_N) ~ CONTROL, FUN=sum)
tblB2.all$Year <- rep("2", nrow(tblB2.all))
names(tblB2.all) <- c("CONTROL", 
                      "BBRR_PP_UG_N",
                      "BBRR_PP_UG_DFLT_N", 
                      "BBRR_PP_UG_DLNQ_N", 
                      "BBRR_PP_UG_FBR_N", 
                      "BBRR_PP_UG_DFR_N", 
                      "BBRR_PP_UG_NOPROG_N", 
                      "BBRR_PP_UG_MAKEPROG_N", 
                      "BBRR_PP_UG_PAIDINFULL_N", 
                      "BBRR_PP_UG_DISCHARGE_N", 
                      "Year")
tblB3.all <- aggregate(data=CSI6.1, cbind(BBRR3_PP_UG_N,
                                        BBRR3_PP_UG_DFLT_N, 
                                        BBRR3_PP_UG_DLNQ_N, 
                                        BBRR3_PP_UG_FBR_N, 
                                        BBRR3_PP_UG_DFR_N, 
                                        BBRR3_PP_UG_NOPROG_N, 
                                        BBRR3_PP_UG_MAKEPROG_N, 
                                        BBRR3_PP_UG_PAIDINFULL_N, 
                                        BBRR3_PP_UG_DISCHARGE_N) ~ CONTROL, FUN=sum)
tblB3.all$Year <- rep("3", nrow(tblB3.all))
names(tblB3.all) <- c("CONTROL", 
                      "BBRR_PP_UG_N",
                      "BBRR_PP_UG_DFLT_N", 
                      "BBRR_PP_UG_DLNQ_N", 
                      "BBRR_PP_UG_FBR_N", 
                      "BBRR_PP_UG_DFR_N", 
                      "BBRR_PP_UG_NOPROG_N", 
                      "BBRR_PP_UG_MAKEPROG_N", 
                      "BBRR_PP_UG_PAIDINFULL_N", 
                      "BBRR_PP_UG_DISCHARGE_N", 
                      "Year")
tblB <- rbind(tblB1.all, tblB2.all, tblB3.all)

#################################################################
### Now we take these raw borrower totals and turn them back  ###
### into percentage figures. We then chart the results.       ###
#################################################################

tblB$`Percentage in default` <- tblB$BBRR_PP_UG_DFLT_N / tblB$BBRR_PP_UG_N
tblB$`Percentage in delinquency` <- tblB$BBRR_PP_UG_DLNQ_N / tblB$BBRR_PP_UG_N
tblB$`Percentage in forbearance` <- tblB$BBRR_PP_UG_FBR_N / tblB$BBRR_PP_UG_N
tblB$`Percentage in deferment` <- tblB$BBRR_PP_UG_DFR_N / tblB$BBRR_PP_UG_N
tblB$`Percentage making no progress` <- tblB$BBRR_PP_UG_NOPROG_N / tblB$BBRR_PP_UG_N
tblB$`Percentage making progress` <- tblB$BBRR_PP_UG_MAKEPROG_N / tblB$BBRR_PP_UG_N
tblB$`Percentage paid in full` <- tblB$BBRR_PP_UG_PAIDINFULL_N / tblB$BBRR_PP_UG_N
tblB$`Percentage fully discharged` <- tblB$BBRR_PP_UG_DISCHARGE_N / tblB$BBRR_PP_UG_N
tblB$`Percentage in delinquency or default` <- tblB$`Percentage in default` + tblB$`Percentage in delinquency`

tblB$CONTROL <- as.factor(tblB$CONTROL)
ggplot(data=tblB, mapping=aes(x=Year, y=`Percentage in forbearance`, group=CONTROL)) + geom_line(aes(color=CONTROL)) + scale_y_continuous(labels = scales::percent_format(accuracy = 1))

#################################################################
### Now I want to link this to data on Pell grant recipients. ###
#################################################################

sfa1920 <- fread("sfa1920.csv", header=TRUE, select=c(
  "UNITID", 
  "UPGRNTP"
))
sfa1920$UPGRNTP <- as.numeric(sfa1920$UPGRNTP) / 100
CSI6 <- left_join(x=CSI6, y=sfa1920, by="UNITID")

#################################################################
### Let's now plot out how 2-year default rates vary based on ###
### the percentage of students who receive Pell.              ###
#################################################################

CSI6.2 <- CSI6 %>% filter(is.na(BBRR3_PP_UG_DFLT)==FALSE) 

ggplot(data=CSI6.2, mapping=aes(x=UPGRNTP, y=BBRR3_PP_UG_DFLT)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who receive Pell", y="Percentage of Parent PLUS borrowers in default after 3 years")
default.pell.chart <- CSI6.2 %>% select(INSTNM, UPGRNTP, BBRR3_PP_UG_DFLT)

#################################################################
### We'll now do the same thing but for Black and Hispanic    ###
### undergraduate enrollment.                                 ###
#################################################################

effy2020 <- fread("effy2020.csv", header=TRUE, select=c(
  "UNITID",     # Unique identification number of the institution
  "EFFYALEV",   # Level and degree/certificate-seeking status of student
  "EFYTOTLT",   # Grand total
  "EFYBKAAT",   # Black or African American total
  "EFYHISPT"    # Hispanic or Latino total
)) %>% filter(EFFYALEV==2) # All students, Undergraduate total
effy2020$`Black share of undergraduates` <- effy2020$EFYBKAAT / effy2020$EFYTOTLT
effy2020$`Hispanic share of undergraduates` <- effy2020$EFYHISPT / effy2020$EFYTOTLT
effy2020 <- effy2020 %>% select(UNITID, `Black share of undergraduates`, `Hispanic share of undergraduates`)
CSI6 <- left_join(x=CSI6, y=effy2020, by="UNITID")
CSI6.2 <- CSI6 %>% filter(is.na(BBRR3_PP_UG_DFLT)==FALSE)

# By Black enrollment share: 
ggplot(data=CSI6.2, mapping=aes(x=`Black share of undergraduates`, y=BBRR3_PP_UG_DFLT)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who are Black", y="Percentage of Parent PLUS borrowers in default after 3 years")

# By Hispanic enrollment share 
ggplot(data=CSI6.2, mapping=aes(x=`Hispanic share of undergraduates`, y=BBRR3_PP_UG_DFLT)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who are Hispanic", y="Percentage of Parent PLUS borrowers in default after 3 years")

#################################################################
### Let's now do the same for those making progress on PLUS.  ###
#################################################################

CSI6.3 <- CSI6 %>% filter(is.na(BBRR3_PP_UG_MAKEPROG)==FALSE)

# By Pell
ggplot(data=CSI6.3, mapping=aes(x=UPGRNTP, y=BBRR3_PP_UG_MAKEPROG)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who receive Pell", y="Percentage of Parent PLUS borrowers making progress after 3 years")

# By Black enrollment
ggplot(data=CSI6.3, mapping=aes(x=`Black share of undergraduates`, y=BBRR3_PP_UG_MAKEPROG)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who are Black", y="Percentage of Parent PLUS borrowers making progress after 3 years")
progress.black.chart <- CSI6.3 %>% select(INSTNM, BBRR3_PP_UG_MAKEPROG, `Black share of undergraduates`)

# By Hispanic enrollment 
ggplot(data=CSI6.3, mapping=aes(x=`Hispanic share of undergraduates`, y=BBRR3_PP_UG_MAKEPROG)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who are Hispanic", y="Percentage of Parent PLUS borrowers making progress after 3 years")

#################################################################
### We'll now do the same for those who have paid in full.    ###
#################################################################

CSI6.4 <- CSI6 %>% filter(is.na(BBRR3_PP_UG_PAIDINFULL)==FALSE)

# By Pell
ggplot(data=CSI6.4, mapping=aes(x=UPGRNTP, y=BBRR3_PP_UG_PAIDINFULL)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who receive Pell", y="Percentage of Parent PLUS borrowers who have paid in full after 3 years")

# By Black enrollment
ggplot(data=CSI6.4, mapping=aes(x=`Black share of undergraduates`, y=BBRR3_PP_UG_PAIDINFULL)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who are Black", y="Percentage of Parent PLUS borrowers who have paid in full after 3 years")
payfull.black.chart <- CSI6.4 %>% select(INSTNM, BBRR3_PP_UG_PAIDINFULL, `Black share of undergraduates`)

# By Hispanic enrollment 
ggplot(data=CSI6.4, mapping=aes(x=`Hispanic share of undergraduates`, y=BBRR3_PP_UG_PAIDINFULL)) + geom_point(alpha = 0.3) + scale_y_continuous(labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(labels = scales::percent_format(accuracy = 1)) + labs(x="Percentage of undergraduates who are Hispanic", y="Percentage of Parent PLUS borrowers who have paid in full after 3 years")

#################################################################
### Let's now return to the repayment outcomes for completers ###
### and for non-completers.                                   ###
#################################################################

CSI6.5 <- CSI6 %>% select(UNITID, 
                          INSTNM, 
                          CONTROL,
                          BBRR3_PP_UGCOMP_DFLT.modified,
                          BBRR3_PP_UGNOCOMP_DFLT.modified,
                          BBRR3_PP_UGCOMP_N,
                          BBRR3_PP_UGNOCOMP_N                          
                          ) %>% filter(
                            is.na(BBRR3_PP_UGCOMP_DFLT.modified)==FALSE
                            &
                            is.na(BBRR3_PP_UGNOCOMP_DFLT.modified)==FALSE)

ggplot(data=CSI6.5, mapping=aes(x=BBRR3_PP_UGCOMP_DFLT.modified, y=BBRR3_PP_UGNOCOMP_DFLT.modified)) + geom_point(alpha=0.3)

CSI6.5$BBRR3_PP_UGCOMP_DFLT_N <- CSI6.5$BBRR3_PP_UGCOMP_DFLT.modified * CSI6.5$BBRR3_PP_UGCOMP_N
CSI6.5$BBRR3_PP_UGNOCOMP_DFLT_N <- CSI6.5$BBRR3_PP_UGNOCOMP_DFLT.modified * CSI6.5$BBRR3_PP_UGNOCOMP_N

share.of.completers.parents.who.default <- sum(CSI6.5$BBRR3_PP_UGCOMP_DFLT_N, na.rm=TRUE) / sum(CSI6.5$BBRR3_PP_UGCOMP_N, na.rm=TRUE)
share.of.noncompleters.parents.who.default <- sum(CSI6.5$BBRR3_PP_UGNOCOMP_DFLT_N, na.rm=TRUE) / sum(CSI6.5$BBRR3_PP_UGNOCOMP_N, na.rm=TRUE)

#################################################################
### And now the same for the share making progress on loans.  ###
#################################################################

CSI6.6 <- CSI6 %>% select(UNITID, 
                          INSTNM, 
                          CONTROL,
                          BBRR3_PP_UGCOMP_MAKEPROG.modified,
                          BBRR3_PP_UGNOCOMP_MAKEPROG.modified,
                          BBRR3_PP_UGCOMP_N,
                          BBRR3_PP_UGNOCOMP_N                          
                          ) %>% filter(
                            is.na(BBRR3_PP_UGCOMP_MAKEPROG.modified)==FALSE
                            &
                              is.na(BBRR3_PP_UGNOCOMP_MAKEPROG.modified)==FALSE)

ggplot(data=CSI6.6, mapping=aes(x=BBRR3_PP_UGCOMP_MAKEPROG.modified, y=BBRR3_PP_UGNOCOMP_MAKEPROG.modified)) + geom_point(alpha=0.3)

CSI6.6$BBRR3_PP_UGCOMP_MAKEPROG_N <- CSI6.6$BBRR3_PP_UGCOMP_MAKEPROG.modified * CSI6.6$BBRR3_PP_UGCOMP_N
CSI6.6$BBRR3_PP_UGNOCOMP_MAKEPROG_N <- CSI6.6$BBRR3_PP_UGNOCOMP_MAKEPROG.modified * CSI6.6$BBRR3_PP_UGNOCOMP_N

share.of.completers.parents.makingprogress <- sum(CSI6.6$BBRR3_PP_UGCOMP_MAKEPROG_N, na.rm=TRUE) / sum(CSI6.6$BBRR3_PP_UGCOMP_N, na.rm=TRUE)
share.of.noncompleters.parents.makingprogress <- sum(CSI6.6$BBRR3_PP_UGNOCOMP_MAKEPROG_N, na.rm=TRUE) / sum(CSI6.6$BBRR3_PP_UGNOCOMP_N, na.rm=TRUE)


#################################################################
### Now I'm curious. How does the default rate compare to the ###
### rate for undergrad loans?                                 ###
#################################################################

CSI8 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM",       
  "HBCU", 
  "CONTROL",
  "BBRR3_PP_UG_N",
  "BBRR3_PP_UG_DFLT",
  "BBRR3_FED_UG_N",
  "BBRR3_FED_UG_DFLT"
)) %>% filter(duplicated(OPEID6)==FALSE)

CSI8$BBRR3_PP_UG_N <- as.numeric(CSI8$BBRR3_PP_UG_N)
CSI8$BBRR3_PP_UG_DFLT <- as.numeric(CSI8$BBRR3_PP_UG_DFLT)
CSI8$BBRR3_FED_UG_N <- as.numeric(CSI8$BBRR3_FED_UG_N)
CSI8$BBRR3_FED_UG_DFLT <- as.numeric(CSI8$BBRR3_FED_UG_DFLT)

CSI8 <- CSI8 %>% filter(is.na(BBRR3_PP_UG_DFLT)==FALSE & is.na(BBRR3_FED_UG_DFLT)==FALSE)

ggplot(data=CSI8, mapping=aes(x=BBRR3_FED_UG_DFLT, y=BBRR3_PP_UG_DFLT)) + geom_point(alpha=0.3) + scale_y_continuous(lim=c(0, 0.3), labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(lim=c(0, 0.3), labels = scales::percent_format(accuracy = 1)) + labs(x="3-year default rate of federal undergraduate loans (excluding PLUS)", y="3-year default rate of Parent PLUS loans") + geom_abline(intercept = 0, slope = 1, color="black")
cor(CSI8$BBRR3_PP_UG_DFLT, CSI8$BBRR3_FED_UG_DFLT)
lm(BBRR3_FED_UG_DFLT ~ BBRR3_PP_UG_DFLT, data=CSI8)


#################################################################
###                                                           ###
###  Section 13: Dollar-based repayment rates (DBRR) by race  ###
###                                                           ###
#################################################################

##################################################################
### First we load in the institution-level Scorecard data with ###
### the the repayment rates in the 1, 4, 5, 10, and 20 year    ###
### cohorts. We also make numeric adjustments and filter for   ###
### institutions with full data for these years.               ###
##################################################################

CSI9 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "INSTNM", 
  "OPEID6",
  "HBCU",
  "CONTROL",
  "DBRR1_PP_UG_N", 
  "DBRR4_PP_UG_N", 
  "DBRR5_PP_UG_N", 
  "DBRR10_PP_UG_N", 
  "DBRR1_PP_UG_NUM", 
  "DBRR1_PP_UG_DEN",
  "DBRR4_PP_UG_NUM", 
  "DBRR4_PP_UG_DEN",
  "DBRR5_PP_UG_NUM", 
  "DBRR5_PP_UG_DEN",
  "DBRR10_PP_UG_NUM", 
  "DBRR10_PP_UG_DEN"
)) %>% filter(duplicated(OPEID6)==FALSE)

CSI9$DBRR1_PP_UG_N <- as.numeric(CSI9$DBRR1_PP_UG_N) 
CSI9$DBRR1_PP_UG_NUM <- as.numeric(CSI9$DBRR1_PP_UG_NUM) 
CSI9$DBRR1_PP_UG_DEN <- as.numeric(CSI9$DBRR1_PP_UG_DEN)
CSI9$DBRR4_PP_UG_N <- as.numeric(CSI9$DBRR4_PP_UG_N) 
CSI9$DBRR4_PP_UG_NUM <- as.numeric(CSI9$DBRR4_PP_UG_NUM) 
CSI9$DBRR4_PP_UG_DEN <- as.numeric(CSI9$DBRR4_PP_UG_DEN)
CSI9$DBRR5_PP_UG_N <- as.numeric(CSI9$DBRR5_PP_UG_N) 
CSI9$DBRR5_PP_UG_NUM <- as.numeric(CSI9$DBRR5_PP_UG_NUM) 
CSI9$DBRR5_PP_UG_DEN <- as.numeric(CSI9$DBRR5_PP_UG_DEN)
CSI9$DBRR10_PP_UG_N <- as.numeric(CSI9$DBRR10_PP_UG_N) 
CSI9$DBRR10_PP_UG_NUM <- as.numeric(CSI9$DBRR10_PP_UG_NUM) 
CSI9$DBRR10_PP_UG_DEN <- as.numeric(CSI9$DBRR10_PP_UG_DEN) 

CSI9 <- CSI9 %>% filter(is.na(CSI9$DBRR1_PP_UG_NUM)==FALSE
                        &
                        is.na(CSI9$DBRR1_PP_UG_DEN)==FALSE
                        &
                        is.na(CSI9$DBRR4_PP_UG_NUM)==FALSE
                        &
                        is.na(CSI9$DBRR4_PP_UG_DEN)==FALSE
                        &
                        is.na(CSI9$DBRR5_PP_UG_NUM)==FALSE
                        &
                        is.na(CSI9$DBRR5_PP_UG_DEN)==FALSE
                        &
                        is.na(CSI9$DBRR10_PP_UG_NUM)==FALSE
                        &
                        is.na(CSI9$DBRR10_PP_UG_DEN)==FALSE)

CSI9 <- CSI9 %>% filter(DBRR1_PP_UG_N >= 30 
                        & 
                        DBRR4_PP_UG_N >= 30
                        &
                        DBRR5_PP_UG_N >= 30
                        & 
                        DBRR10_PP_UG_N >= 30)

##################################################################
### Now we pull in data on enrollment by race and rank schools ###
### by Black and white enrollment shares. We filter for at     ###
### minimum 1,000 enrolled undergraduates.                     ###
##################################################################

effy2020 <- fread("effy2020.csv", header=TRUE, select=c(
  "UNITID", 
  "EFFYALEV", 
  "EFYTOTLT", 
  "EFYBKAAT", 
  "EFYWHITT"
)) %>% filter(EFFYALEV==2) %>% filter(EFYTOTLT > 1000)

effy2020$EFYBKAAT[is.na(effy2020$EFYBKAAT)] <- 0
effy2020$EFYWHITT[is.na(effy2020$EFYWHITT)] <- 0
effy2020$EFYTOTLT[is.na(effy2020$EFYTOTLT)] <- 0

effy2020$`Black share of undergraduates` <- effy2020$EFYBKAAT / effy2020$EFYTOTLT
effy2020$`White share of undergraduates` <- effy2020$EFYWHITT / effy2020$EFYTOTLT
effy2020 <- effy2020 %>% select(UNITID, `Black share of undergraduates`, `White share of undergraduates`)
CSI9 <- inner_join(x=CSI9, y=effy2020, by="UNITID")

CSI9$`Rank of Black share` <- rank(CSI9$`Black share of undergraduates`, ties.method = "first")
CSI9$`Rank of white share` <- rank(CSI9$`White share of undergraduates`, ties.method = "first")

CSI9$`Top 100 for Black share` <- ifelse(CSI9$`Rank of Black share` > (nrow(CSI9) - 100), 1, 0)
CSI9$`Top 100 for white share` <- ifelse(CSI9$`Rank of white share` > (nrow(CSI9) - 100), 1, 0)

CSI9$`Group` <- ifelse(CSI9$`Top 100 for Black share`==1, "Top 100 for Black share of undergrads", ifelse(CSI9$`Top 100 for white share`==1, "Top 100 for white share of undergrads", NA))

##################################################################
### Now we aggregate.                                          ###
##################################################################

CSI9.1 <- CSI9 %>% filter(is.na(Group)==FALSE)
tblD <- aggregate(data=CSI9.1, cbind(DBRR1_PP_UG_NUM, 
                                     DBRR1_PP_UG_DEN, 
                                     DBRR4_PP_UG_NUM, 
                                     DBRR4_PP_UG_DEN, 
                                     DBRR5_PP_UG_NUM, 
                                     DBRR5_PP_UG_DEN, 
                                     DBRR10_PP_UG_NUM, 
                                     DBRR10_PP_UG_DEN) ~ Group, FUN=sum)

tblD$DBRR1_PP_UG_RATE <- tblD$DBRR1_PP_UG_NUM / tblD$DBRR1_PP_UG_DEN
tblD$DBRR4_PP_UG_RATE <- tblD$DBRR4_PP_UG_NUM / tblD$DBRR4_PP_UG_DEN
tblD$DBRR5_PP_UG_RATE <- tblD$DBRR5_PP_UG_NUM / tblD$DBRR5_PP_UG_DEN
tblD$DBRR10_PP_UG_RATE <- tblD$DBRR10_PP_UG_NUM / tblD$DBRR10_PP_UG_DEN

tblDD <- data.frame("Year" = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
                               1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 
                    "Repayment rate" = c(tblD$DBRR1_PP_UG_RATE[tblD$Group=="Top 100 for Black share of undergrads"], 
                                         NA, # 2
                                         NA, # 3
                                         tblD$DBRR4_PP_UG_RATE[tblD$Group=="Top 100 for Black share of undergrads"], 
                                         tblD$DBRR5_PP_UG_RATE[tblD$Group=="Top 100 for Black share of undergrads"],
                                         NA, # 6
                                         NA, # 7
                                         NA, # 8
                                         NA, # 9
                                         tblD$DBRR10_PP_UG_RATE[tblD$Group=="Top 100 for Black share of undergrads"], 
                                         tblD$DBRR1_PP_UG_RATE[tblD$Group=="Top 100 for white share of undergrads"], 
                                         NA, # 2
                                         NA, # 3
                                         tblD$DBRR4_PP_UG_RATE[tblD$Group=="Top 100 for white share of undergrads"], 
                                         tblD$DBRR5_PP_UG_RATE[tblD$Group=="Top 100 for white share of undergrads"],
                                         NA, # 6
                                         NA, # 7
                                         NA, # 8
                                         NA, # 9
                                         tblD$DBRR10_PP_UG_RATE[tblD$Group=="Top 100 for white share of undergrads"]), 
                    "Group"=c(rep("Top 100 for Black share of undergrads", 10), rep("Top 100 for white share of undergrads", 10)))
tblDDchart <- na.omit(tblDD)

# Let's now add a spot for year 0. 
tblDDchart <- tblDDchart %>% add_row(Year = 0, Repayment.rate = 1, Group = "Top 100 for Black share of undergrads")
tblDDchart <- tblDDchart %>% add_row(Year = 0, Repayment.rate = 1, Group = "Top 100 for white share of undergrads")

ggplot(data=tblDDchart, mapping=aes(x=Year, y=`Repayment.rate`, color=Group)) + geom_line() + geom_point() + scale_y_continuous(limits=c(0, 1.5)) + scale_x_continuous(breaks=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)) + labs(title = "Ratio of outstanding Parent PLUS balance to original disbursements: 1, 4, 5, and 10-year cohorts", subtitle = "Minimum 1,000 students in 2019-20 headcount enrollment", y = "Ratio of outstanding balance to original disbursement", x = "Years from repayment start")

###############
# What about a chart where all of the two top 100 sets are included? 
###############

CSI9.2 <- CSI9 %>% filter(is.na(Group)==FALSE)
CSI9.2$DBRR1_PP_UG_RATE <- CSI9.2$DBRR1_PP_UG_NUM / CSI9.2$DBRR1_PP_UG_DEN
CSI9.2$DBRR4_PP_UG_RATE <- CSI9.2$DBRR4_PP_UG_NUM / CSI9.2$DBRR4_PP_UG_DEN
CSI9.2$DBRR5_PP_UG_RATE <- CSI9.2$DBRR5_PP_UG_NUM / CSI9.2$DBRR5_PP_UG_DEN
CSI9.2$DBRR10_PP_UG_RATE <- CSI9.2$DBRR10_PP_UG_NUM / CSI9.2$DBRR10_PP_UG_DEN

tblM <- data.frame("UNITID"=rep(CSI9.2$UNITID, 5), 
                   "INSTNM"=rep(CSI9.2$INSTNM, 5), 
                   "Group"=rep(CSI9.2$Group, 5),
                   "Year"=c(rep(0, 200), rep(1, 200), rep(4, 200), rep(5, 200), rep(10, 200)), 
                   "Ratio"=c(rep(1, 200), CSI9.2$DBRR1_PP_UG_RATE, CSI9.2$DBRR4_PP_UG_RATE, CSI9.2$DBRR5_PP_UG_RATE, CSI9.2$DBRR10_PP_UG_RATE)
)

tblM.B <- tblM %>% filter(Group=="Top 100 for Black share of undergrads")
tblM.W <- tblM %>% filter(Group=="Top 100 for white share of undergrads")

ggplot(data=tblM, mapping=aes(x=Year, group=INSTNM)) + geom_line(data=tblM, aes(y=Ratio, color=Group), alpha=0.3, size=0.5) + geom_point(data=tblM, aes(y=Ratio, color=Group), alpha=0.3, size=0.5) + scale_x_continuous(breaks=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), labels = scales::number_format(accuracy = 1)) + labs(y = "Ratio of outstanding balance to original disbursement", x = "Years from repayment start")

#######
# Okay, what if we did top 50 each?
#######

CSI9.3 <- CSI9
CSI9.3$`Top 50 for Black share` <- ifelse(CSI9.3$`Rank of Black share` > (nrow(CSI9.3) - 50), 1, 0)
CSI9.3$`Top 50 for white share` <- ifelse(CSI9.3$`Rank of white share` > (nrow(CSI9.3) - 50), 1, 0)

CSI9.3$`Group` <- ifelse(CSI9.3$`Top 50 for Black share`==1, "Top 50 for Black share of undergrads", ifelse(CSI9.3$`Top 50 for white share`==1, "Top 50 for white share of undergrads", NA))

CSI9.3 <- CSI9.3 %>% filter(is.na(Group)==FALSE)

tblD2 <- aggregate(data=CSI9.3, cbind(DBRR1_PP_UG_NUM, 
                                     DBRR1_PP_UG_DEN, 
                                     DBRR4_PP_UG_NUM, 
                                     DBRR4_PP_UG_DEN, 
                                     DBRR5_PP_UG_NUM, 
                                     DBRR5_PP_UG_DEN, 
                                     DBRR10_PP_UG_NUM, 
                                     DBRR10_PP_UG_DEN) ~ Group, FUN=sum)
tblD2$DBRR1_PP_UG_RATE <- tblD2$DBRR1_PP_UG_NUM / tblD2$DBRR1_PP_UG_DEN
tblD2$DBRR4_PP_UG_RATE <- tblD2$DBRR4_PP_UG_NUM / tblD2$DBRR4_PP_UG_DEN
tblD2$DBRR5_PP_UG_RATE <- tblD2$DBRR5_PP_UG_NUM / tblD2$DBRR5_PP_UG_DEN
tblD2$DBRR10_PP_UG_RATE <- tblD2$DBRR10_PP_UG_NUM / tblD2$DBRR10_PP_UG_DEN

CSI9.3$DBRR1_PP_UG_RATE <- CSI9.3$DBRR1_PP_UG_NUM / CSI9.3$DBRR1_PP_UG_DEN
CSI9.3$DBRR4_PP_UG_RATE <- CSI9.3$DBRR4_PP_UG_NUM / CSI9.3$DBRR4_PP_UG_DEN
CSI9.3$DBRR5_PP_UG_RATE <- CSI9.3$DBRR5_PP_UG_NUM / CSI9.3$DBRR5_PP_UG_DEN
CSI9.3$DBRR10_PP_UG_RATE <- CSI9.3$DBRR10_PP_UG_NUM / CSI9.3$DBRR10_PP_UG_DEN

tblN <- data.frame("UNITID"=rep(CSI9.3$UNITID, 5), 
                   "INSTNM"=rep(CSI9.3$INSTNM, 5), 
                   "Group"=rep(CSI9.3$Group, 5),
                   "Year"=c(rep(0, 100), rep(1, 100), rep(4, 100), rep(5, 100), rep(10, 100)), 
                   "Ratio"=c(rep(1, 100), CSI9.3$DBRR1_PP_UG_RATE, CSI9.3$DBRR4_PP_UG_RATE, CSI9.3$DBRR5_PP_UG_RATE, CSI9.3$DBRR10_PP_UG_RATE)
)

tblN.B <- tblN %>% filter(Group=="Top 50 for Black share of undergrads", Year == 10) %>% select(INSTNM, Ratio)
tblN.W <- tblN %>% filter(Group=="Top 50 for white share of undergrads", Year == 10) %>% select(INSTNM, Ratio)

ggplot(data=tblN, mapping=aes(x=Year, group=INSTNM)) + geom_line(data=tblN, aes(y=Ratio, color=Group), alpha=0.3, size=0.5) + geom_point(data=tblN, aes(y=Ratio, color=Group), alpha=0.3, size=0.5) + scale_x_continuous(breaks=c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), labels = scales::number_format(accuracy = 1)) + labs(y = "Ratio of outstanding balance to original disbursement", x = "Years from repayment start") + scale_y_continuous(lim=c(0, 1.4)) # FIGURE 3



##################################################################
### I'm interested in seeing whether small loans have a larger ###
### remaining ratio than larger loans.                         ###
##################################################################

CSI10 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "INSTNM", 
  "OPEID6",
  "HBCU",
  "CONTROL",
  "DBRR10_PP_UG_N",
  "DBRR10_PP_UG_NUM", 
  "DBRR10_PP_UG_DEN"
)) %>% filter(duplicated(OPEID6)==FALSE)

CSI10$DBRR10_PP_UG_N <- as.numeric(CSI10$DBRR10_PP_UG_N)
CSI10$DBRR10_PP_UG_NUM <- as.numeric(CSI10$DBRR10_PP_UG_NUM)
CSI10$DBRR10_PP_UG_DEN <- as.numeric(CSI10$DBRR10_PP_UG_DEN)

CSI10 <- CSI10 %>% filter(is.na(DBRR10_PP_UG_N)==FALSE
                          & 
                          is.na(DBRR10_PP_UG_NUM)==FALSE
                          &
                          is.na(DBRR10_PP_UG_DEN)==FALSE)

CSI10 <- CSI10 %>% filter(DBRR10_PP_UG_N >= 30)

CSI10$AveragePLUS <- CSI10$DBRR10_PP_UG_DEN / CSI10$DBRR10_PP_UG_N
CSI10$Ratio <- CSI10$DBRR10_PP_UG_NUM / CSI10$DBRR10_PP_UG_DEN

ggplot(data=CSI10, mapping=aes(x=AveragePLUS, y=Ratio)) + geom_point(alpha=0.2) + labs(x="Average PLUS loan amount at origination for 10-year cohort", y="Ratio of outstanding balance to original principal at 10 years") + scale_x_continuous(labels=scales::dollar_format())


##################################################################
### We now link this to data on race.                          ###
##################################################################

effy2020 <- fread("effy2020.csv", header=TRUE, select=c(
  "UNITID", 
  "EFFYALEV", 
  "EFYTOTLT", 
  "EFYBKAAT", 
  "EFYWHITT"
)) %>% filter(EFFYALEV==2) %>% filter(EFYTOTLT > 1000)

effy2020$EFYBKAAT[is.na(effy2020$EFYBKAAT)] <- 0
effy2020$EFYWHITT[is.na(effy2020$EFYWHITT)] <- 0
effy2020$EFYTOTLT[is.na(effy2020$EFYTOTLT)] <- 0

effy2020$`Black share of undergraduates` <- effy2020$EFYBKAAT / effy2020$EFYTOTLT
effy2020$`White share of undergraduates` <- effy2020$EFYWHITT / effy2020$EFYTOTLT
effy2020 <- effy2020 %>% select(UNITID, `Black share of undergraduates`, `White share of undergraduates`)
CSI10 <- inner_join(x=CSI10, y=effy2020, by="UNITID")

CSI10$`Rank of Black share` <- rank(CSI10$`Black share of undergraduates`, ties.method = "first")
CSI10$`Rank of white share` <- rank(CSI10$`White share of undergraduates`, ties.method = "first")

CSI10$`Top 50 for Black share` <- ifelse(CSI10$`Rank of Black share` > (nrow(CSI10) - 50), 1, 0)
CSI10$`Top 50 for white share` <- ifelse(CSI10$`Rank of white share` > (nrow(CSI10) - 50), 1, 0)

CSI10$`Group` <- ifelse(CSI10$`Top 50 for Black share`==1, "Top 50 for Black share of undergrads", ifelse(CSI10$`Top 50 for white share`==1, "Top 50 for white share of undergrads", NA))

###################################################################
### Let's now view the prior chart using these top 100 filters. ###
###################################################################

CSI10A <- CSI10 %>% filter(is.na(Group)==FALSE)
ggplot(data=CSI10A, mapping=aes(x=AveragePLUS, y=Ratio)) + geom_point(alpha=0.3) + facet_grid (~ Group) + labs(x="Average PLUS loan amount at origination for 10-year cohort", y="Ratio of outstanding balance to original principal at 10 years") + scale_x_continuous(lim=c(0, 40000), labels=scales::dollar_format()) + scale_y_continuous(lim=c(0, 1.2))

# I also want to print out this data. (5-2-22)
example99 <- CSI10 %>% select(INSTNM, DBRR10_PP_UG_NUM, DBRR10_PP_UG_DEN, Ratio, `Black share of undergraduates`, `White share of undergraduates`, `Rank of Black share`, `Rank of white share`, `Top 100 for Black share`, `Top 100 for white share`, Group)
write.csv(example99, "output-05-02-2022.csv", row.names=FALSE)

#################################################################
###                                                           ###
###       Section 14: Median PLUS loads by Pell status        ###
###                                                           ###
#################################################################

CSI11 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "INSTNM", 
  "OPEID6",
  "HBCU",
  "CONTROL",
  "PPLUS_PCT_LOW",
  "PPLUS_PCT_HIGH",
  "PLUS_DEBT_INST_N",
  "PLUS_DEBT_INST_MD",
  "PLUS_DEBT_INST_PELL_N",
  "PLUS_DEBT_INST_PELL_MD"
)) %>% filter(duplicated(OPEID6)==FALSE)

CSI11$PPLUS_PCT_LOW <- as.numeric(CSI11$PPLUS_PCT_LOW)
CSI11$PPLUS_PCT_HIGH <- as.numeric(CSI11$PPLUS_PCT_HIGH)
CSI11$PLUS_DEBT_INST_N <- as.numeric(CSI11$PLUS_DEBT_INST_N)
CSI11$PLUS_DEBT_INST_MD <- as.numeric(CSI11$PLUS_DEBT_INST_MD)
CSI11$PLUS_DEBT_INST_PELL_N <- as.numeric(CSI11$PLUS_DEBT_INST_PELL_N)
CSI11$PLUS_DEBT_INST_PELL_MD <- as.numeric(CSI11$PLUS_DEBT_INST_PELL_MD)

CSI11 <- CSI11 %>% filter(is.na(PLUS_DEBT_INST_N)==FALSE
                          &
                          is.na(PLUS_DEBT_INST_MD)==FALSE
                          & 
                          is.na(PLUS_DEBT_INST_PELL_N)==FALSE
                          & 
                          is.na(PLUS_DEBT_INST_PELL_MD)==FALSE)

CSI11$`Share of PLUS borrowers who receive Pell` <- CSI11$PLUS_DEBT_INST_PELL_N / CSI11$PLUS_DEBT_INST_N

CSI11$CONTROL <- as.factor(CSI11$CONTROL)
ggplot(data=CSI11, mapping=aes(x=PLUS_DEBT_INST_MD, y=PLUS_DEBT_INST_PELL_MD, color=CONTROL)) + geom_point(alpha=0.2) + geom_abline(intercept = 0, slope = 1, color="black")

ggplot(data=CSI11, mapping=aes(x=CONTROL, y=`Share of PLUS borrowers who receive Pell`))+geom_point(alpha=0.2)
aggregate(data=CSI11, `Share of PLUS borrowers who receive Pell` ~ CONTROL, FUN=median) # STAT 14

#################################################################
### How does this differ for HCBUs?                           ###
#################################################################

aggregate(data=CSI11, `Share of PLUS borrowers who receive Pell` ~ HBCU, FUN=median) # STAT 15

#################################################################
### Now I'm going to find the inverse: PLUS as a percentage   ###
### of Pell recipients.                                       ###
#################################################################

sfa1819 <- fread("sfa1819_rv.csv", header=TRUE, select=c(
  "UNITID", 
  "UPGRNTN"
))
names(sfa1819) <- c("UNITID", "UPGRNTN.1819")
sfa1920 <- fread("sfa1920.csv", header=TRUE, select=c(
  "UNITID", 
  "UPGRNTN"
))
names(sfa1920) <- c("UNITID", "UPGRNTN.1920")

sfa <- inner_join(x=sfa1819, y=sfa1920, by="UNITID")
sfa$UPGRNTN.1819 <- as.numeric(sfa$UPGRNTN.1819)
sfa$UPGRNTN.1920 <- as.numeric(sfa$UPGRNTN.1920)
sfa <- sfa %>% filter(is.na(UPGRNTN.1819)==FALSE & is.na(UPGRNTN.1920)==FALSE)

sfa$`UPGRNTN.all` <- sfa$UPGRNTN.1819 + sfa$UPGRNTN.1920
sfa <- sfa %>% select(UNITID, UPGRNTN.all)

###################################################################
### Here, we have to aggregate total Pell recipients by OPEID6. ###
### That's most easily done using Scorecard's OPEID6 to UNITID  ###
### linking.                                                    ###
###################################################################

CSI12 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "INSTNM", 
  "OPEID6"
)) 
CSI12 <- inner_join(x=CSI12, y=sfa, by="UNITID")
pell.by.OPEID6 <- aggregate(data=CSI12, UPGRNTN.all ~ OPEID6, FUN=sum)

CSI11.1 <- inner_join(x=CSI11, y=pell.by.OPEID6, by="OPEID6")
CSI11.1$`Share of Pell recipients who receive PLUS` <- CSI11.1$PLUS_DEBT_INST_PELL_N / CSI11.1$UPGRNTN.all
aggregate(data=CSI11.1, `Share of Pell recipients who receive PLUS` ~ CONTROL, FUN=median)
aggregate(data=CSI11.1, `Share of Pell recipients who receive PLUS` ~ HBCU, FUN=median)

filterset1 <- CSI11.1 %>% select(INSTNM, HBCU, `Share of Pell recipients who receive PLUS`)

###################################################################
### I'm just doing a quick filter here.                         ###
###################################################################

tblQF <- CSI11 %>% filter(PPLUS_PCT_LOW >= 25
                          &
                          PLUS_DEBT_INST_MD >= 40000
                          & 
                          PLUS_DEBT_INST_PELL_MD >= 20000)

effy2020.1 <- fread("effy2020.csv", header=TRUE, select=c(
  "UNITID", 
  "EFFYALEV", 
  "EFYTOTLT"
)) %>% filter(EFFYALEV==2)

tblQF <- left_join(x=tblQF, y=effy2020.1, by="UNITID") %>% filter(EFYTOTLT > 2000) # STAT 19


#################################################################
###                                                           ###
###   Section 15: Repayment for completers vs noncompleters   ###
###                                                           ###
#################################################################

CSI13 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "CONTROL",
  "OPEID6",
  "HBCU",
  "DBRR4_PP_UGCOMP_NUM",
  "DBRR4_PP_UGCOMP_DEN",
  "DBRR4_PP_UGCOMP_RT", 
  "DBRR4_PP_UGNOCOMP_NUM",
  "DBRR4_PP_UGNOCOMP_DEN",
  "DBRR4_PP_UGNOCOMP_RT"
)) %>% filter(duplicated(OPEID6))
CSI13$DBRR4_PP_UGCOMP_RT <- as.numeric(CSI13$DBRR4_PP_UGCOMP_RT)
CSI13$DBRR4_PP_UGNOCOMP_RT <- as.numeric(CSI13$DBRR4_PP_UGNOCOMP_RT)
CSI13$DBRR4_PP_UGCOMP_NUM <- as.numeric(CSI13$DBRR4_PP_UGCOMP_NUM)
CSI13$DBRR4_PP_UGNOCOMP_NUM <- as.numeric(CSI13$DBRR4_PP_UGNOCOMP_NUM)
CSI13$DBRR4_PP_UGCOMP_DEN <- as.numeric(CSI13$DBRR4_PP_UGCOMP_DEN)
CSI13$DBRR4_PP_UGNOCOMP_DEN <- as.numeric(CSI13$DBRR4_PP_UGNOCOMP_DEN)

# These are for plotting DBRR4_PP_UGNOCOMP_RT against DBRR4_PP_UGCOMP_RT. 
# CSI13 <- CSI13 %>% filter(is.na(DBRR4_PP_UGCOMP_RT)==FALSE & is.na(DBRR4_PP_UGNOCOMP_RT)==FALSE)
# ggplot(data=CSI13, mapping=aes(x=DBRR4_PP_UGCOMP_RT, y=DBRR4_PP_UGNOCOMP_RT)) + geom_point(alpha=0.2) + scale_x_continuous(lim=c(0, 1.6)) + scale_y_continuous(lim=c(0, 1.6)) 

CSI13 <- CSI13 %>% filter(is.na(DBRR4_PP_UGCOMP_NUM)==FALSE
                          & is.na(DBRR4_PP_UGNOCOMP_NUM)==FALSE
                          & is.na(DBRR4_PP_UGCOMP_DEN)==FALSE
                          & is.na(DBRR4_PP_UGNOCOMP_DEN)==FALSE)

(sum(CSI13$DBRR4_PP_UGNOCOMP_NUM, na.rm=TRUE) / sum(CSI13$DBRR4_PP_UGNOCOMP_DEN, na.rm=TRUE)) / (sum(CSI13$DBRR4_PP_UGCOMP_NUM, na.rm=TRUE) / sum(CSI13$DBRR4_PP_UGCOMP_DEN, na.rm=TRUE))

#################################################################
### Now we check how this is for HBCUs.                       ###
#################################################################

CSI13.1 <- CSI13 %>% filter(HBCU==1)

CSI13.1 <- CSI13.1 %>% filter(is.na(DBRR4_PP_UGCOMP_NUM)==FALSE
                          & is.na(DBRR4_PP_UGNOCOMP_NUM)==FALSE
                          & is.na(DBRR4_PP_UGCOMP_DEN)==FALSE
                          & is.na(DBRR4_PP_UGNOCOMP_DEN)==FALSE)

(sum(CSI13.1$DBRR4_PP_UGNOCOMP_NUM, na.rm=TRUE) / sum(CSI13.1$DBRR4_PP_UGNOCOMP_DEN, na.rm=TRUE)) / (sum(CSI13.1$DBRR4_PP_UGCOMP_NUM, na.rm=TRUE) / sum(CSI13.1$DBRR4_PP_UGCOMP_DEN, na.rm=TRUE))


#################################################################
###                                                           ###
###         Section 16: Repayment for Pell vs No Pell         ###
###                                                           ###
#################################################################

CSI13 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "BBRR3_PP_PELL_N", 
  "BBRR3_PP_PELL_DFLT", 
  "BBRR3_PP_PELL_MAKEPROG", 
  "BBRR3_PP_NOPELL_N", 
  "BBRR3_PP_NOPELL_DFLT", 
  "BBRR3_PP_NOPELL_MAKEPROG"
)) %>% filter(duplicated(OPEID6)==FALSE)

CSI13$BBRR3_PP_PELL_DFLT <- as.numeric(ifelse(CSI13$BBRR3_PP_PELL_DFLT=="<=0.05", "0.025", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="<-0.10", "0.05", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="<=0.20", "0.1", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.03-0.04", "0.035", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.05-0.06", "0.055", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.05-0.09", "0.07", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.07-0.08", "0.075", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.09-0.10", "0.095", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.10-0.14", "0.12", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.10-0.19", "0.145", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.11-0.12", "0.115", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.13-0.14", "0.135", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.15-0.16", "0.155", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.17-0.18", "0.175", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.15-0.19", "0.17", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.19-0.20", "0.195", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.20-0.24", "0.22", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.20-0.29", "0.245", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.20-0.39", "0.295", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.21-0.22", "0.215",  ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.23-0.24", "0.235", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.25-0.29", "0.27", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.27-0.28", "0.275", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.30-0.34", "0.32", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.30-0.39", "0.345", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.31-0.32", "0.315", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.40-0.49", "0.445", ifelse(CSI13$BBRR3_PP_PELL_DFLT=="0.40-0.59", "0.495", CSI13$BBRR3_PP_PELL_DFLT)))))))))))))))))))))))))))))

CSI13$BBRR3_PP_PELL_MAKEPROG <- as.numeric(ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="<=0.05", "0.025", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="<-0.10", "0.05", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="<=0.20", "0.1", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.03-0.04", "0.035", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.05-0.06", "0.055", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.05-0.09", "0.07", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.07-0.08", "0.075", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.09-0.10", "0.095", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.10-0.14", "0.12", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.10-0.19", "0.145", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.11-0.12", "0.115", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.13-0.14", "0.135", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.15-0.16", "0.155", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.17-0.18", "0.175", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.15-0.19", "0.17", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.19-0.20", "0.195", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.20-0.24", "0.22", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.20-0.29", "0.245", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.20-0.39", "0.295", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.21-0.22", "0.215",  ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.23-0.24", "0.235", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.25-0.29", "0.27", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.27-0.28", "0.275", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.30-0.34", "0.32", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.30-0.39", "0.345", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.31-0.32", "0.315", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.40-0.49", "0.445", ifelse(CSI13$BBRR3_PP_PELL_MAKEPROG=="0.40-0.59", "0.495", CSI13$BBRR3_PP_PELL_MAKEPROG)))))))))))))))))))))))))))))

CSI13$BBRR3_PP_NOPELL_DFLT <- as.numeric(ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="<=0.05", "0.025", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="<-0.10", "0.05", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="<=0.20", "0.1", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.03-0.04", "0.035", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.05-0.06", "0.055", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.05-0.09", "0.07", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.07-0.08", "0.075", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.09-0.10", "0.095", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.10-0.14", "0.12", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.10-0.19", "0.145", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.11-0.12", "0.115", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.13-0.14", "0.135", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.15-0.16", "0.155", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.17-0.18", "0.175", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.15-0.19", "0.17", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.19-0.20", "0.195", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.20-0.24", "0.22", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.20-0.29", "0.245", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.20-0.39", "0.295", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.21-0.22", "0.215",  ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.23-0.24", "0.235", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.25-0.29", "0.27", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.27-0.28", "0.275", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.30-0.34", "0.32", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.30-0.39", "0.345", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.31-0.32", "0.315", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.40-0.49", "0.445", ifelse(CSI13$BBRR3_PP_NOPELL_DFLT=="0.40-0.59", "0.495", CSI13$BBRR3_PP_NOPELL_DFLT)))))))))))))))))))))))))))))

CSI13$BBRR3_PP_NOPELL_MAKEPROG <- as.numeric(ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="<=0.05", "0.025", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="<-0.10", "0.05", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="<=0.20", "0.1", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.03-0.04", "0.035", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.05-0.06", "0.055", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.05-0.09", "0.07", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.07-0.08", "0.075", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.09-0.10", "0.095", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.10-0.14", "0.12", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.10-0.19", "0.145", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.11-0.12", "0.115", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.13-0.14", "0.135", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.15-0.16", "0.155", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.17-0.18", "0.175", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.15-0.19", "0.17", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.19-0.20", "0.195", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.20-0.24", "0.22", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.20-0.29", "0.245", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.20-0.39", "0.295", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.21-0.22", "0.215",  ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.23-0.24", "0.235", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.25-0.29", "0.27", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.27-0.28", "0.275", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.30-0.34", "0.32", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.30-0.39", "0.345", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.31-0.32", "0.315", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.40-0.49", "0.445", ifelse(CSI13$BBRR3_PP_NOPELL_MAKEPROG=="0.40-0.59", "0.495", CSI13$BBRR3_PP_NOPELL_MAKEPROG)))))))))))))))))))))))))))))

CSI13$BBRR3_PP_PELL_N <- as.numeric(CSI13$BBRR3_PP_PELL_N) 
CSI13$BBRR3_PP_PELL_DFLT <- as.numeric(CSI13$BBRR3_PP_PELL_DFLT) 
CSI13$BBRR3_PP_PELL_MAKEPROG <- as.numeric(CSI13$BBRR3_PP_PELL_MAKEPROG) 
CSI13$BBRR3_PP_NOPELL_N <- as.numeric(CSI13$BBRR3_PP_NOPELL_N) 
CSI13$BBRR3_PP_NOPELL_DFLT <- as.numeric(CSI13$BBRR3_PP_NOPELL_DFLT) 
CSI13$BBRR3_PP_NOPELL_MAKEPROG <- as.numeric(CSI13$BBRR3_PP_NOPELL_MAKEPROG)

#################################################################
### First we'll look at default rates.                        ###
#################################################################

CSI13.1 <- CSI13 %>% filter(is.na(BBRR3_PP_PELL_N)==FALSE
                            & is.na(BBRR3_PP_PELL_DFLT)==FALSE
                            & is.na(BBRR3_PP_NOPELL_N)==FALSE
                            & is.na(BBRR3_PP_NOPELL_DFLT)==FALSE)

ggplot(data=CSI13.1, mapping=aes(x=BBRR3_PP_NOPELL_DFLT, y=BBRR3_PP_PELL_DFLT)) + geom_point(alpha=0.2)

CSI13.1$BBRR3_PP_PELL_DFLT_N <- CSI13.1$BBRR3_PP_PELL_DFLT * CSI13.1$BBRR3_PP_PELL_N
CSI13.1$BBRR3_PP_NOPELL_DFLT_N <- CSI13.1$BBRR3_PP_NOPELL_DFLT * CSI13.1$BBRR3_PP_NOPELL_N

noPell.default.rate <- sum(CSI13.1$BBRR3_PP_NOPELL_DFLT_N, na.rm=TRUE) / sum(CSI13.1$BBRR3_PP_NOPELL_N, na.rm=TRUE)
yesPell.default.rate <- sum(CSI13.1$BBRR3_PP_PELL_DFLT_N, na.rm=TRUE) / sum(CSI13.1$BBRR3_PP_PELL_N, na.rm=TRUE)



#################################################################
### Next we'll look at rates of making progress on repayment. ###
#################################################################

CSI13.2 <- CSI13 %>% filter(is.na(BBRR3_PP_PELL_N)==FALSE
                               & is.na(BBRR3_PP_PELL_MAKEPROG)==FALSE
                               & is.na(BBRR3_PP_NOPELL_N)==FALSE
                               & is.na(BBRR3_PP_NOPELL_MAKEPROG)==FALSE)

ggplot(data=CSI13.2, mapping=aes(x=BBRR3_PP_NOPELL_MAKEPROG, y=BBRR3_PP_PELL_MAKEPROG)) + geom_point(alpha=0.2)

CSI13.1$BBRR3_PP_PELL_MAKEPROG_N <- CSI13.1$BBRR3_PP_PELL_MAKEPROG * CSI13.1$BBRR3_PP_PELL_N
CSI13.1$BBRR3_PP_NOPELL_MAKEPROG_N <- CSI13.1$BBRR3_PP_NOPELL_MAKEPROG * CSI13.1$BBRR3_PP_NOPELL_N

noPell.progress.rate <- sum(CSI13.1$BBRR3_PP_NOPELL_MAKEPROG_N, na.rm=TRUE) / sum(CSI13.1$BBRR3_PP_NOPELL_N, na.rm=TRUE)
yesPell.progress.rate <- sum(CSI13.1$BBRR3_PP_PELL_MAKEPROG_N, na.rm=TRUE) / sum(CSI13.1$BBRR3_PP_PELL_N, na.rm=TRUE)


#################################################################
###                                                           ###
###         Section 17: Quick ones for the report             ###
###                                                           ###
#################################################################

CSI14 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  
  "PLUS_DEBT_INST_COMP_N",
  "PLUS_DEBT_INST_COMP_MD",
  
  "DBRR4_PP_UGCOMP_N",
  "DBRR4_PP_UGCOMP_NUM",
  "DBRR4_PP_UGCOMP_DEN",

  "DBRR10_PP_UG_N",
  "DBRR10_PP_UG_NUM",
  "DBRR10_PP_UG_DEN",
  
  "DBRR20_PP_UG_N",
  "DBRR20_PP_UG_NUM",
  "DBRR20_PP_UG_DEN"

)) %>% filter(duplicated(OPEID6)==FALSE)

CSI14$DBRR4_PP_UGCOMP_N <- as.numeric(CSI14$DBRR4_PP_UGCOMP_N)
CSI14$DBRR4_PP_UGCOMP_NUM <- as.numeric(CSI14$DBRR4_PP_UGCOMP_NUM)
CSI14$DBRR4_PP_UGCOMP_DEN <- as.numeric(CSI14$DBRR4_PP_UGCOMP_DEN)

CSI14$DBRR10_PP_UG_N <- as.numeric(CSI14$DBRR10_PP_UG_N)
CSI14$DBRR10_PP_UG_NUM <- as.numeric(CSI14$DBRR10_PP_UG_NUM)
CSI14$DBRR10_PP_UG_DEN <- as.numeric(CSI14$DBRR10_PP_UG_DEN)

CSI14$DBRR20_PP_UG_N <- as.numeric(CSI14$DBRR20_PP_UG_N)
CSI14$DBRR20_PP_UG_NUM <- as.numeric(CSI14$DBRR20_PP_UG_NUM)
CSI14$DBRR20_PP_UG_DEN <- as.numeric(CSI14$DBRR20_PP_UG_DEN)

CSI14$PLUS_DEBT_INST_COMP_N <- as.numeric(CSI14$PLUS_DEBT_INST_COMP_N)
CSI14$PLUS_DEBT_INST_COMP_MD <- as.numeric(CSI14$PLUS_DEBT_INST_COMP_MD)

#################################################################
### I'm looking now for the median PLUS load for completers.  ###
#################################################################

CSI14.1 <- CSI14 %>% filter(is.na(PLUS_DEBT_INST_COMP_N)==FALSE
                            &
                            is.na(PLUS_DEBT_INST_COMP_MD)==FALSE)

CSI14.1$`Share of all PLUS completers` <- CSI14.1$PLUS_DEBT_INST_COMP_N / sum(CSI14.1$PLUS_DEBT_INST_COMP_N, na.rm=TRUE)
CSI14.1$`Median times share` <- CSI14.1$PLUS_DEBT_INST_COMP_MD * CSI14.1$`Share of all PLUS completers`
sum(CSI14.1$`Median times share`) # Weighted median # STAT 3

#################################################################
### I'm looking now for percent remaining after ten years.    ###
#################################################################

CSI14.2 <- CSI14 %>% filter(is.na(DBRR10_PP_UG_NUM)==FALSE
                            &
                            is.na(DBRR10_PP_UG_DEN)==FALSE)

sum(CSI14.2$DBRR10_PP_UG_NUM) / sum(CSI14.2$DBRR10_PP_UG_DEN) # STAT 4

#################################################################
### What about 20 years?                                      ###
#################################################################

CSI14.3 <- CSI14 %>% filter(is.na(DBRR20_PP_UG_NUM)==FALSE
                            &
                            is.na(DBRR20_PP_UG_DEN)==FALSE)

sum(CSI14.3$DBRR20_PP_UG_NUM) / sum(CSI14.3$DBRR20_PP_UG_DEN) # STAT 5

##################################################################
### I'm also curious about which institutions have Parent PLUS ###
### as the highest share of overall outstanding debt.          ###
##################################################################

CSI15 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM", 
  "HBCU",
  "CONTROL",
  "LPPPLUS_CNT",
  "LPPPLUS_AMT", 
  "LPSTAFFORD_CNT",
  "LPSTAFFORD_AMT",
  "LPGPLUS_CNT",
  "LPGPLUS_AMT"
)) %>% filter(duplicated(OPEID6)==FALSE)

CSI15$LPPPLUS_CNT <- as.numeric(CSI15$LPPPLUS_CNT)
CSI15$LPPPLUS_AMT <- as.numeric(CSI15$LPPPLUS_AMT) 
CSI15$LPSTAFFORD_CNT <- as.numeric(CSI15$LPSTAFFORD_CNT)
CSI15$LPSTAFFORD_AMT <- as.numeric(CSI15$LPSTAFFORD_AMT)
CSI15$LPGPLUS_CNT <- as.numeric(CSI15$LPGPLUS_CNT)
CSI15$LPGPLUS_AMT <- as.numeric(CSI15$LPGPLUS_AMT)

CSI15 <- CSI15 %>% filter(is.na(LPPPLUS_AMT)==FALSE
                          &
                          is.na(LPSTAFFORD_AMT)==FALSE
                          &
                          is.na(LPGPLUS_AMT)==FALSE)

CSI15$`PLUS Share of Outstanding Debt` <- CSI15$LPPPLUS_AMT / (CSI15$LPSTAFFORD_AMT + CSI15$LPPPLUS_AMT + CSI15$LPGPLUS_AMT)

##################################################################
### PLUS at Clark Atlanta                                      ###
##################################################################

CSI16 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM", 
  "HBCU",
  "CONTROL",
"PPLUS_PCT_LOW",
"PPLUS_PCT_HIGH")) %>% filter(UNITID == 138947)

#################################################################
###                                                           ###
###         Section 18: Some charts for the report            ###
###                                                           ###
#################################################################

##################################################################
### PLUS % by poverty level chart                              ###
### We start with these NPSAS DRT#s, representing the shares   ###
### of students by poverty level who receive PLUS.             ###
### 1996: bnzvzf and vdhtbw                                    ###
### 2000: knyhih and ewfhri                                    ###
### 2004: oeyhyn and vhgyyx                                    ###
### 2008: jmfcja and ewjgbt                                    ###
### 2012: ymwgdl and kkyfae                                    ###
### 2016: tvngsf and dtzfjp                                    ###
### 2018: kktnnb and fcuzvd                                    ###
##################################################################

# Shares of students who receive PLUS by poverty level 
povP96 <- read.csv("PowerStats bnzvzf.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP96$V3 <- povP96$V3 / 100
povP00 <- read.csv("PowerStats knyhih.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP00$V3 <- povP00$V3 / 100
povP04 <- read.csv("PowerStats oeyhyn.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP04$V3 <- povP04$V3 / 100
povP08 <- read.csv("PowerStats jmfcja.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP08$V3 <- povP08$V3 / 100
povP12 <- read.csv("PowerStats ymwgdl.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP12$V3 <- povP12$V3 / 100
povP16 <- read.csv("PowerStats tvngsf.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP16$V3 <- povP16$V3 / 100
povP18 <- read.csv("PowerStats kktnnb.csv", header=FALSE, skip=13, nrow=5) %>% select(V1, V3)
povP18$V3 <- povP18$V3 / 100

# Shares of students by poverty level 
povL96 <- read.csv("PowerStats vdhtbw.csv", header=FALSE, skip=11, nrow=1)
povL96$V2 <- povL96$V2 / 100
povL96$V3 <- povL96$V3 / 100
povL96$V4 <- povL96$V4 / 100
povL96$V5 <- povL96$V5 / 100
povL96$V6 <- povL96$V6 / 100
povL00 <- read.csv("PowerStats ewfhri.csv", header=FALSE, skip=11, nrow=1)
povL00$V2 <- povL00$V2 / 100
povL00$V3 <- povL00$V3 / 100
povL00$V4 <- povL00$V4 / 100
povL00$V5 <- povL00$V5 / 100
povL00$V6 <- povL00$V6 / 100
povL04 <- read.csv("PowerStats vhgyyx.csv", header=FALSE, skip=11, nrow=1)
povL04$V2 <- povL04$V2 / 100
povL04$V3 <- povL04$V3 / 100
povL04$V4 <- povL04$V4 / 100
povL04$V5 <- povL04$V5 / 100
povL04$V6 <- povL04$V6 / 100
povL08 <- read.csv("PowerStats ewjgbt.csv", header=FALSE, skip=11, nrow=1)
povL08$V2 <- povL08$V2 / 100
povL08$V3 <- povL08$V3 / 100
povL08$V4 <- povL08$V4 / 100
povL08$V5 <- povL08$V5 / 100
povL08$V6 <- povL08$V6 / 100
povL12 <- read.csv("PowerStats kkyfae.csv", header=FALSE, skip=11, nrow=1)
povL12$V2 <- povL12$V2 / 100
povL12$V3 <- povL12$V3 / 100
povL12$V4 <- povL12$V4 / 100
povL12$V5 <- povL12$V5 / 100
povL12$V6 <- povL12$V6 / 100
povL16 <- read.csv("PowerStats dtzfjp.csv", header=FALSE, skip=11, nrow=1)
povL16$V2 <- povL16$V2 / 100
povL16$V3 <- povL16$V3 / 100
povL16$V4 <- povL16$V4 / 100
povL16$V5 <- povL16$V5 / 100
povL16$V6 <- povL16$V6 / 100
povL18 <- read.csv("PowerStats fcuzvd.csv", header=FALSE, skip=11, nrow=1)
povL18$V2 <- povL18$V2 / 100
povL18$V3 <- povL18$V3 / 100
povL18$V4 <- povL18$V4 / 100
povL18$V5 <- povL18$V5 / 100
povL18$V6 <- povL18$V6 / 100

povChart <- data.frame("Year"=c(1996), "Group"=c("Less than 100% FPL"), "Share"=c(povP96$V3[1]))

#1996
povChart <- povChart %>% add_row(Year=1996, Group="101% to 200% FPL", Share=povP96$V3[2])
povChart <- povChart %>% add_row(Year=1996, Group="201% to 300% FPL", Share=povP96$V3[3])
povChart <- povChart %>% add_row(Year=1996, Group="301% to 400% FPL", Share=povP96$V3[4])
povChart <- povChart %>% add_row(Year=1996, Group="Greater than 400% FPL", Share=povP96$V3[5])

#2000
povChart <- povChart %>% add_row(Year=2000, Group="Less than 100% FPL", Share=povP00$V3[1])
povChart <- povChart %>% add_row(Year=2000, Group="101% to 200% FPL", Share=povP00$V3[2])
povChart <- povChart %>% add_row(Year=2000, Group="201% to 300% FPL", Share=povP00$V3[3])
povChart <- povChart %>% add_row(Year=2000, Group="301% to 400% FPL", Share=povP00$V3[4])
povChart <- povChart %>% add_row(Year=2000, Group="Greater than 400% FPL", Share=povP00$V3[5])

#2004
povChart <- povChart %>% add_row(Year=2004, Group="Less than 100% FPL", Share=povP04$V3[1])
povChart <- povChart %>% add_row(Year=2004, Group="101% to 200% FPL", Share=povP04$V3[2])
povChart <- povChart %>% add_row(Year=2004, Group="201% to 300% FPL", Share=povP04$V3[3])
povChart <- povChart %>% add_row(Year=2004, Group="301% to 400% FPL", Share=povP04$V3[4])
povChart <- povChart %>% add_row(Year=2004, Group="Greater than 400% FPL", Share=povP04$V3[5])

#2008
povChart <- povChart %>% add_row(Year=2008, Group="Less than 100% FPL", Share=povP08$V3[1])
povChart <- povChart %>% add_row(Year=2008, Group="101% to 200% FPL", Share=povP08$V3[2])
povChart <- povChart %>% add_row(Year=2008, Group="201% to 300% FPL", Share=povP08$V3[3])
povChart <- povChart %>% add_row(Year=2008, Group="301% to 400% FPL", Share=povP08$V3[4])
povChart <- povChart %>% add_row(Year=2008, Group="Greater than 400% FPL", Share=povP08$V3[5])

#2012
povChart <- povChart %>% add_row(Year=2012, Group="Less than 100% FPL", Share=povP12$V3[1])
povChart <- povChart %>% add_row(Year=2012, Group="101% to 200% FPL", Share=povP12$V3[2])
povChart <- povChart %>% add_row(Year=2012, Group="201% to 300% FPL", Share=povP12$V3[3])
povChart <- povChart %>% add_row(Year=2012, Group="301% to 400% FPL", Share=povP12$V3[4])
povChart <- povChart %>% add_row(Year=2012, Group="Greater than 400% FPL", Share=povP12$V3[5])

# 2016
povChart <- povChart %>% add_row(Year=2016, Group="Less than 100% FPL", Share=povP16$V3[1])
povChart <- povChart %>% add_row(Year=2016, Group="101% to 200% FPL", Share=povP16$V3[2])
povChart <- povChart %>% add_row(Year=2016, Group="201% to 300% FPL", Share=povP16$V3[3])
povChart <- povChart %>% add_row(Year=2016, Group="301% to 400% FPL", Share=povP16$V3[4])
povChart <- povChart %>% add_row(Year=2016, Group="Greater than 400% FPL", Share=povP16$V3[5])

#2018
povChart <- povChart %>% add_row(Year=2018, Group="Less than 100% FPL", Share=povP18$V3[1])
povChart <- povChart %>% add_row(Year=2018, Group="101% to 200% FPL", Share=povP18$V3[2])
povChart <- povChart %>% add_row(Year=2018, Group="201% to 300% FPL", Share=povP18$V3[3])
povChart <- povChart %>% add_row(Year=2018, Group="301% to 400% FPL", Share=povP18$V3[4])
povChart <- povChart %>% add_row(Year=2018, Group="Greater than 400% FPL", Share=povP18$V3[5])

##################################################################
### Let's now add in the distributions of students by poverty  ###
### level.                                                     ###
##################################################################

povChart$Level <- rep(NA, nrow(povChart))

# 1996
povChart$Level[povChart$Year==1996 & povChart$Group=="Less than 100% FPL"] <- povL96$V2[1]
povChart$Level[povChart$Year==1996 & povChart$Group=="101% to 200% FPL"] <- povL96$V3[1]
povChart$Level[povChart$Year==1996 & povChart$Group=="201% to 300% FPL"] <- povL96$V4[1]
povChart$Level[povChart$Year==1996 & povChart$Group=="301% to 400% FPL"] <- povL96$V5[1]
povChart$Level[povChart$Year==1996 & povChart$Group=="Greater than 400% FPL"] <- povL96$V6[1]

# 2000
povChart$Level[povChart$Year==2000 & povChart$Group=="Less than 100% FPL"] <- povL00$V2[1]
povChart$Level[povChart$Year==2000 & povChart$Group=="101% to 200% FPL"] <- povL00$V3[1]
povChart$Level[povChart$Year==2000 & povChart$Group=="201% to 300% FPL"] <- povL00$V4[1]
povChart$Level[povChart$Year==2000 & povChart$Group=="301% to 400% FPL"] <- povL00$V5[1]
povChart$Level[povChart$Year==2000 & povChart$Group=="Greater than 400% FPL"] <- povL00$V6[1]

# 2004
povChart$Level[povChart$Year==2004 & povChart$Group=="Less than 100% FPL"] <- povL04$V2[1]
povChart$Level[povChart$Year==2004 & povChart$Group=="101% to 200% FPL"] <- povL04$V3[1]
povChart$Level[povChart$Year==2004 & povChart$Group=="201% to 300% FPL"] <- povL04$V4[1]
povChart$Level[povChart$Year==2004 & povChart$Group=="301% to 400% FPL"] <- povL04$V5[1]
povChart$Level[povChart$Year==2004 & povChart$Group=="Greater than 400% FPL"] <- povL04$V6[1]

# 2008
povChart$Level[povChart$Year==2008 & povChart$Group=="Less than 100% FPL"] <- povL08$V2[1]
povChart$Level[povChart$Year==2008 & povChart$Group=="101% to 200% FPL"] <- povL08$V3[1]
povChart$Level[povChart$Year==2008 & povChart$Group=="201% to 300% FPL"] <- povL08$V4[1]
povChart$Level[povChart$Year==2008 & povChart$Group=="301% to 400% FPL"] <- povL08$V5[1]
povChart$Level[povChart$Year==2008 & povChart$Group=="Greater than 400% FPL"] <- povL08$V6[1]

# 2012
povChart$Level[povChart$Year==2012 & povChart$Group=="Less than 100% FPL"] <- povL12$V2[1]
povChart$Level[povChart$Year==2012 & povChart$Group=="101% to 200% FPL"] <- povL12$V3[1]
povChart$Level[povChart$Year==2012 & povChart$Group=="201% to 300% FPL"] <- povL12$V4[1]
povChart$Level[povChart$Year==2012 & povChart$Group=="301% to 400% FPL"] <- povL12$V5[1]
povChart$Level[povChart$Year==2012 & povChart$Group=="Greater than 400% FPL"] <- povL12$V6[1]

# 2016
povChart$Level[povChart$Year==2016 & povChart$Group=="Less than 100% FPL"] <- povL16$V2[1]
povChart$Level[povChart$Year==2016 & povChart$Group=="101% to 200% FPL"] <- povL16$V3[1]
povChart$Level[povChart$Year==2016 & povChart$Group=="201% to 300% FPL"] <- povL16$V4[1]
povChart$Level[povChart$Year==2016 & povChart$Group=="301% to 400% FPL"] <- povL16$V5[1]
povChart$Level[povChart$Year==2016 & povChart$Group=="Greater than 400% FPL"] <- povL16$V6[1]

# 2018
povChart$Level[povChart$Year==2018 & povChart$Group=="Less than 100% FPL"] <- povL18$V2[1]
povChart$Level[povChart$Year==2018 & povChart$Group=="101% to 200% FPL"] <- povL18$V3[1]
povChart$Level[povChart$Year==2018 & povChart$Group=="201% to 300% FPL"] <- povL18$V4[1]
povChart$Level[povChart$Year==2018 & povChart$Group=="301% to 400% FPL"] <- povL18$V5[1]
povChart$Level[povChart$Year==2018 & povChart$Group=="Greater than 400% FPL"] <- povL18$V6[1]

##################################################################
### We now add in national enrollment totals. These            ###
### come from NCES Digest of Education Statistics #303.70,     ###
### "total" column.                                            ###
##################################################################

povChart$Enrollment <- rep(NA, nrow(povChart))
povChart$Enrollment[povChart$Year==1996] <- 12326948
povChart$Enrollment[povChart$Year==2000] <- 13155393
povChart$Enrollment[povChart$Year==2004] <- 14780630	
povChart$Enrollment[povChart$Year==2008] <- 16344592
povChart$Enrollment[povChart$Year==2012] <- 17735638
povChart$Enrollment[povChart$Year==2016] <- 16874649
povChart$Enrollment[povChart$Year==2018] <- 16616370

##################################################################
### We can now estimate total PLUS recipients by poverty level ###
### for each of these years.                                   ###
##################################################################

povChart$`Estimated.PLUS.recipients` <- povChart$Enrollment * povChart$Level* povChart$Share
totalPLUS <- data.frame("Year"=c(1996, 2000, 2004, 2008, 2012, 2016, 2018), 
                        "Total.PLUS.reicpients" = c(
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==1996]), 
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==2000]), 
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==2004]), 
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==2008]),
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==2012]), 
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==2016]), 
                          sum(povChart$Estimated.PLUS.recipients[povChart$Year==2018]) 
                        ))
povChart <- left_join(x=povChart, y=totalPLUS, by="Year")
povChart$`Share of PLUS recipients` <- povChart$Estimated.PLUS.recipients / povChart$Total.PLUS.reicpients


##################################################################
### PLUS % by race chart                                       ###
### We start with these NPSAS DRT#s, representing the shares   ###
### of students by race who receive PLUS.                      ### 
### 1996: hwjvcr and vzicpu                                    ###
### 2000: nsneow and anxeju                                    ###
### 2004: tycwvc and aprcof                                    ###
### 2008: wsvweo and svgjqi                                    ###
### 2012: jdeqzi and pageys                                    ###
### 2016: kcewmq and wbacbq                                    ###
### 2018: lubjnx and locuyc                                    ###
##################################################################

racP96 <- read.csv("PowerStats hwjvcr.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP96$V3 <- racP96$V3 / 100
racP00 <- read.csv("PowerStats nsneow.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP00$V3 <- racP00$V3 / 100
racP04 <- read.csv("PowerStats tycwvc.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP04$V3 <- racP04$V3 / 100
racP08 <- read.csv("PowerStats wsvweo.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP08$V3 <- racP08$V3 / 100
racP12 <- read.csv("PowerStats jdeqzi.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP12$V3 <- racP12$V3 / 100
racP16 <- read.csv("PowerStats kcewmq.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP16$V3 <- racP16$V3 / 100
racP18 <- read.csv("PowerStats lubjnx.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V3)
racP18$V3 <- racP18$V3 / 100

racL96 <- read.csv("PowerStats vzicpu.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL96$V2 <- racL96$V2 / 100
racL96$V3 <- racL96$V3 / 100
racL96$V4 <- racL96$V4 / 100
racL96$V5 <- racL96$V5 / 100
racL00 <- read.csv("PowerStats anxeju.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL00$V2 <- racL00$V2 / 100
racL00$V3 <- racL00$V3 / 100
racL00$V4 <- racL00$V4 / 100
racL00$V5 <- racL00$V5 / 100
racL04 <- read.csv("PowerStats aprcof.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL04$V2 <- racL04$V2 / 100
racL04$V3 <- racL04$V3 / 100
racL04$V4 <- racL04$V4 / 100
racL04$V5 <- racL04$V5 / 100
racL08 <- read.csv("PowerStats svgjqi.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL08$V2 <- racL08$V2 / 100
racL08$V3 <- racL08$V3 / 100
racL08$V4 <- racL08$V4 / 100
racL08$V5 <- racL08$V5 / 100
racL12 <- read.csv("PowerStats pageys.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL12$V2 <- racL12$V2 / 100
racL12$V3 <- racL12$V3 / 100
racL12$V4 <- racL12$V4 / 100
racL12$V5 <- racL12$V5 / 100
racL16 <- read.csv("PowerStats wbacbq.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL16$V2 <- racL16$V2 / 100
racL16$V3 <- racL16$V3 / 100
racL16$V4 <- racL16$V4 / 100
racL16$V5 <- racL16$V5 / 100
racL18 <- read.csv("PowerStats locuyc.csv", header=FALSE, skip=11, nrow=1) %>% select(V2, V3, V4, V5)
racL18$V2 <- racL18$V2 / 100
racL18$V3 <- racL18$V3 / 100
racL18$V4 <- racL18$V4 / 100
racL18$V5 <- racL18$V5 / 100

racChart <- data.frame("Year"=c(1996), "Group"=c("White"), "Share"=c(racP96$V3[1]))

#1996
racChart <- racChart %>% add_row(Year=1996, Group="Black", Share=racP96$V3[2])
racChart <- racChart %>% add_row(Year=1996, Group="Latinx", Share=racP96$V3[3])
racChart <- racChart %>% add_row(Year=1996, Group="Asian / Pacific Islander", Share=racP96$V3[4])

#2000
racChart <- racChart %>% add_row(Year=2000, Group="White", Share=racP00$V3[1])
racChart <- racChart %>% add_row(Year=2000, Group="Black", Share=racP00$V3[2])
racChart <- racChart %>% add_row(Year=2000, Group="Latinx", Share=racP00$V3[3])
racChart <- racChart %>% add_row(Year=2000, Group="Asian / Pacific Islander", Share=racP00$V3[4])

#2004
racChart <- racChart %>% add_row(Year=2004, Group="White", Share=racP04$V3[1])
racChart <- racChart %>% add_row(Year=2004, Group="Black", Share=racP04$V3[2])
racChart <- racChart %>% add_row(Year=2004, Group="Latinx", Share=racP04$V3[3])
racChart <- racChart %>% add_row(Year=2004, Group="Asian / Pacific Islander", Share=racP04$V3[4])

#2008
racChart <- racChart %>% add_row(Year=2008, Group="White", Share=racP08$V3[1])
racChart <- racChart %>% add_row(Year=2008, Group="Black", Share=racP08$V3[2])
racChart <- racChart %>% add_row(Year=2008, Group="Latinx", Share=racP08$V3[3])
racChart <- racChart %>% add_row(Year=2008, Group="Asian / Pacific Islander", Share=racP08$V3[4])

#2012
racChart <- racChart %>% add_row(Year=2012, Group="White", Share=racP12$V3[1])
racChart <- racChart %>% add_row(Year=2012, Group="Black", Share=racP12$V3[2])
racChart <- racChart %>% add_row(Year=2012, Group="Latinx", Share=racP12$V3[3])
racChart <- racChart %>% add_row(Year=2012, Group="Asian / Pacific Islander", Share=racP12$V3[4])

# 2016
racChart <- racChart %>% add_row(Year=2016, Group="White", Share=racP16$V3[1])
racChart <- racChart %>% add_row(Year=2016, Group="Black", Share=racP16$V3[2])
racChart <- racChart %>% add_row(Year=2016, Group="Latinx", Share=racP16$V3[3])
racChart <- racChart %>% add_row(Year=2016, Group="Asian / Pacific Islander", Share=racP16$V3[4])

#2018
racChart <- racChart %>% add_row(Year=2018, Group="White", Share=racP18$V3[1])
racChart <- racChart %>% add_row(Year=2018, Group="Black", Share=racP18$V3[2])
racChart <- racChart %>% add_row(Year=2018, Group="Latinx", Share=racP18$V3[3])
racChart <- racChart %>% add_row(Year=2018, Group="Asian / Pacific Islander", Share=racP18$V3[4])

##################################################################
### Let's now add in the distributions of students by race.    ###
##################################################################

racChart$Race <- rep(NA, nrow(racChart))

# 1996
racChart$Race[racChart$Year==1996 & racChart$Group=="White"] <- racL96$V2[1]
racChart$Race[racChart$Year==1996 & racChart$Group=="Black"] <- racL96$V3[1]
racChart$Race[racChart$Year==1996 & racChart$Group=="Latinx"] <- racL96$V4[1]
racChart$Race[racChart$Year==1996 & racChart$Group=="Asian / Pacific Islander"] <- racL96$V5[1]

# 2000
racChart$Race[racChart$Year==2000 & racChart$Group=="White"] <- racL00$V2[1]
racChart$Race[racChart$Year==2000 & racChart$Group=="Black"] <- racL00$V3[1]
racChart$Race[racChart$Year==2000 & racChart$Group=="Latinx"] <- racL00$V4[1]
racChart$Race[racChart$Year==2000 & racChart$Group=="Asian / Pacific Islander"] <- racL00$V5[1]

# 2004
racChart$Race[racChart$Year==2004 & racChart$Group=="White"] <- racL04$V2[1]
racChart$Race[racChart$Year==2004 & racChart$Group=="Black"] <- racL04$V3[1]
racChart$Race[racChart$Year==2004 & racChart$Group=="Latinx"] <- racL04$V4[1]
racChart$Race[racChart$Year==2004 & racChart$Group=="Asian / Pacific Islander"] <- racL04$V5[1]

# 2008
racChart$Race[racChart$Year==2008 & racChart$Group=="White"] <- racL08$V2[1]
racChart$Race[racChart$Year==2008 & racChart$Group=="Black"] <- racL08$V3[1]
racChart$Race[racChart$Year==2008 & racChart$Group=="Latinx"] <- racL08$V4[1]
racChart$Race[racChart$Year==2008 & racChart$Group=="Asian / Pacific Islander"] <- racL08$V5[1]

# 2012
racChart$Race[racChart$Year==2012 & racChart$Group=="White"] <- racL12$V2[1]
racChart$Race[racChart$Year==2012 & racChart$Group=="Black"] <- racL12$V3[1]
racChart$Race[racChart$Year==2012 & racChart$Group=="Latinx"] <- racL12$V4[1]
racChart$Race[racChart$Year==2012 & racChart$Group=="Asian / Pacific Islander"] <- racL12$V5[1]

# 2016
racChart$Race[racChart$Year==2016 & racChart$Group=="White"] <- racL16$V2[1]
racChart$Race[racChart$Year==2016 & racChart$Group=="Black"] <- racL16$V3[1]
racChart$Race[racChart$Year==2016 & racChart$Group=="Latinx"] <- racL16$V4[1]
racChart$Race[racChart$Year==2016 & racChart$Group=="Asian / Pacific Islander"] <- racL16$V5[1]

# 2018
racChart$Race[racChart$Year==2018 & racChart$Group=="White"] <- racL18$V2[1]
racChart$Race[racChart$Year==2018 & racChart$Group=="Black"] <- racL18$V3[1]
racChart$Race[racChart$Year==2018 & racChart$Group=="Latinx"] <- racL18$V4[1]
racChart$Race[racChart$Year==2018 & racChart$Group=="Asian / Pacific Islander"] <- racL18$V5[1]

##################################################################
### We now add in national enrollment totals. These            ###
### come from NCES Digest of Education Statistics #303.70,     ###
### "total" column.                                            ###
##################################################################

racChart$Enrollment <- rep(NA, nrow(racChart))
racChart$Enrollment[racChart$Year==1996] <- 12326948
racChart$Enrollment[racChart$Year==2000] <- 13155393
racChart$Enrollment[racChart$Year==2004] <- 14780630	
racChart$Enrollment[racChart$Year==2008] <- 16344592
racChart$Enrollment[racChart$Year==2012] <- 17735638
racChart$Enrollment[racChart$Year==2016] <- 16874649
racChart$Enrollment[racChart$Year==2018] <- 16616370

##################################################################
### We can now estimate total PLUS recipients by race          ###
### for each of these years.                                   ###
##################################################################

racChart$`Estimated.PLUS.recipients` <- racChart$Enrollment * racChart$Race * racChart$Share
racChart <- left_join(x=racChart, y=totalPLUS, by="Year")
racChart$`Share of PLUS recipients` <- racChart$Estimated.PLUS.recipients / racChart$Total.PLUS.reicpients


###### 
#  MAY 5 CHANGES
#####

povChart$`Share of undergraduates` <- povChart$Level
racChart$`Share of undergraduates` <- racChart$Race

ggplot(data=racChart, mapping=aes(x=Year)) + geom_line(aes(y = `Share of PLUS recipients`), color = "darkred") + geom_line(aes(y = `Share of undergraduates`), color="steelblue") + facet_grid(.  ~ Group)


##################################################################
### Now we modify these charts                                 ###
##################################################################

povAdditions <- data.frame("Year"=c(
  rep(1997, 5), 
  rep(1998, 5), 
  rep(1999, 5), 
  rep(2001, 5), 
  rep(2002, 5), 
  rep(2003, 5), 
  rep(2005, 5), 
  rep(2006, 5), 
  rep(2007, 5), 
  rep(2009, 5), 
  rep(2010, 5), 
  rep(2011, 5), 
  rep(2013, 5), 
  rep(2014, 5),
  rep(2015, 5), 
  rep(2017, 5)), 
                          "Group"=rep(c("Less than 100% FPL", "101% to 200% FPL", "201% to 300% FPL", "301% to 400% FPL", "Greater than 400% FPL"), 16),
                          "Share"=rep(NA, 80), 
                          "Level"=rep(NA, 80),
                          "Enrollment"=rep(NA, 80),
                          "Estimated.PLUS.recipients"=rep(NA, 80)
)

racAdditions <- data.frame("Year"=c(
  rep(1997, 4), 
  rep(1998, 4), 
  rep(1999, 4), 
  rep(2001, 4), 
  rep(2002, 4), 
  rep(2003, 4), 
  rep(2005, 4), 
  rep(2006, 4), 
  rep(2007, 4), 
  rep(2009, 4), 
  rep(2010, 4), 
  rep(2011, 4), 
  rep(2013, 4), 
  rep(2014, 4),
  rep(2015, 4), 
  rep(2017, 4)), 
  "Group"=rep(c("White", "Black", "Latinx", "Asian / Pacific Islander"), 16),
  "Share"=rep(NA, 64), 
  "Race"=rep(NA, 64), 
  "Enrollment"=rep(NA, 64),
  "Estimated.PLUS.recipients"=rep(NA, 64)
)

povChart <- rbind(povChart, povAdditions)
racChart <- rbind(racChart, racAdditions)

povChart <- na.omit(povChart)
racChart <- na.omit(racChart)

povChart$Group <- factor(povChart$Group, levels=c("Greater than 400% FPL", "301% to 400% FPL", "201% to 300% FPL", "101% to 200% FPL", "Less than 100% FPL"))
racChart$Group <- factor(racChart$Group, levels=c("White", "Black", "Latinx", "Asian / Pacific Islander"))

ggplot(povChart, mapping=aes(x=Year, y=Estimated.PLUS.recipients, group=Group)) + geom_line(aes(color=Group)) + geom_point() + labs(x="Year", y="Estimated number of undergraduates who receive PLUS") + scale_x_continuous(breaks=c(1996:2018)) + theme(axis.text.x = element_text(angle = 45))

ggplot(racChart, mapping=aes(x=Year, y=Estimated.PLUS.recipients, group=Group)) + geom_line(aes(color=Group)) + geom_point() + labs(x="Year", y="Estimated number of undergraduates who receive PLUS") + scale_x_continuous(breaks=c(1996:2018)) + theme(axis.text.x = element_text(angle = 45))

#################################################################
### Great, we have charts of the totals over time. Let's now  ###
### plot the percentage changes over time.                    ###
#################################################################

povChart2 <- reshape2::dcast(data=povChart, Group ~ Year, value.var="Estimated.PLUS.recipients")
racChart2 <- reshape2::dcast(data=racChart, Group ~ Year, value.var="Estimated.PLUS.recipients")

povChart2$`Base` <- povChart2$`1996`
povChart2$`1996` <- (povChart2$`1996` / povChart2$`Base`) - 1
povChart2$`2000` <- (povChart2$`2000` / povChart2$`Base`) - 1
povChart2$`2004` <- (povChart2$`2004` / povChart2$`Base`) - 1
povChart2$`2008` <- (povChart2$`2008` / povChart2$`Base`) - 1
povChart2$`2012` <- (povChart2$`2012` / povChart2$`Base`) - 1
povChart2$`2016` <- (povChart2$`2016` / povChart2$`Base`) - 1
povChart2$`2018` <- (povChart2$`2018` / povChart2$`Base`) - 1
povChart2 <- povChart2 %>% select(`Group`, `1996`, `2000`, `2004`, `2008`, `2012`, `2016`, `2018`)

racChart2$`Base` <- racChart2$`1996`
racChart2$`1996` <- (racChart2$`1996` / racChart2$`Base`) - 1
racChart2$`2000` <- (racChart2$`2000` / racChart2$`Base`) - 1
racChart2$`2004` <- (racChart2$`2004` / racChart2$`Base`) - 1
racChart2$`2008` <- (racChart2$`2008` / racChart2$`Base`) - 1
racChart2$`2012` <- (racChart2$`2012` / racChart2$`Base`) - 1
racChart2$`2016` <- (racChart2$`2016` / racChart2$`Base`) - 1
racChart2$`2018` <- (racChart2$`2018` / racChart2$`Base`) - 1
racChart2 <- racChart2 %>% select(`Group`, `1996`, `2000`, `2004`, `2008`, `2012`, `2016`, `2018`)

povChart3 <- reshape2::melt(data=povChart2, id.vars=c("Group"), measure.vars=c("1996", "2000", "2004", "2008", "2012", "2016", "2018"), variable.name="Year")
racChart3 <- reshape2::melt(data=racChart2, id.vars=c("Group"), measure.vars=c("1996", "2000", "2004", "2008", "2012", "2016", "2018"), variable.name="Year")

povAdditions2 <- data.frame(
  "Group"=rep(c("Less than 100% FPL", "101% to 200% FPL", "201% to 300% FPL", "301% to 400% FPL", "Greater than 400% FPL"), 16),
  "Year"=c(
  rep("1997", 5), 
  rep("1998", 5), 
  rep("1999", 5), 
  rep("2001", 5), 
  rep("2002", 5), 
  rep("2003", 5), 
  rep("2005", 5), 
  rep("2006", 5), 
  rep("2007", 5), 
  rep("2009", 5), 
  rep("2010", 5), 
  rep("2011", 5), 
  rep("2013", 5), 
  rep("2014", 5),
  rep("2015", 5), 
  rep("2017", 5)), 
  "value"=rep(NA, 80)
)
povAdditions2$Year <- as.factor(povAdditions2$Year)

racAdditions2 <- data.frame(
  "Group"=rep(c("White", "Black", "Latinx", "Asian / Pacific Islander"), 16),
  "Year"=c(
  rep("1997", 4), 
  rep("1998", 4), 
  rep("1999", 4), 
  rep("2001", 4), 
  rep("2002", 4), 
  rep("2003", 4), 
  rep("2005", 4), 
  rep("2006", 4), 
  rep("2007", 4), 
  rep("2009", 4), 
  rep("2010", 4), 
  rep("2011", 4), 
  rep("2013", 4), 
  rep("2014", 4),
  rep("2015", 4), 
  rep("2017", 4)), 
  "value"=rep(NA, 64)
)
racAdditions2$Year <- as.factor(racAdditions2$Year)

povChart3 <- rbind(povChart3, povAdditions2)
racChart3 <- rbind(racChart3, racAdditions2)

povChart3 <- na.omit(povChart3)
racChart3 <- na.omit(racChart3)

povChart3$Group <- factor(povChart3$Group, levels=c("Less than 100% FPL", "101% to 200% FPL", "201% to 300% FPL", "301% to 400% FPL", "Greater than 400% FPL"))
racChart3$Group <- factor(racChart3$Group, levels=c("Latinx", "Black", "Asian / Pacific Islander", "White"))

ggplot(povChart3, mapping=aes(x=Year, y=value, group=Group)) + geom_line(aes(color=Group)) + geom_point() + labs(x="Year", y="Percent increase in annual number of undergraduates who receive PLUS since 1996") + scale_y_continuous(labels = scales::percent_format(accuracy = 1))
# + scale_x_continuous(breaks=c(1996:2018)) + theme(axis.text.x = element_text(angle = 45)) 

ggplot(racChart3, mapping=aes(x=Year, y=value, group=Group)) + geom_line(aes(color=Group)) + geom_point() + labs(x="Year", y="Percent increase in annual number of undergraduates who receive PLUS since 1996") + scale_y_continuous(labels = scales::percent_format(accuracy = 1))
# + scale_x_continuous(breaks=c(1996:2018)
# + scale_x_continuous(breaks=c(1996:2018)) + theme(axis.text.x = element_text(angle = 45)) 


#################################################################
###                                                           ###
###   Section 19: Random question: PLUS at elite privates     ###
###                                                           ###
#################################################################

##################################################################
### First we find the top 100 most selective private colleges. ###
##################################################################

adm <- fread("adm2020.csv", header=TRUE, select=c(
  "UNITID",  # Unique identification number of the institution
  "APPLCN",  # Applicants total
  "ADMSSN"   # Admissions total
))
hd <- fread("hd2020.csv", header=TRUE, select=c("UNITID", "INSTNM", "CONTROL"))
adm <- left_join(x=adm, y=hd, by="UNITID") %>% filter(CONTROL==2) %>% filter(ADMSSN > 100)
adm$`Admission rate` <- adm$ADMSSN / adm$APPLCN
adm$`Admission ranking` <- rank(adm$`Admission rate`)
top100 <- adm$UNITID[adm$`Admission ranking` <= 25]

#################################################################
### Next we take their share of all headcount undergrad       ###
### enrollment.                                               ###
#################################################################

effy <- fread("effy2020.csv", header=TRUE, select=c(
  "UNITID", 
  "EFFYALEV", 
  "EFYTOTLT"
)) %>% filter(EFFYALEV==2) %>% filter(is.na(as.numeric(EFYTOTLT)) == FALSE) %>% filter(as.numeric(EFYTOTLT) > 0)

effy$`Share of total US enrollment` <- effy$`EFYTOTLT` / sum(effy$`EFYTOTLT`, na.rm=TRUE)
effy$Top100 <- ifelse(effy$UNITID %in% top100, "Yes", "No")
enrollFigures <- aggregate(data=effy, `Share of total US enrollment` ~ Top100, FUN=sum)

#################################################################
### Now we find their share of all PLUS recipients.           ###
#################################################################

plus1920 <- fread("dl-dashboard-ay2019-2020-q4.csv", header=TRUE) %>% select(`OPE ID`, School, State, `Zip Code`, `School Type`, Recipients, `# of Loans Originated`, `$ of Loans Originated`, `# of Disbursements`, `$ of Disbursements`)
names(plus1920)[1] <- "OPEID"
hd1920 <- fread("hd2019.csv", header=TRUE, select=c("UNITID", "INSTNM", "OPEID", "SECTOR", "CONTROL", "HBCU"))
plus1920$OPEID <- as.character(plus1920$OPEID)
hd1920$OPEID <- as.character(hd1920$OPEID)
plus1920$OPEID <- ifelse(nchar(plus1920$OPEID) == 6, paste("0", plus1920$OPEID, sep=""), plus1920$OPEID)
plus1920$OPEID <- ifelse(nchar(plus1920$OPEID) == 7, paste("0", plus1920$OPEID, sep=""), plus1920$OPEID)
hd1920$OPEID <- ifelse(nchar(hd1920$OPEID) == 6, paste("0", hd1920$OPEID, sep=""), hd1920$OPEID)
hd1920$OPEID <- ifelse(nchar(hd1920$OPEID) == 7, paste("0", hd1920$OPEID, sep=""), hd1920$OPEID)
data1920 <- left_join(x=plus1920, y=hd1920, by="OPEID")
data1920$`Recipients` <- as.numeric(data1920$`Recipients`)

data1920$`Share of PLUS recipients` <- data1920$Recipients / sum(data1920$Recipients, na.rm=TRUE)
data1920$Top100 <- ifelse(data1920$UNITID %in% top100, "Yes", "No")
plusFigures <- aggregate(data=data1920, `Share of PLUS recipients` ~ Top100, FUN=sum)

enrollFigures
plusFigures


#################################################################
###                                                           ###
### Section 20: Median PLUS debt vs Black household net worth ###
###                                                           ###
#################################################################

HBCU.debt <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "OPEID6",
  "HBCU", 
  "PLUS_DEBT_INST_COMP_MD"
)) %>% filter(duplicated(OPEID6)==FALSE)

HBCU.debt$PLUS_DEBT_INST_COMP_MD <- as.numeric(HBCU.debt$PLUS_DEBT_INST_COMP_MD)

HBCU.debt <- HBCU.debt %>% filter(is.na(PLUS_DEBT_INST_COMP_MD)==FALSE)

HBCU.debt$Counter <- rep(1, nrow(HBCU.debt))
HBCU.debt$`More than 17150` <- ifelse(HBCU.debt$PLUS_DEBT_INST_COMP_MD >= 17150, 1, 0)

aggregate(data=HBCU.debt, `More than 17150` ~ HBCU, FUN=sum)
aggregate(data=HBCU.debt, Counter ~ HBCU, FUN=sum)

# Okay this didn't really turn into anything. 

#################################################################
### Random query: share of culinary arts awards by race.      ###
#################################################################

c2020 <- fread("c2020_a.csv", header=TRUE, select=c(
  "UNITID", 
  "CIPCODE", 
  "MAJORNUM",
  "AWLEVEL", 
  "CTOTALT", 
  "CBKAAT", 
  "CHISPT"
)) %>% filter(AWLEVEL <= 5) %>% filter(MAJORNUM==1) %>% filter(CIPCODE %in% c(12.0500, 12.0501, 12.0502, 12.0503, 12.0504, 12.0505, 12.0506, 12.0507, 12.0508, 12.0509, 12.0510, 12.0599))

sum(c2020$CBKAAT, na.rm=TRUE) / sum(c2020$CTOTALT, na.rm=TRUE)
sum(c2020$CHISPT, na.rm=TRUE) / sum(c2020$CTOTALT, na.rm=TRUE)


#################################################################
###                                                           ###
###     Section "I Lost Track": Chart of Zero-EFC by PLUS     ###
###                                                           ###
#################################################################

efc18 <- read.csv("PowerStats jkaafa.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)
efc16 <- read.csv("PowerStats uewtwv.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)
efc12 <- read.csv("PowerStats vipbvd.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)
efc08 <- read.csv("PowerStats rjyqgr.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)
efc04 <- read.csv("PowerStats papzzq.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)
efc00 <- read.csv("PowerStats ppercq.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)
efc96 <- read.csv("PowerStats ahnplm.csv", header=FALSE, skip=13, nrow=4) %>% select(V1, V2)

efcChart <- data.frame("Year"=c("1996"), "Group"=c("White"), "Share"=c(efc96$V2[1]))
efcChart <- efcChart %>% add_row(Year="1996", Group="Black", Share=efc96$V2[2])
efcChart <- efcChart %>% add_row(Year="1996", Group="Latino/a", Share=efc96$V2[3])
efcChart <- efcChart %>% add_row(Year="1996", Group="Asian", Share=efc96$V2[4])
efcChart <- efcChart %>% add_row(Year="1996", Group="All students", Share=9.4366)
                                   
efcChart <- efcChart %>% add_row(Year="2000", Group="White", Share=efc00$V2[1])
efcChart <- efcChart %>% add_row(Year="2000", Group="Black", Share=efc00$V2[2])
efcChart <- efcChart %>% add_row(Year="2000", Group="Latino/a", Share=efc00$V2[3])
efcChart <- efcChart %>% add_row(Year="2000", Group="Asian", Share=efc00$V2[4])
efcChart <- efcChart %>% add_row(Year="2000", Group="All students", Share=4.9844)
                                   
efcChart <- efcChart %>% add_row(Year="2004", Group="White", Share=efc04$V2[1])
efcChart <- efcChart %>% add_row(Year="2004", Group="Black", Share=efc04$V2[2])
efcChart <- efcChart %>% add_row(Year="2004", Group="Latino/a", Share=efc04$V2[3])
efcChart <- efcChart %>% add_row(Year="2004", Group="Asian", Share=efc04$V2[4])
efcChart <- efcChart %>% add_row(Year="2004", Group="All students", Share=6.08)

efcChart <- efcChart %>% add_row(Year="2008", Group="White", Share=efc08$V2[1])
efcChart <- efcChart %>% add_row(Year="2008", Group="Black", Share=efc08$V2[2])
efcChart <- efcChart %>% add_row(Year="2008", Group="Latino/a", Share=efc08$V2[3])
efcChart <- efcChart %>% add_row(Year="2008", Group="Asian", Share=efc08$V2[4])
efcChart <- efcChart %>% add_row(Year="2008", Group="All students", Share=7.3878)
                                   
efcChart <- efcChart %>% add_row(Year="2012", Group="White", Share=efc12$V2[1])
efcChart <- efcChart %>% add_row(Year="2012", Group="Black", Share=efc12$V2[2])
efcChart <- efcChart %>% add_row(Year="2012", Group="Latino/a", Share=efc12$V2[3])
efcChart <- efcChart %>% add_row(Year="2012", Group="Asian", Share=efc12$V2[4])
efcChart <- efcChart %>% add_row(Year="2012", Group="All students", Share=15.7945)

efcChart <- efcChart %>% add_row(Year="2016", Group="White", Share=efc16$V2[1])
efcChart <- efcChart %>% add_row(Year="2016", Group="Black", Share=efc16$V2[2])
efcChart <- efcChart %>% add_row(Year="2016", Group="Latino/a", Share=efc16$V2[3])
efcChart <- efcChart %>% add_row(Year="2016", Group="Asian", Share=efc16$V2[4])
efcChart <- efcChart %>% add_row(Year="2016", Group="All students", Share=18.0133)

efcChart <- efcChart %>% add_row(Year="2018", Group="White", Share=efc18$V2[1])
efcChart <- efcChart %>% add_row(Year="2018", Group="Black", Share=efc18$V2[2])
efcChart <- efcChart %>% add_row(Year="2018", Group="Latino/a", Share=efc18$V2[3])
efcChart <- efcChart %>% add_row(Year="2018", Group="Asian", Share=efc18$V2[4])
efcChart <- efcChart %>% add_row(Year="2018", Group="All students", Share=17.5019)

efcChart <- efcChart %>% filter(Year != "1996")
efcChart$Year <- as.numeric(efcChart$Year)
efcChart$Group <- as.factor(efcChart$Group)
efcChart$Share <- efcChart$Share / 100

# ggplot(data=efcChart, mapping=aes(x=Year, y=Share, group=Group)) + geom_line(aes(color=Group)) + geom_point() + labs(x="Survey Year", y="Share of Parent PLUS recipients who are zero-EFC") + scale_y_continuous(lim=c(0, 0.45), labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(breaks=c(2000, 2004, 2008, 2012, 2016, 2018))
ggplot(data=efcChart, mapping=aes(x=Year, y=Share, group=Group)) + geom_line(aes(color=Group)) + geom_point() + labs(x="Year", y="Share of Parent PLUS recipients who are zero-EFC") + scale_y_continuous(lim=c(0, 0.45), labels = scales::percent_format(accuracy = 1)) + scale_x_continuous(breaks=c(2000, 2004, 2008, 2012, 2016)) # FIGURE 3

########
## Quick query: median PLUS default rate 

CSImay4 <- fread("Most-Recent-Cohorts-Institution.csv", header=TRUE, select=c(
  "UNITID", 
  "OPEID6",
  "INSTNM",       
  "HBCU", 
  "CONTROL",
  "BBRR1_PP_UG_DFLT", 
  "BBRR2_PP_UG_DFLT",
  "BBRR3_PP_UG_DFLT")) %>% filter(duplicated(OPEID6)==FALSE)

CSImay4$BBRR1_PP_UG_DFLT <- as.numeric(CSImay4$BBRR1_PP_UG_DFLT)
CSImay4$BBRR2_PP_UG_DFLT <- as.numeric(CSImay4$BBRR2_PP_UG_DFLT)
CSImay4$BBRR3_PP_UG_DFLT <- as.numeric(CSImay4$BBRR3_PP_UG_DFLT)

CSImay4A <- CSImay4 %>% filter(is.na(BBRR1_PP_UG_DFLT)==FALSE)
median(CSImay4A$BBRR1_PP_UG_DFLT, na.rm=TRUE)

CSImay4B <- CSImay4 %>% filter(is.na(BBRR2_PP_UG_DFLT)==FALSE)
median(CSImay4B$BBRR2_PP_UG_DFLT, na.rm=TRUE)

CSImay4C <- CSImay4 %>% filter(is.na(BBRR3_PP_UG_DFLT)==FALSE)
median(CSImay4C$BBRR3_PP_UG_DFLT, na.rm=TRUE)


##############################################
###                                        ###
###       Redoing the poverty chart        ###
###                                        ###
##############################################

# (1) Weighted totals of PLUS by FPL 
fpl.PLUS.totals96 <- read.csv("Powerstats bnzvzf.csv", header=FALSE, skip=40, nrow=5) %>% select(V1, V3)
fpl.PLUS.totals18 <- read.csv("Powerstats kktnnb.csv", header=FALSE, skip=40, nrow=5) %>% select(V1, V3)

# (2) Share of undergrads by FPL
fpl.UG.percents96 <- read.csv("PowerStats vdhtbw.csv", header=FALSE, skip=11, nrow=1) %>% select(V1, V2, V3, V4, V5, V6)
fpl.UG.percents18 <- read.csv("PowerStats fcuzvd.csv", header=FALSE, skip=11, nrow=1) %>% select(V1, V2, V3, V4, V5, V6)

# (3) Total undergraduate enrollment from NCES  (Digest of Education Statistics Table #303.70)
total.UG.headcount96 <- 12231719	
total.UG.headcount18 <- 16773036

# (4) Weighted sums by poverty level 
fpl.UG.totals96 <- as.numeric((fpl.UG.percents96[1, 2:6] / 100)) * as.numeric(total.UG.headcount96)
fpl.UG.totals18 <- as.numeric((fpl.UG.percents18[1, 2:6] / 100)) * as.numeric(total.UG.headcount18)

povTable <- data.frame("Group"=c("Up to 100% FPL", "101%-200% FPL", "201%-300% FPL", "301%-400% FPL", "Greater than 400% FPL"), 
                       "Share of all undergraduates, 1996" = (as.numeric(fpl.UG.percents96[1, 2:6]) / 100), 
                       "Percentage who received Parent PLUS, 1996" = (as.numeric(fpl.PLUS.totals96[, 2]) / as.numeric(fpl.UG.totals96)), 
                       "Estimated Parent PLUS recipients, 1996" = as.numeric(fpl.PLUS.totals96[, 2]), 
                       "Share of all undergraduates, 2018" = (as.numeric(fpl.UG.percents18[1, 2:6]) / 100), 
                       "Percentage who received Parent PLUS, 2018" = (as.numeric(fpl.PLUS.totals18[, 2]) / as.numeric(fpl.UG.totals18)), 
                       "Estimated Parent PLUS recipients, 2018" = as.numeric(fpl.PLUS.totals18[, 2]))

povTable <- povTable %>% add_row(Group="All students", 
                                 Share.of.all.undergraduates..1996 = 1, # Done
                                 Percentage.who.received.Parent.PLUS..1996 = sum(as.numeric(fpl.PLUS.totals96[, 2]) / sum(as.numeric(fpl.UG.totals96))), 
                                 Estimated.Parent.PLUS.recipients..1996 = sum(povTable$Estimated.Parent.PLUS.recipients..1996), 
                                 Share.of.all.undergraduates..2018 = 1, # Done
                                 Percentage.who.received.Parent.PLUS..2018 = sum(as.numeric(fpl.PLUS.totals18[, 2]) / sum(as.numeric(fpl.UG.totals18))), 
                                 Estimated.Parent.PLUS.recipients..2018 = sum(povTable$Estimated.Parent.PLUS.recipients..2018))

# TABLE 1 


##############################################
###                                        ###
###       Redoing the race chart           ###
###                                        ###
##############################################

# (1) Weighted totals of PLUS by race 
rac.PLUS.totals96 <- read.csv("Powerstats hwjvcr.csv", header=FALSE, skip=43, nrow=6) %>% select(V1, V3)
rac.PLUS.totals18 <- read.csv("Powerstats lubjnx.csv", header=FALSE, skip=43, nrow=6) %>% select(V1, V3)

# (2) Share of undergrads by race
rac.UG.percents96 <- read.csv("PowerStats vzicpu.csv", header=FALSE, skip=11, nrow=1) %>% select(V1, V2, V3, V4, V5, V6, V7)
rac.UG.percents18 <- read.csv("PowerStats locuyc.csv", header=FALSE, skip=11, nrow=1) %>% select(V1, V2, V3, V4, V5, V6, V7)

# (3) Total undergraduate enrollment from NCES  (Digest of Education Statistics Table #303.70)
total.UG.headcount96 <- 12231719	
total.UG.headcount18 <- 16773036

# (4) Weighted sums by race
rac.UG.totals96 <- as.numeric((rac.UG.percents96[1, 2:7] / 100)) * as.numeric(total.UG.headcount96)
rac.UG.totals18 <- as.numeric((rac.UG.percents18[1, 2:7] / 100)) * as.numeric(total.UG.headcount18)

racTable <- data.frame("Group"=c("White", "Black", "Latino/a", "Asian/Pacific Islander", "Native American", "Other race"), 
                       "Share of all undergraduates, 1996" = (as.numeric(rac.UG.percents96[1, 2:7]) / 100), 
                       "Percentage who received Parent PLUS, 1996" = (as.numeric(rac.PLUS.totals96[, 2]) / as.numeric(rac.UG.totals96)), 
                       "Estimated Parent PLUS recipients, 1996" = as.numeric(rac.PLUS.totals96[, 2]), 
                       "Share of all undergraduates, 2018" = (as.numeric(rac.UG.percents18[1, 2:7]) / 100), 
                       "Percentage who received Parent PLUS, 2018" = (as.numeric(rac.PLUS.totals18[, 2]) / as.numeric(rac.UG.totals18)), 
                       "Estimated Parent PLUS recipients, 2018" = as.numeric(rac.PLUS.totals18[, 2]))

racTable <- racTable %>% add_row(Group="All students", 
                                 Share.of.all.undergraduates..1996 = 1, # Done
                                 Percentage.who.received.Parent.PLUS..1996 = sum(as.numeric(rac.PLUS.totals96[, 2]) / sum(as.numeric(rac.UG.totals96))), 
                                 Estimated.Parent.PLUS.recipients..1996 = sum(racTable$Estimated.Parent.PLUS.recipients..1996), 
                                 Share.of.all.undergraduates..2018 = 1, # Done
                                 Percentage.who.received.Parent.PLUS..2018 = sum(as.numeric(rac.PLUS.totals18[, 2]) / sum(as.numeric(rac.UG.totals18))), 
                                 Estimated.Parent.PLUS.recipients..2018 = sum(racTable$Estimated.Parent.PLUS.recipients..2018))
# TABLE 2

