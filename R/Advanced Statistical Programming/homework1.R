##########################################
# Homework 1 - STAT 4365
# Taylor Last

# Gun Data Analysis and College Data Analysis
##########################################

# Import necessary libraries
library(tidyverse)
library(readxl)
library(ggplot2)

# Read in the data using tidyverse
table1 <- read_excel('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/table-1.xls',skip=3)

# Take only the rows with data in it and attach the data set
crime <- table1[1:20,]
crime
attach(crime)

#1a
#Plot of violent crime rate over time
ggplot(data=crime)+
  geom_point(mapping=aes(x=Year,y=`Violent 
crime 
rate`))+
  geom_line(mapping=aes(x=Year,y=`Violent 
crime 
rate`,group=1))+
  ggtitle("Violent Crime Rate from 1998-2017")


# 1b
#Plot of different types of violent crime

ggplot(data=crime,aes(x=Year))+
  geom_line(aes(y=`Violent 
crime 
rate`,color="Total Rate",group=1))+
  geom_line(aes(y=`Murder and 
nonnegligent 
manslaughter 
rate`,color="Murder Rate",group=1))+
  geom_line(aes(y=`Rape
(legacy 
definition) 
rate4`,color="Rape Rate",group=1))+
  geom_line(aes(y=`Robbery 
rate`,group=1,color="Robbery Rate"))+
  geom_line(aes(y=`Aggravated 
assault rate`,color="Aggravated Assault Rate",group=1))+
  ggtitle("Different types of violent crime rates over time")

# 1c
# Plot of property crime rate over time

ggplot(data=crime)+geom_point(mapping=aes(x=Year,y=`Property 
crime 
rate`,group=1))+
  geom_line(mapping=aes(x=Year,y=`Property 
crime 
rate`,group=1))+
  ggtitle("Property crime rate from 1998-2017")

#1d
# Plot of different types of property crime rates over time

ggplot(data=crime,aes(x=Year))+
  geom_line(mapping=aes(y=`Property 
crime 
rate`,group=1,color="Property Crime Rate"))+
  geom_line(mapping=aes(y=`Burglary 
rate`,group=1,color="Burglary Rate"))+
  geom_line(mapping=aes(y=`Larceny-
theft rate`,group=1,color="Larceny Theft Rate"))+
  geom_line(mapping=aes(y=`Motor 
vehicle 
theft 
rate`,group=1,color="Motor Vehicle Theft Rate"))+
  ggtitle("Different property crime rates from 1998-2017")

detach(crime)

# Question 2
# 2a

college_data <- read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/MERGED2015_16_PP.csv',na=c('','NA','NULL','PrivacySuppressed'))

#Library to have multiple plots
library(gridExtra)

lo1 <- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_LO))+
  ggtitle("income $0-$30k")+
  xlab("Percentage of Students")

# Create ggplots for different levels of income 
med1<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_M1))+
  ggtitle("income $30,001-$48,000")+
  xlab("Percentage of Students")

med2<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_M2))+
  ggtitle("income $48,001-$75,000")+
  xlab("Percentage of Students")

hi1<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_H1))+
  ggtitle("income $75,001-$110,000")+
  xlab("Percentage of Students")

hi2<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_H2))+
  ggtitle("income $110,001+")+
  xlab("Percentage of Students")

grid.arrange(lo1,med1,med2,hi1,hi2,ncol=2)

#2b

# Create different ggplots for different income and color it by ICLEVEL

lo1_b <- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_LO,fill=factor(ICLEVEL)))+
  ggtitle("income $0-$30k by institution type")+
  xlab("Percentage of Students")+
  scale_fill_discrete(name = 'Type of Institution', labels=c('4 year','2 year','less than 2 year'))

med1_b<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_M1,fill=factor(ICLEVEL)))+
  ggtitle("income $30,001-$48,000 by institution type")+
  xlab("Percentage of Students")+
  scale_fill_discrete(name = 'Type of Institution', labels=c('4 year','2 year','less than 2 year'))

med2_b<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_M2,fill=factor(ICLEVEL)))+
  ggtitle("income $48,001-$75,000 by institution type")+
  xlab("Percentage of Students")+
  scale_fill_discrete(name = 'Type of Institution', labels=c('4 year','2 year','less than 2 year'))

hi1_b<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_H1,fill=factor(ICLEVEL)))+
  ggtitle("income $75,001-$110,000 by institution type")+
  xlab("Percentage of Students")+
  scale_fill_discrete(name = 'Type of Institution', labels=c('4 year','2 year','less than 2 year'))

hi2_b<- ggplot(data=college_data)+
  geom_histogram(mapping = aes(x=INC_PCT_H2,fill=factor(ICLEVEL)))+
  ggtitle("income $110,001+ by institution type")+
  xlab("Percentage of Students")+
  scale_fill_discrete(name = 'Type of Institution', labels=c('4 year','2 year','less than 2 year'))

grid.arrange(lo1_b,med1_b,med2_b,hi1_b,hi2_b,ncol=2)

#2d

#Create different plots showing the correlation between faculty salary and the
#percentage of students with family income at different levels and colored by ICLEVEL

lo1_c <-ggplot(data=college_data)+
  geom_point(mapping=aes(x=INC_PCT_LO,y=AVGFACSAL,color=factor(ICLEVEL)))+
  geom_smooth(mapping=aes(x=INC_PCT_LO,y=AVGFACSAL))+xlab("Percentage of Students")+
  ylab("Faculty Salary")+
  ggtitle("Percentage of students with family income between $0-$30k versus faculty salary")+
  scale_color_discrete(name="Type of Insitution",labels=c("4 year","2 year","Less than 2 year"))

med1_c<-ggplot(data=college_data)+
  geom_point(mapping=aes(x=INC_PCT_M1,y=AVGFACSAL,color=factor(ICLEVEL)))+
  geom_smooth(mapping=aes(x=INC_PCT_M1,y=AVGFACSAL))+xlab("Percentage of Students")+
  ylab("Faculty Salary")+
  ggtitle("Percentage of students with family income between $30,001-$48,000 versus faculty salary")+
  scale_color_discrete(name="Type of Insitution",labels=c("4 year","2 year","Less than 2 year"))

med2_c<-ggplot(data=college_data)+
  geom_point(mapping=aes(x=INC_PCT_M2,y=AVGFACSAL,color=factor(ICLEVEL)))+
  geom_smooth(mapping=aes(x=INC_PCT_M2,y=AVGFACSAL))+xlab("Percentage of Students")+
  ylab("Faculty Salary")+
  ggtitle("Percentage of students with family income between $48,001-$75,000 versus faculty salary")+
  scale_color_discrete(name="Type of Insitution",labels=c("4 year","2 year","Less than 2 year"))

hi1_c<-ggplot(data=college_data)+
  geom_point(mapping=aes(x=INC_PCT_H1,y=AVGFACSAL,color=factor(ICLEVEL)))+
  geom_smooth(mapping=aes(x=INC_PCT_H1,y=AVGFACSAL))+xlab("Percentage of Students")+
  ylab("Faculty Salary")+
  ggtitle("Percentage of students with family income between $75,001-$110,000 versus faculty salary")+
  scale_color_discrete(name="Type of Insitution",labels=c("4 year","2 year","Less than 2 year"))

hi2_c<-ggplot(data=college_data)+
  geom_point(mapping=aes(x=INC_PCT_H2,y=AVGFACSAL,color=factor(ICLEVEL)))+
  geom_smooth(mapping=aes(x=INC_PCT_H2,y=AVGFACSAL))+xlab("Percentage of Students")+
  ylab("Faculty Salary")+
  ggtitle("Percentage of students with family income  $110,001+ versus faculty salary")+
  scale_color_discrete(name="Type of Insitution",labels=c("4 year","2 year","Less than 2 year"))

grid.arrange(lo1_c,med1_c,med2_c,hi1_c,hi2_c,ncol=2)

# Question #3

MERGED2007_08_PP <- read_csv("/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/MERGED2007_08_PP.csv",na=c('','NA','NULL','PrivacySuppressed'))
attach(MERGED2007_08_PP)

#admissions
ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping=aes(x=ADM_RATE_ALL,y=MD_EARN_WNE_P10),color='red')+
  geom_smooth(mapping=aes(x=ADM_RATE_ALL,y=MD_EARN_WNE_P10),color="black")+
  xlab("Admission Rate")+ylab("Salary after 10 years")+
  ggtitle("Admissions rate versus salary after 10 Years")

#in-state tuition
ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping=aes(x=TUITIONFEE_IN,y=MD_EARN_WNE_P10),color="red")+
  geom_smooth(mapping=aes(x=TUITIONFEE_IN,y=MD_EARN_WNE_P10),color="black")+
  xlab("In-state tuition")+ylab("Salary after 10 years")+
  ggtitle("In-state tuition rate versus salary after 10 Years")

#SAT scores
ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping=aes(x=SAT_AVG_ALL,y=MD_EARN_WNE_P10),color="red")+
  geom_smooth(mapping=aes(x=SAT_AVG_ALL,y=MD_EARN_WNE_P10),color="black")+
  xlab("SAT Score")+ylab("Salary after 10 years")+
  ggtitle("SAT Score versus salary after 10 Years")

#region
ggplot(data=MERGED2007_08_PP)+
  geom_boxplot(mapping=aes(x=factor(REGION),y=MD_EARN_WNE_P10))+
  xlab("Region")+
  scale_x_discrete(labels=c("Service Schools","New England","Mid East","Great Lakes","Plains","Southeast","Southwest","Rocky Mountain","Far West","Outlying Areas"))+
  ylab("Salary After 10 Years")+
  ggtitle("Salary and region versus salary after 10 years")

#faculty salary
ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping=aes(x=AVGFACSAL,y=MD_EARN_WNE_P10),color="red")+
  geom_smooth(mapping=aes(x=AVGFACSAL,y=MD_EARN_WNE_P10),color="black")+
  xlab("Faculty Salary")+ylab("Salary 10 Years After Graduation")+
  ggtitle("Faculty salary versus graduate salary")

#boys vs girls
g=ggplot(data=MERGED2007_08_PP)+
  geom_boxplot(mapping=aes(x=MN_EARN_WNE_MALE0_P10))+
  xlim(0,150000)+
  xlab("Female income 10 years after graduation")+
  theme(axis.text.y = element_blank())

b=ggplot(data=MERGED2007_08_PP)+
  geom_boxplot(mapping=aes(x=MN_EARN_WNE_MALE1_P10))+
  xlim(0,150000)+
  xlab("Male income 10 years after graduation")+
  theme(axis.text.y = element_blank())

grid.arrange(b,g,ncol=1)

# Question 4

# Create a plot of parents highest level of education and compare against
# Students earnings 10 years after graduation to see the effect of childhood
# on career.

ms<-ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping = aes(x=PAR_ED_PCT_MS, y=MN_EARN_WNE_P10),color = 'red')+
  geom_smooth(mapping = aes(x=PAR_ED_PCT_MS, y=MN_EARN_WNE_P10),color='black')+
  xlab('Parents with middle school as highest level edu.')+
  ylab('Earnings 10 years after graduation')+
  ggtitle('Parents education vs earnings after grad')

hs<-ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping = aes(x=PAR_ED_PCT_HS, y=MN_EARN_WNE_P10),color = 'red')+
  geom_smooth(mapping = aes(x=PAR_ED_PCT_HS, y=MN_EARN_WNE_P10),color='black')+
  xlab('Parents with high school as highest level edu.')+
  ylab('Earnings 10 years after graduation')+
  ggtitle('Parents education vs earnings after grad')

ps<-ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping = aes(x=PAR_ED_PCT_PS, y=MN_EARN_WNE_P10),color = 'red')+
  geom_smooth(mapping = aes(x=PAR_ED_PCT_PS, y=MN_EARN_WNE_P10),color='black')+
  xlab('Parents with postsecondary school as highest level edu.')+
  ylab('Earnings 10 years after graduation')+
  ggtitle('Parents education vs earnings after grad')

# Look at the effect of family income on student earnings 10 years after
# Graduation

fam_inc<-ggplot(data=MERGED2007_08_PP)+
  geom_point(mapping = aes(x=FAMINC, y=MN_EARN_WNE_P10),color = 'red')+
  geom_smooth(mapping = aes(x=FAMINC, y=MN_EARN_WNE_P10),color='black')+
  xlab('Family Income')+
  ylab('Earnings 10 years after graduation')+
  ggtitle('Parents income vs earnings after grad')

grid.arrange(ms,hs,ps,fam_inc,ncol=2)

