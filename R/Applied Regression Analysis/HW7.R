#HW 7
#Taylor Last

attach(STREETVN)

#Fit the model with interaction term
street.lm <- lm(Earnings~Age*Hours)
summary(street.lm)

STREETVN.lm <- lm(Earnings~Age+Hours)
summary(STREETVN.lm)

#pressure and mileage comparison
pressure <- c(30,31,32,33,34,35,36)
mileage <- c(29,32,36,38,37,33,26)

plot(pressure, mileage)

#Fitting a second order model for street vendors
#	E(y)=β_0+β_1 x_1+β_2 x_2+β_3 x_1 x_2+β_4 x_1^2+β_5 x_2^2

street2order.lm <- lm(Earnings~Age*Hours + I(Age^2) + I(Hours^2))
summary(street2order.lm)

AIC(street.lm)
BIC(street.lm)
AIC(street2order.lm)
BIC(street2order.lm)
