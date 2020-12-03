###################
# Taylor Last
# 4365 HW 3
###################

library(tidyverse)
library(gridExtra)

gun_data = read_csv('/Users/taylorlast/Documents/GitHub/School/R/Advanced Statistical Programming/full_data.csv',na='NA')

# Distribution of suicide by gender and age
male_suicide = ggplot(data = gun_data[(gun_data$intent == 'Suicide')&(gun_data$sex == 'M'),]) +
  geom_histogram(mapping = aes(x = age),color = 'black',fill = 'blue') +
  xlab('Age')+
  ggtitle('Suicide distribution by age for males')

female_suicide = ggplot(data = gun_data[(gun_data$intent == 'Suicide')&(gun_data$sex == 'F'),]) +
  geom_histogram(mapping = aes(x = age),color = 'black',fill = 'blue') +
  xlab('Age')+
  ggtitle('Suicide distribution by age for females')

grid.arrange(male_suicide, female_suicide, ncol = 1)


# Distribution of homicide by gender and age
male_homicide = ggplot(data = gun_data[(gun_data$intent == 'Homicide')&(gun_data$sex == 'M'),]) +
  geom_histogram(mapping = aes(x = age),color = 'black',fill = 'blue') +
  xlab('Age')+
  ggtitle('Homicide distribution by age for males')

female_homicide = ggplot(data = gun_data[(gun_data$intent == 'Homicide')&(gun_data$sex == 'F'),]) +
  geom_histogram(mapping = aes(x = age),color = 'black',fill = 'blue') +
  xlab('Age')+
  ggtitle('Homicide distribution by age for females')

grid.arrange(male_homicide, female_homicide, ncol = 1)

# Make a table of gun death by sex

gun_data=filter(gun_data,intent=="Accidental"|intent=="Homicide"|intent=="Suicide")
gun_death_grouped = group_by(gun_data,sex,intent)
summarise(gun_death_grouped,mean(age,na.rm=T))