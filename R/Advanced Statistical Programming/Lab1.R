#################
# Taylor Last
# Lab 1

# Covid Analysis
#################

# Read in the data

USCases_B <- read.csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/us_updated8_25.csv',as.is = T)

# Read in the first column
USCases_B[,1]

# Look at the first 5 rows of the data
head(USCases_B)
# The rows are indexed daily for cases and deaths
# The first day is Januaray 21st and the last day is August 24th

# Look at the dimensions of the dataframe
dim(USCases_B)

# Look at the last 5 rows of the data
tail(USCases_B)

# Print the summary of the data
summary(USCases_B)
# The summary statistics show the quartiles and the mean
# The first quartile represents the 25th percentile of the data. 

# Load in the data using tidyverse
library(tidyverse)
USCases_T <- read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/us_updated8_25.csv')

# Look at the top of the dataframe
head(USCases_T)

# Set the first and last days of the dataframe using row number
firstday = 1
lastday = 217

# plot the data of cases against date
plot(as.Date(USCases_B[firstday:lastday,1]),USCases_B[firstday:lastday,2],type = 'l',xlab = 'date',ylab = 'cases', main = 'US Cases')

# plot the data of the cases against date starting in March
firstday_march = 41
plot(as.Date(USCases_B[firstday_march:lastday,1]),USCases_B[firstday_march:lastday,2],type = 'l',xlab = 'date',ylab = 'cases', main = 'US Cases')

#plot the data of deaths against date
plot(as.Date(USCases_B[firstday_march:lastday,1]),USCases_B[firstday_march:lastday,3],type = 'l',xlab = 'date',ylab = 'deaths', main = 'US Deaths')

#arrange in a grid with two rows one columns format so we can plot two graphs in one window
par(mfrow=c(2,1))
plot(as.Date(USCases_B[firstday_march:lastday,1]),USCases_B[firstday_march:lastday,2],type = 'l',xlab = 'date',ylab = 'cases', main = 'US Cases')
plot(as.Date(USCases_B[firstday_march:lastday,1]),USCases_B[firstday_march:lastday,3],type = 'l',xlab = 'date',ylab = 'deaths', main = 'US Deaths')

#Find the daily cases and daily deaths using the diff function

daily_cases = diff(USCases_B[,2],lag=1)
#Add 1 becasue the diff subtracts the previous days total from the current day, there will not be a value for the first day of the dataset.This adds one in.
daily_cases = c(1,daily_cases)

daily_deaths = diff(USCases_B[,3],lag=1)
daily_deaths = c(0,daily_deaths)

par(mfrow=c(2,1))
plot(as.Date(USCases_B[firstday_march:lastday,1]),daily_cases[firstday_march:lastday],type='l',xlab='date',ylab= 'daily cases',main = 'US New Cases')
plot(as.Date(USCases_B[firstday_march:lastday,1]),daily_deaths[firstday_march:lastday],type='l',xlab='date',ylab = 'daily deaths',main = 'US New Deaths')

# The deaths and cases have moved with each other for the most part over the course of the pandemic
# However, recently deaths have not increased with cases. Some of the most prominent features include
# the trends of daily cases and deaths over time.

# Log cases for March
par(mfrow=c(1,1))
march_cases = USCases_B[41:71,]
plot(as.Date(march_cases[,1]),log(march_cases[,2]),type = 'l',xlab='date',ylab= 'log cases',main = 'US log Cases')
# The cases appear to be exponential since the log(cases) is pretty linear

# Log cases for April and May
aprmay_cases = USCases_B[72:132,]
plot(as.Date(aprmay_cases[,1]),log(aprmay_cases[,2]),type = 'l',xlab='date',ylab= 'log cases',main = 'US log Cases')
# The cases appear to be not exponentially growing since the log(cases) is increasing at a decreasing rate

# Log cases from June 1 to July 15th.
junjul_cases = USCases_B[133:177,]
plot(as.Date(junjul_cases[,1]),log(junjul_cases[,2]),type = 'l',xlab='date',ylab= 'log cases',main = 'US log Cases')
# The cases appear to be exponentially growing since the log(cases) is linear

# Log cases from July 16th to August 24th
julaug_cases = USCases_B[178:217,]
plot(as.Date(julaug_cases[,1]),log(julaug_cases[,2]),type = 'l',xlab='date',ylab= 'log cases',main = 'US log Cases')
# The cases appear to be not exponentially growing since the log(cases) is increasing at a decreasing rate.

