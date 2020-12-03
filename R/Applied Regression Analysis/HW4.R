# Homework 4
# Taylor Last

x <- c(1:200)
lmrf <- function(x){
  exp(-25+.2*x)/(1+exp(-25+.2*x))
}

plot(lmrf(x))

hw4.glm <- (glm(lmrf(x)~x,family=binomial))

lmrf(150)
lmrf(151)

pmrf <- function(x){
  pnorm(-25+.2*x)
}

hw4.glm <- (glm(pmrf(x)~x,family=binomial(link = "probit")))

plot(pmrf(x))
pmrf(125)
summary(hw4.glm)

#######################################################################
# Data Set

performance.glm <- glm(performance$V1~performance$V2,family=binomial)
summary(performance.glm)

plot(performance$V2,performance$V1)
points(performance$V2,glm(performance$V1~performance$V2,family=binomial)$fitted)

exp(-10.308925)

performance.glm <- glm(performance$V1~performance$V2,family=binomial(link="probit"))
summary(performance.glm)


performance.glm <- glm(performance$V1~performance$V2,family=binomial(link="cloglog"))
summary(performance.glm)
