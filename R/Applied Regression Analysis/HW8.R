#HW 8
#Taylor Last

#1
pressure <- c(30,31,32,33,34,35,36)
mileage <- c(29,32,36,38,37,33,26)


u1 <- scale(pressure)
u2 <- scale(pressure, scale = FALSE)

cor(pressure,I(pressure^2))
cor(u1,I(u1^2))
cor(u2,I(u2^2))

tiredFit <- lm(mileage~u1 + I(u1^2))
summary(tiredFit)
summary(lm(mileage~pressure))

#2
library(ISLR)
Auto <- Auto
attach(Auto)

plot(horsepower,mpg)

x <- sample(1:392)
set1 <- x[1:78]
set2 <- x[79:156]
set3 <- x[157:234]
set4 <- x[235:312]
set5 <- x[313:392]

Auto.1 <- Auto[-set1,]
Auto.2 <- Auto[-set2,]
Auto.3 <- Auto[-set3,]
Auto.4 <- Auto[-set4,]
Auto.5 <- Auto[-set5,]

Auto.t.1 <- Auto[set1,]
Auto.t.2 <- Auto[set2,]
Auto.t.3 <- Auto[set3,]
Auto.t.4 <- Auto[set4,]
Auto.t.5 <- Auto[set5,]

Auto.lm.1 <- lm(mpg~horsepower, data = Auto.1)
mse1 = mean(resid(Auto.lm.1)^2)

Auto.lm.2 <- lm(mpg~horsepower, data = Auto.2)
mse2 = mean(resid(Auto.lm.2)^2)

Auto.lm.3 <- lm(mpg~horsepower, data = Auto.3)
mse3 = mean(resid(Auto.lm.3)^2)

Auto.lm.4 <- lm(mpg~horsepower, data = Auto.4)
mse4 = mean(resid(Auto.lm.4)^2)

Auto.lm.5 <- lm(mpg~horsepower, data = Auto.5)
mse5 = mean(resid(Auto.lm.5)^2)

avgMSE <- (mse1 + mse2 + mse3 + mse4 + mse5)/5


