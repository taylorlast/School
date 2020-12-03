###################
# Taylor Last
# Lab 5

# Vectorized Calculations
###################


r <- 30 #number of samples
n <- 100 #number of observations (sample size)
mu <- 0
sig <- 1

#z conf interval vs. t conf interval
dat <- rnorm(r*n, mu, sig)
mat1 <- matrix(dat,nrow = r)

means = apply(mat1, 1, mean)
sd_vals = apply(mat1,1,sd)

means
sd_vals

error_bound = qt(.975,n-1)*sd_vals/sqrt(n)  #r-1 df
error_bound2 = qnorm(.975,mu,sig)*sd_vals/sqrt(n)

CI_lower = means-error_bound
CI_upper = means+error_bound

sum((CI_lower<=mu)&(CI_upper>=mu))/r

CI_lower2 = means-error_bound2
CI_upper2 = means+error_bound2

sum((CI_lower2<=mu)&(CI_upper2>=mu))/r

# The t and z distributions cover the interval correctly when the smaple size is large. When the
# sample size is small, the t distribution doesn't do as good of a job as the z distribution. There
# is not a big difference between t and z distributions when the sample size is large.


#3 

r2 <- 100 # number of observations (sample size)
n2 <- 1000 # number of samples
shape = 2
rate = 3

gamma_dat = rgamma(n2*r2,shape=shape,rate=rate) # shape is alpha, rate is beta
gamma_mat = matrix(gamma_dat,nrow = r2)
gamma_mat

gamma_means = apply(gamma_mat,2,mean)
gamma_sd = apply(gamma_mat,2,sd)

error_bound_gamma = qt(.975,r2-1)*gamma_sd/sqrt(r2)

CI_lower_gamma = gamma_means-error_bound_gamma
CI_upper_gamma = gamma_means+error_bound_gamma

sum((CI_lower_gamma<=shape/rate)&(CI_upper_gamma>=shape/rate))/n2

# When the sample size is large, the confidence intervals have an accurate coverage probability, but
# when the sample size is small, the coverage probability is not good assuming normality.

