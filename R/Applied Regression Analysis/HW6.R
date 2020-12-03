#HW6
#Taylor Last

#Scatterplot Matrix
pairs(STREETVN)

#Matrix of Correlations
cor(STREETVN)

#Remind R to draw from this dataset
attach(STREETVN)

#Summary of model
STREETVN.lm <- lm(Earnings~Age+Hours)
STREETVN.lm

#Confidence intervals for the betas
summary(STREETVN.lm)
t <- qt(.975,12)
ageLower <- 13.35 - (t*7.672)
ageUpper <- 13.35 + (t*7.672)
hoursLower <- 243.714 - (63.512*t)
hoursUpper <- 243.714 + (63.512*t)

#Graph equation y = 1 + 2x1 + x2 − 3x3
curve(2*x-7)
curve(2*x-3)

#Graph equation y = 1 + x1 − x2 + 2x_1^2 + x_2^2 , x2 = 0,1,2
curve(2*x^2 + x + 1)
curve(2*x^2 + x + 1)
curve(2*x^2 + x + 2)
