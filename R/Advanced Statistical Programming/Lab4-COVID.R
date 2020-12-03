########################
# Taylor Last
# Lab 4

# Advanced COVID Analysis

########################

library(tidyverse)
library(gridExtra)
library(lubridate)

casesUS = read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/us.csv')
caseStates = read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/us-states.csv')
caseCounties = read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/us-counties.csv')
activity = read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/Global_Mobility_Report.csv')

select(activity,country_region,date,retail_and_recreation_percent_change_from_baseline,grocery_and_pharmacy_percent_change_from_baseline,parks_percent_change_from_baseline)

#reduce to March 1 through September 25:
casesUS=filter(casesUS,(date>=ymd("2020-03-01")&(date<="2020-09-25")))
caseStates=filter(caseStates,(date>=ymd("2020-03-01")&(date<="2020-09-25")))
caseCounties=filter(caseCounties,(date>=ymd("2020-03-01")&(date<="2020-09-25")))
activity<-filter(activity,(date>=ymd("2020-03-01")&(date<="2020-09-25")))

# Investigating June and July increase in southern states

#Georgia
#filter mobility data by only State of Georgia
Georgia_data=filter(activity,sub_region_1=="Georgia",is.na(sub_region_2))
Georgia_data=Georgia_data[1:169,]

#filter case data by only State of Georgia
GA_cases=filter(caseStates,state=="Georgia")
GA_cases

#calculate daily new cases
newcasesGA=GA_cases%>%pull(cases)%>%diff
newcasesGA

#add zero on front so matches length
newcasesGA=c(0,newcasesGA)

#adds new coumn of daily cases
GA_cases=mutate(GA_cases,dailycases=c(0,diff(cases)))
GA_cases
GA_mobility=ggplot(data=Georgia_data)+
  geom_line(mapping=(aes(x=Georgia_data$date,y=Georgia_data$retail_and_recreation_percent_change_from_baseline)))+
  xlab("Date")+
  ylab("Activity")+
  ggtitle("Georgia")
GA_mobility

GA_caseplot=ggplot(data=GA_cases)+
  geom_smooth(mapping=aes(x=GA_cases$date,y=GA_cases$dailycases))+
  xlab("Date")+
  ylab("New Cases")
GA_caseplot

grid.arrange(GA_mobility,GA_caseplot,ncol=1)




#Alabama
#filter mobility data by only State of Alabama
Alabama_data=filter(activity,sub_region_1=="Alabama",is.na(sub_region_2))
Alabama_data=Alabama_data[1:169,]

#filter case data by only State of Georgia
AL_cases=filter(caseStates,state=="Alabama")
AL_cases

#calculate daily new cases
newcasesAL=AL_cases%>%pull(cases)%>%diff
newcasesAL

#add zero on front so matches length
newcasesAL=c(0,newcasesAL)

#adds new coumn of daily cases
AL_cases=mutate(AL_cases,dailycases=c(0,diff(cases)))
AL_cases
AL_mobility=ggplot(data=Alabama_data)+
  geom_line(mapping=(aes(x=Alabama_data$date,y=Alabama_data$retail_and_recreation_percent_change_from_baseline)))+
  xlab("Date")+
  ylab("Activity")+
  ggtitle("Alabama")
AL_mobility

AL_caseplot=ggplot(data=AL_cases)+
  geom_smooth(mapping=aes(x=AL_cases$date,y=AL_cases$dailycases))+
  xlab("Date")+
  ylab("New Cases")
AL_caseplot

grid.arrange(AL_mobility,AL_caseplot,ncol=1)




#Florida
#filter mobility data by only State of Florida
Florida_data=filter(activity,sub_region_1=="Florida",is.na(sub_region_2))
Florida_data=Florida_data[1:169,]

#filter case data by only State of Georgia
FL_cases=filter(caseStates,state=="Florida")
FL_cases

#calculate daily new cases
newcasesFL=FL_cases%>%pull(cases)%>%diff
newcasesFL

#add zero on front so matches length
newcasesFL=c(0,newcasesFL)

#adds new coumn of daily cases
FL_cases=mutate(FL_cases,dailycases=c(0,diff(cases)))
FL_cases
FL_mobility=ggplot(data=Florida_data)+
  geom_line(mapping=(aes(x=Florida_data$date,y=Florida_data$retail_and_recreation_percent_change_from_baseline)))+
  xlab("Date")+
  ylab("Activity")+
  ggtitle("Florida")
FL_mobility

FL_caseplot=ggplot(data=FL_cases)+
  geom_smooth(mapping=aes(x=FL_cases$date,y=FL_cases$dailycases))+
  xlab("Date")+
  ylab("New Cases")
FL_caseplot

grid.arrange(FL_mobility,FL_caseplot,ncol=1)



#Mississippi
#filter mobility data by only State of Mississippi
Mississippi_data=filter(activity,sub_region_1=="Mississippi",is.na(sub_region_2))
Mississippi_data=Mississippi_data[1:169,]

#filter case data by only State of Georgia
MS_cases=filter(caseStates,state=="Mississippi")
MS_cases

#calculate daily new cases
newcasesMS=MS_cases%>%pull(cases)%>%diff
newcasesMS

#add zero on front so matches length
newcasesMS=c(0,newcasesMS)

#adds new coumn of daily cases
MS_cases=mutate(MS_cases,dailycases=c(0,diff(cases)))
MS_cases
MS_mobility=ggplot(data=Mississippi_data)+
  geom_line(mapping=(aes(x=Mississippi_data$date,y=Mississippi_data$retail_and_recreation_percent_change_from_baseline)))+
  xlab("Date")+
  ylab("Activity")+
  ggtitle("Mississippi")
MS_mobility

MS_caseplot=ggplot(data=MS_cases)+
  geom_smooth(mapping=aes(x=MS_cases$date,y=MS_cases$dailycases))+
  xlab("Date")+
  ylab("New Cases")
MS_caseplot

grid.arrange(MS_mobility,MS_caseplot,ncol=1)




#New York
#filter mobility data by only State of Mississippi
New_York_data=filter(activity,sub_region_1=="New York",is.na(sub_region_2))
New_York_data=New_York_data[1:169,]

#filter case data by only State of Georgia
NY_cases=filter(caseStates,state=="New York")
NY_cases

#calculate daily new cases
newcasesNY=NY_cases%>%pull(cases)%>%diff
newcasesNY

#add zero on front so matches length
newcasesNY=c(0,newcasesNY)

#adds new coumn of daily cases
NY_cases=mutate(NY_cases,dailycases=c(0,diff(cases)))
NY_cases
NY_mobility=ggplot(data=New_York_data)+
  geom_line(mapping=(aes(x=New_York_data$date,y=New_York_data$retail_and_recreation_percent_change_from_baseline)))+
  xlab("Date")+
  ylab("Activity")+
  ggtitle("New York")
NY_mobility

NY_caseplot=ggplot(data=NY_cases)+
  geom_smooth(mapping=aes(x=NY_cases$date,y=NY_cases$dailycases))+
  xlab("Date")+
  ylab("New Cases")
NY_caseplot

grid.arrange(NY_mobility,NY_caseplot,ncol=1)


# Based on the plots of 4 southern states (Georgia, Florida, Alabama, Mississippi) vs. New York
# We see that a change in activity may have caused an increase in cases in the south due to 
# businesses opening up faster. In New York, there was a big spike due to the original outbreak
# but it came down a lot since the peak. Activity has steadily increased in New York and there seems 
# to be no large spike due to activity. This could be due to harsher social distancing guidelines 
# and other rules that are not enforced in sothern states.

