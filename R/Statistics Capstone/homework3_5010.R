#############################
# Homework 3 5010
# Taylor Last
#############################

#1

# Read in the table
bootsobs <- read.table("/Users/taylorlast/Documents/GitHub/School/R/Statistics Capstone/bootsobs.txt", quote="\"", comment.char="")


hist(bootsobs$V1)
bootsobs_mean = mean(bootsobs$V1)
bootsobs_sd = sd(bootsobs$V1)

skew = function(x,d){
  return(mean((x[d]-mean(x[d]))^3/(sd(x[d]))^3))
}

library(boot)

phat.boots= boot(data=bootsobs$V1, statistic=skew, R=2000)
hist(phat.boots$t)

phatMean = mean(phat.boots$t)
phatMean

phatStdErr = sd(phat.boots$t)
phatStdErr

phatCI = quantile(phat.boots$t,c(0.025,0.975))
phatCI

#2
sample_skew = replicate(2000, skew(rnorm(20,bootsobs_mean,bootsobs_sd)))
hist(sample_skew)


#3 

max_func = function(x,d){
  return(max(x[d]))
}

phat.boots.max = boot(data=bootsobs$V1, statistic=max_func, R=2000)
hist(phat.boots.max$t)

phatMean_max = mean(phat.boots.max$t)
phatMean_max

phatStdErr_max = sd(phat.boots.max$t)
phatStdErr_max

phatCI_max = quantile(phat.boots.max$t,c(0.025,0.975))
phatCI_max


sample_max = replicate(2000, max_func(rnorm(20,bootsobs_mean,bootsobs_sd)))
hist(sample_max)
mean(sample_max)
