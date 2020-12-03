#HW 9
#Taylor Last

attach(HAMILTON)

hamiton.x1.cor <- cor(X1,Y)
hamiton.x1.cor 

hamiton.x2.cor <- cor(X2,Y)
hamiton.x2.cor

hamilton.fitBoth <- lm(Y~X1+X2)
summary(hamilton.fitBoth)

cor(X1,X2)
