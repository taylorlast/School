###########################
# Taylor Last
# Lab 2
###########################

# Question 1

# Load the Data

library(tidyverse)
college_data <- read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/MERGED2015_16_PP.csv', na=c('','NA','NULL','PrivacySuppressed'))

college_data

# Look at the data documentation and decide which variable is appropriate


# Make a plot with appropriate labels

library(ggplot2)
ggplot(data=college_data, aes(x=DEBT_MDN)) +
  geom_histogram(fill = 'blue') +
  xlab('Median Debt') +
  ggtitle('Median Debt Across Institutions')

# The distribution is slightly skewed right for median debt- this means
# there is a higher count/frequency of students with lower debt

#Question 2

ggplot(data = college_data, aes(DEBT_MDN, fill = factor(CONTROL))) +
  geom_histogram(position = 'dodge') +
  labs(fill = "Institution Type") +
  scale_fill_discrete(labels = c('Public','Private not-for-profit','for profit')) +
  xlab('Median Debt') +
  ggtitle('Median Debt Across Institutions')

# As we would expect, Public institutions have more students with smaller amounts of debt,
# while private institutions have more students with higher amounts of debt.

# Question 3
ggplot(data = college_data,aes(y=C150_4_POOLED, x=COSTT4_A, color = factor(CONTROL))) +
  geom_point() +
  labs(color = 'Institution Type')  +
  scale_color_discrete(labels = c('Public','Private not-for-profit','for profit')) +
  xlab('cost')+
  ylab('completion percentage')+
  ggtitle('Cost vs. Completion % across different institutions')
  
# Across all institutions, as cost increases, completion percentage also increases.
# This is most likely because the more school that is completed, the more it costs.

# Question 4,  MD_EARN_WNE_P10 is the y parameter, DEBT_MDN is the x
college_data_10 <- read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/MERGED2007_08_PP.csv',na=c('','NA','NULL','PrivacySuppressed'))

ggplot(data = college_data_10, aes(x=DEBT_MDN, y=MD_EARN_WNE_P10, color = factor(CONTROL))) +
  geom_point() +
  labs(color = 'Institution Type') +
  scale_color_discrete(labels = c('Public','Private not-for-profit','for profit')) +
  xlab('Debt') +
  ylab('Earnings after graduation') +
  ggtitle('Debt vs. Earnings after graduation across different institutions')

# As debt increases, earnings after graduation also increases. This is due to the fact that
# the more time a student spends in school, the more debt they will have and the more they will make.


  