# File: STAT4230_HW3
# Taylor Last

###################################################################################
# establish x and y
x <- c(100,700,450,150,500,800,70,50,300,350,750,700)
y <- c(130,150,60,120,50,200,150,160,50,40,180,130)

#plot of y on x
plot(x,y)

#establish gems as an lm object that distributes y on x, gives summary and establishes resids
gems <- lm(y~x)
summary(gems)
resids<-residuals(gems)

#plot the residuals against price per carat
plot(x,resids,xlab = "Price per Carat", ylab = "Residuals")
####################################################################################

#plot of age on proportion
age<-c(0,0,1,1,2,2,3,3,4,4)
proportion<-c(.94,.96,.70,.76,.60,.40,.24,.30,.12,.10)
plot(age,proportion)

retail.lm<-lm(proportion~age)

fitVal<-fitted(retail.lm)
resids<-residuals(retail.lm)

#plot of residuals against fitted values

dffits(retail.lm)

plot(retail.lm$fitted.values, resids, xlab = "Fitted Values", ylab = "Residuals")

#Open HOMESMOKE
HOMESMOKE <- read.table("~/Downloads/HOMESMOKE.txt", header=TRUE, quote="\"")

#Fit SLR for HOMESMOKE
homesmoke.lm<-lm(HOMESMOKE$weight~HOMESMOKE$pctcigarettes)
summary(homesmoke.lm)

resids<-residuals(homesmoke.lm)

mean(resids)
var(resids)

#fitted values vs. resids
plot(homesmoke.lm$fitted.values,resids,xlab = "Fitted",ylab = "Residuals")
plot(homesmoke.lm$fitted.values,rstandard(homesmoke.lm),xlab = "Fitted",ylab = "STD Residuals")
abline(0,0)


#histogram of resids
hist(resids)

#measure of influence
influence.measures(homesmoke.lm)
########################################################################
misswork.lm<-lm(MISSWORK$HOURS~MISSWORK$WAGES)
resids <- residuals(misswork.lm)

plot(misswork.lm$fitted.values,resids)
influence.measures(misswork.lm)
plot(MISSWORK$WAGES,MISSWORK$HOURS)






