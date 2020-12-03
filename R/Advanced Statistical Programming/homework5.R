####################
# Taylor Last
# Homework 5 STAT 4365

# Writing Functions:
# Quartile Function
# Least Square Function
####################

# Question 1

median <- function(x){
  x = sort(x)
  n = length(x)
  med = (n+1)/2
  
  if (floor(med) != med){
    return((x[floor(med)] + x[ceiling(med)])/2)
  }
  else {
    return(x[med])
  }
}

quartile <- function(x) {
  x <- sort(x)
  n <- length(x)
  med <- (n+1)/2
  
  if (floor(med) != med) {
    lower = med-1/2
    upper = med+1/2
  } else {
    lower = med-1
    upper = med+1
  }
  c(Q1=median(x[1:lower]), Median = median(x), Q3=median(x[upper:n]))
}

#TESTS
quartile(1:100)

# Question 2

lsr <- function(x,y){
  if (length(x) != length(y)){
    return("")
  }
  
  n = length(x)
  
  slope = (n*sum(x*y) - sum(x)*sum(y))/(n*sum(x^2)-(sum(x))^2)
  intercept = (sum(y) - slope*sum(x))/n
  y_pred = slope*x + intercept
  sse = sum((y - y_pred)^2)
  residuals = y-y_pred
  slope_se = sqrt(sse/(n-2))/ sqrt(sum((x-mean(x))^2))
  slope_tval = slope/slope_se
  pvalue = pt(-abs(slope_tval),df=n-2) + pt(abs(slope_tval),df=n-2,lower.tail=F)
  return(list(intercept = intercept,
               slope = slope,
               sse = sse,
               residuals = residuals,
               pvalue = pvalue))
} 

# Simulation in Brownian Motion
x = rnorm(50,0,1)
y = rnorm(50,0,1)
lsr(x,y)
test = lm(y~x)
summary(test)

