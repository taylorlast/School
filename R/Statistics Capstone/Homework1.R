################
# Taylor Last
# Homework 1 5010
################

# 1

# Get the data
library(geoR)
data('wolfcamp')

# Look at the data
plot(wolfcamp)
plot(wolfcamp$data)

# Step 0
wolfcamp_variogram5 <- variog(wolfcamp, breaks = seq(0,200,5), option = 'bin')
wolfcamp_variogram10 <- variog(wolfcamp, breaks = seq(0,200,10), option = 'bin')

plot(wolfcamp_variogram5)
plot(wolfcamp_variogram10)

# Step 1
wolfcamp_ext <- cbind(wolfcamp$coords,wolfcamp$data)
lsfit <- lm(wolfcamp_ext[,3]~wolfcamp_ext[,1] + wolfcamp_ext[,2] + wolfcamp_ext[,1]*wolfcamp_ext[,2])
summary(lsfit)
wolfcampres <- cbind(wolfcamp$coords[,1:2],lsfit$residuals)
wolfcampeps <- as.geodata(wolfcampres)
wolfcamp_lm_variog <- variog(wolfcampeps, breaks = seq(0,200,10))
plot(wolfcamp_lm_variog)

# Step 2
vfitmatern = variofit(wolfcamp_lm_variog, ini.cov.pars=c(4000,100), 
                      weights='cressie')
vfitmatern # see what you got
plot(wolfcamp_lm_variog, main='Sample Variogram of Residuals')
lines.variomodel(vfitmatern, col='blue') #look at the fit



vfitgauss = variofit(wolfcamp_lm_variog, ini.cov.pars=c(4000,100), 
                     cov.model='gaussian',weights='cressie')
vfitgauss
plot(wolfcamp_lm_variog, main='Sample Variogram of Residuals')
lines.variomodel(vfitmatern, col='blue') #look at the fit
lines.variomodel(vfitgauss, col='red')


vfitsph = variofit(wolfcamp_lm_variog, ini.cov.pars=c(4000,100), 
                   cov.model='spherical',weights='cressie')
vfitsph
plot(wolfcamp_lm_variog, main='Sample Variogram of Residuals')
lines.variomodel(vfitmatern, col='blue') #look at the fit
lines.variomodel(vfitgauss, col='red')
lines.variomodel(vfitsph, col='green')


'matern'
vfitmatern$value
'gaussian'
vfitgauss$value
'spherical'
vfitsph$value

# Choose the Spherical. It looks like it fits the best and has the lowest SS

# Step 3

library(nlme)
Y = wolfcamp_ext[,3]
xcoord = wolfcamp_ext[,1]
ycoord = wolfcamp_ext[,2]

regcorrerr = gls(Y~xcoord+ycoord+xcoord*ycoord, correlation = corSpher())
summary(regcorrerr)

# 2 

# Step (-1)
x <- seq(.01,10, length.out = 100)
y <- 5 + 10*x
plot(x,y)

# Step 0, part A
n = 100
burn = 400
set.seed(3)
phi = .8

eps = numeric(burn+n) #creates an empty vector
eps[1] = rnorm(1,sd=20)
for (i in 2:(burn+n)){
  eps[i] = phi*eps[i-1] + rnorm(1,sd=20) #this rnorm gives a white noise observation
}

eps = eps[(burn+1):(burn+n)]
# ts object
ts.eps=ts(eps)

#format to see all plots at once
layout(matrix(c(1,1,2,3),2,2,byrow = T))
plot(ts.eps,type='l',main='AR(1) Series',
     pch=20,ylab=expression(epsilon(t)))
acf(ts.eps,main='AR(1) ACF',ylim=c(-1,1))
pacf(ts.eps,main='AR(1) PACF',ylim=c(-1,1))

# Step 0, part B
y=(5+(10*x))+ts.eps

plot(y,type="line")
par(mfrow=c(1,2))
acf(y,main='AR(1) ACF',ylim=c(-1,1))
pacf(y,main='AR(1) PACF',ylim=c(-1,1))

# Turn off graphics settings
dev.off()

# Step 1
lsfit=lm(y~x)
summary(lsfit)
plot(y)
lines(lsfit$fitted.values,col="red")
eps2 = ts(lsfit$residuals)

layout(matrix(c(1,1,2,3),2,2,byrow = T))
plot(eps2,main = 'Residuals',type = 'l')
acf(eps2, ylim = c(-1,1), main = 'ACF of Residuals')
pacf(eps, ylim = c(-1,1), main = 'PACF of Residuals')

dev.off()


# Step 2
ar1 = arima(eps2,order=c(1,0,0))
ar1_conf = confint(ar1)
print(ar1)
print(ar1_conf)


# Step 3
ar1_sim = arima(y, order = c(1,0,0),xreg=x)
ar1_sim_conf = confint(ar1_sim)
print(ar1_sim)
print(ar1_sim_conf)

# Step 4
phi_table <- read.csv('/Users/taylorlast/Documents/GitHub/School/R/Statistics Capstone/Homework1_5010.csv',header=T)
