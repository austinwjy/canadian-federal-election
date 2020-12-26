#### Cleaning survey and census data ####


## Setup workspace

#devtools::install_github("hodgettsp/cesR")
library(cesR)
library(labelled)
library(tidyverse)


### Cleaing Survey data

# get the ces data()
get_ces("ces2019_web")

# convert values to factor type
ces2019_web <- to_factor(ces2019_web)

# select useful variables
ces_data <- ces2019_web %>% select(cps19_gender,cps19_province,cps19_education,cps19_votechoice,cps19_age)

# select people are intend to vote for either Liberal Party or Conservative Party
survey_data <- ces_data %>% filter(cps19_votechoice=='Liberal Party'|cps19_votechoice=='Conservative Party')

# Drop NAs
survey_data<-na.omit(survey_data)


### Cleaning Census data 

# get the gss data
gss_data <- read_csv("gss.csv")

# select useful variables
gss_data2 <- gss_data %>% select(age,sex,education,province,citizenship_status)

# select people who are eligible to vote
census_data<-gss_data2 %>% filter(age>=18 & (citizenship_status=="By birth"|citizenship_status=="By naturalization"))

# drop NAs
census_data<-na.omit(census_data)


### Data type mapping between survey & census data 

## mapping age variable

# rename cps19_age variable to age in survey data
survey_data<-rename(survey_data,age=cps19_age)

# filter age > 80 to map census data
survey_data<-survey_data %>% filter(age<=80)

# create age groups
survey_data<-survey_data %>% 
  mutate(agegroup = case_when(age <=20 ~ '20 or less',
                              age >20  & age <= 35 ~ '21 to 35',
                              age >35  & age <= 50 ~ '35 to 50',
                              age >50  & age <= 65 ~ '50 to 65',
                              age >65  & age <= 80 ~ '65 to 80',
                              age >80 ~ 'above 80')) 
census_data<-census_data %>% 
  mutate(agegroup = case_when(age <=20 ~ '20 or less',
                              age >20  & age <=  35 ~ '21 to 35',
                              age >35  & age <= 50 ~ '35 to 50',
                              age >50  & age <= 65 ~ '50 to 65',
                              age >65  & age <= 80 ~ '65 to 80',
                              age >80 ~ 'above 80')) 

unique(census_data$agegroup)
unique(survey_data$agegroup)


## mapping sex variable

# rename cps19_gender variable to sex in survey data
survey_data<-rename(survey_data,sex=cps19_gender)

# select people are either male or female
survey_data <- survey_data %>% filter(sex=='A woman'| sex=='A man')

# mapping
survey_data$sex<-ifelse(survey_data$sex=="A woman","Female","Male")

unique(census_data$sex)
unique(survey_data$sex)


## mapping education variable

# drop people who Don't know/ Prefer not to answer in survey data
survey_data <- survey_data %>% filter(cps19_education!="Don't know/ Prefer not to answer")

# assume: Some university = University certificate or diploma below the bachelor's level
# Completed secondary/ high school = High school diploma or a high school equivalency certificate
# Some secondary/ high school = Less than high school diploma or its equivalent
# Bachelor's degree = Bachelor's degree (e.g. B.A., B.Sc., LL.B.)
# Completed technical, community college, CEGEP, College Classique = College, CEGEP or other non-university certificate or di…
# Some technical, community college, CEGEP, College Classique  = College, CEGEP or other non-university certificate or di…
# Master's degree = University certificate, diploma or degree above the bach...
# Professional degree or doctorate = Trade certificate or diploma
# Completed elementary school,Some elementary school,No schooling = Less than high school diploma or its equivalent

lowedu<-c("Some secondary/ high school","Completed elementary school","Some elementary school","No schooling")
collegeedu<-c("Completed technical, community college, CEGEP, College Classique","Some technical, community college, CEGEP, College Classique")

survey_data<-survey_data %>% 
  mutate(education = case_when(cps19_education=="Some university"~"University certificate or diploma below the bachelor's level",
                         cps19_education=="Completed secondary/ high school"~"High school diploma or a high school equivalency certificate",
                         cps19_education%in%lowedu~"Less than high school diploma or its equivalent",
                         cps19_education=="Bachelor's degree"~"Bachelor's degree (e.g. B.A., B.Sc., LL.B.)",
                         cps19_education%in%collegeedu~"College, CEGEP or other non-university certificate or di...",
                         cps19_education=="Master's degree"~"University certificate, diploma or degree above the bach...",
                         cps19_education=="Professional degree or doctorate"~"Trade certificate or diploma"
  ))

survey_data$cps19_education<-NULL

unique(census_data$education)
unique(survey_data$education)


## 
survey_data<-rename(survey_data,province=cps19_province)
str(survey_data$province)

survey_data <- survey_data %>% filter(province!='Northwest Territories'&province!='Yukon'&province!='Nunavut')

unique(census_data$province)
unique(survey_data$province)

# saving the survey & census data as a csv file in my working directory
write_csv(survey_data, "survey_data.csv")
write_csv(census_data, "census_data.csv")


