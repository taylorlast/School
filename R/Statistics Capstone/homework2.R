#####################
# Taylor Last
# Homework 2
#####################

dat<-read.csv("~/Downloads/hw2.txt", sep="")
model1 = lm(y~.^7,dat)
options(max.print = 1000000)
alias(model1)

g=lm(y~A+B+C+D+E+F+G+A:B+A:C+A:D+A:E+A:F+A:G+B:D+B:E+B:G+C:D+C:E+C:G+D:E+D:F+D:G+E:F+E:G+F:G+A:C:D+A:C:E+A:C:G+A:D:F+A:E:F+A:F:G, data=dat)
summary(g)

2*coef(g)[-1]  # estimated factorial effects

source("http://www.stat.ucla.edu/~hqxu/stat201A/R/halfnormal.R")
halfnormalplot(2*coef(g)[-1], label=T, n=3)
halfnormalplot(2*coef(g)[-1], label=T, n=5)

g1=lm(y~A+A:C+B:G, data=dat)
summary(g1) #good fit

plot(g1,1)
plot(g1,2) #no problem on the residuals

##you may also check the residual towards each predictor
plot(dat$C, resid(g1), main="Residuals vs holding time (C)") #this on show slightly problem: dispersion, which may be due to too few data

g2=lm(y~A+A:C+B:G+A:F+D:G, data=dat)
summary(g2)

# This is the model we will use
g3 = lm(y~A+C+D+A:C+B:G+D:E+A:F,data=dat)
summary(g3)
plot(g3,1)
plot(g3,2)


library(FrF2)
design = FrF2(nruns = 32, nfactors = 7)
design = data.matrix(design)
design = 2*(design-1.5)
yall = predict(g3, newdata = data.frame(design))
###the best drug combination
design[which(yall == max(yall)),c(1,3,4)]

