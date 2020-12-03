# Time Series Demo!
# This demo simulates what time series errors might look like in 
# the 4 cases given in the tutorial.

n = 100 #series length
set.seed(3) #same seed gives same (pseudo) random numbers

# White Noise
eps = rnorm(n)
# This creates a time series object.
ts.eps = ts(eps)
# Plot it + ACF + PACF
#layout(matrix(c(1,1,2,3),2,2,byrow = T))
plot(ts.eps,type='l',main='White Noise Series',
     pch=20,ylab=expression(epsilon(t)))
acf(ts.eps,main='White Noise ACF',ylim=c(-1,1))
pacf(ts.eps,main='White Noise PACF',ylim=c(-1,1))
# Compare these to what the tutorial said you should see.

# These will require some "burn-in" -- time for the correlation
# structure to really set into the series.
burn=400 

# AR(1)
phi=0.5
# Generate the sequence
eps = numeric(burn+n) #creates an empty vector
eps[1] = rnorm(1)
for (i in 2:(burn+n)){
  eps[i] = phi*eps[i-1] + rnorm(1) #this rnorm gives a white noise observation
}
eps = eps[(burn+1):(burn+n)]
# ts object
ts.eps=ts(eps)
# Plot as above.
#layout(matrix(c(1,1,2,3),2,2,byrow = T))
plot(ts.eps,type='l',main='AR(1) Series',
     pch=20,ylab=expression(epsilon(t)))
acf(ts.eps,main='AR(1) ACF',ylim=c(-1,1))
pacf(ts.eps,main='AR(1) PACF',ylim=c(-1,1))

# Fitting an AR(1) model
ar1 = arima(ts.eps,order=c(1,0,0))
# The estimate for the model parameters should be close
# to the value specified for the simulation. 
print(ar1)

# MA(1)
theta = 0.5
# Generate the sequence
eps = numeric(burn+n)
Z = numeric(burn+n)
Z[1] = rnorm(1)
eps[1]=Z[1]
for (i in 2:(burn+n)){
  Z[i] = rnorm(1)
  eps[i] = theta*Z[i-1]+Z[i]
}
eps = eps[(burn+1):(burn+n)]
# ts object
ts.eps=ts(eps)
# Plot as above.
#layout(matrix(c(1,1,2,3),2,2,byrow = T))
plot(ts.eps,type='l',main='MA(1) Series',
     pch=20,ylab=expression(epsilon(t)))
acf(ts.eps,main='MA(1) ACF',ylim=c(-1,1))
pacf(ts.eps,main='MA(1) PACF',ylim=c(-1,1))

# Fitting an AR(1) model
ma1 = arima(ts.eps,order=c(0,0,1))
print(ma1)

# ARMA(1,1)
phi = 0.5
theta = 0.75
# Generate the sequence.
eps = numeric(burn + n)
Z = numeric(burn + n)
Z[1] = rnorm(1)
eps[1] = rnorm(1)
for(i in 2:(burn+n)){
  Z[i] = rnorm(1)
  eps[i] = phi*eps[i-1] + Z[i] + theta*Z[i-1]
}
eps = eps[(burn+1):(burn+n)]
ts.eps=ts(eps)
# Plot as above.
#layout(matrix(c(1,1,2,3),2,2,byrow = T))
plot(ts.eps,type='l',main='ARMA(1,1) Series',
     pch=20,ylab=expression(epsilon(t)))
acf(ts.eps,main='ARMA(1,1) ACF',ylim=c(-1,1))
pacf(ts.eps,main='ARMA(1,1) PACF',ylim=c(-1,1))


# Fit an ARMA(1,1) to the data we just generated.
arma11 = arima(ts.eps,order=c(1,0,1))
print(arma11)
