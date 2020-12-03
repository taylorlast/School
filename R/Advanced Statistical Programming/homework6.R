##################
# Taylor Last
# Stat 4365 HW 6

# Writing a Function for power of linear regression 
# with different slopes, intercepts, and sample sizes.
#################

library(tidyverse)

sim_t_power = function(n,b,a,sd,nrep) {
  pvals=vector(length=nrep)
  for (r in 1:nrep){
    x=runif(n,min=0,max=10)
    y=a+(b*x)+rnorm(n,sd=sd)
    model=summary(lm(y~x))
    pvals[r]=model$coefficients[2,4]
  }
  return(sum(pvals<.05)/nrep)
}

# Test power function
sim_t_power(10,1,1,1,1000)


LinRegPower = function(n,b,a,sd,nrep){
  
  pow1=NULL
  
  for(i in n) {
    powN=vector(length=length(a))
    for (num in seq_along(a)){
      powN[num]=sim_t_power(i,b[num],a[num],sd,nrep)
      labels = c('a = ',a,', b= ', b)
    }
    pow1 = rbind(pow1,powN)
  }
  result = matplot(n,pow1,type ='l',col=1:length(a),lty = 1:length(a),lwd=2)

  return(result)
}

Nseq=seq(from=2,to=30,by=2)
B=c(0.2,0.5,1.0)
A=c(1,1,1)

LinRegPower(Nseq,B,A,1,100)

#Hardcoded legend for example given
legend("bottomright",c("a=1,b=.2","a=1,b=.5","a=1,b=1"),col=2:4,lty=1:3)

