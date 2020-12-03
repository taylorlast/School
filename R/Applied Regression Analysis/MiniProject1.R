# File: miniProject1_4230
# Taylor Last

#Establish x and y for n = 15

x <- runif(15,0,5)
y <- replicate(1000,lm(3+5*x+rnorm(15,0,sqrt(.5))~x)$coefficients)

#Plot histogram of Beta0 for n = 15
hist(y[1,], main= "Histogram of Beta0", xlab = "Beta0")

#Plot histogram of Beta1 for n = 15
hist(y[2,], main = "Histogram of Beta1", xlab = "Beta1")

#Plot histogram of Sigma(hat)^2 vales for n = 15
variance = 0
for (i in 1:1000){
  y = 3 + 5*x + rnorm(15,0,sqrt(.5))
  variance[i] = (summary(lm(y~x))$sigma)^2
}
hist(variance)
summary(variance)

#Plot the estimated regression lines, along with the true line for n = 15

plot(x,3+x*5)

for (i in 1:1000){
  abline(y[1,i],y[2,i])
}

abline(3,5,col = "red")




















#Clear Console
cat("\014")

#Clear environment
rm(list = ls())
