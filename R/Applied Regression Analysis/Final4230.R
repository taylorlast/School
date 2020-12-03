# Taylor Last
# Final Project

attach(GeorgiaFootballStatProj)

library(dplyr)

useful.matrix <- GeorgiaFootballStatProj[,c("school","homeAway", "points", "completionAttempts", "firstDowns", "fourthDownEff","kickingPoints", "netPassingYards",
                                            "passingTDs", "possessionTime", "rushingAttempts", "rushingYards", "tacklesForLoss",
                                            "thirdDownEff", "totalPenaltiesYards", "totalYards", "turnovers", "yardsPerPass", "yardsPerRushAttempt")]

#Matricies for Georgia and Georgia's oppenents for useful variables
Georgia.useful.matrix <- filter(.data = useful.matrix, school == "Georgia")
Opponent.useful.matrix <- filter(.data = useful.matrix, school != "Georgia")


as.factor(homeAway)

quant.matrix <- useful.matrix[,3:19]

#Correlation Matrix for all useful variables
cor.matrix <- cor(useful.matrix[,3:19])

#Correlation Matix for Georgia and Georgia's oppenents for useful variables
Georgia.cor.matrix <- cor(Georgia.useful.matrix[,3:19])
Oppenent.cor.matrix <- cor(Opponent.useful.matrix[,3:19])

#finding the best model for both
x1 <- model.matrix(Georgia.useful.matrix$points~.-1, data = Georgia.useful.matrix[2:19])
regsubsets.out <- regsubsets(x1, Georgia.useful.matrix$points, nbest = 1, nvmax = 19)
summary.out.subsets <- summary(regsubsets.out)
subsets.df <- as.data.frame(summary.out.subsets$outmat)
plot(regsubsets.out, scale = "adjr2", main = "Adj R^2")

plot(summary.out.subsets$adjr2, xlab = "Number of Variables", ylab = "ADJ R^2", main = "Adjusted R^2 for different number of variables")
plot(summary.out.subsets$bic, xlab = "Number of Variables", ylab = "BIC", main = "BIC for different number of variables")


x2 <- model.matrix(Opponent.useful.matrix$points~.-1, data = Opponent.useful.matrix[2:19])
regsubsets2.out <- regsubsets(x2, Opponent.useful.matrix$points, nbest = 1, nvmax = 19)
summary2.out.subsets <- summary(regsubsets2.out)
subsets2.df <- as.data.frame(summary2.out.subsets$outmat)
plot(regsubsets2.out, scale = "adjr2", main = "Adj R^2")

plot(summary2.out.subsets$adjr2, xlab = "Number of Variables", ylab = "ADJ R^2", main = "Adjusted R^2 - Different # variables (Opponent)")
plot(summary2.out.subsets$bic, xlab = "Number of Variables", ylab = "BIC", main = "BIC - Different # variables (Opponent)")

#Create the lm models
detach(GeorgiaFootballStatProj)
attach(Georgia.useful.matrix)
Georgia.lm <- lm(points ~ homeAway + completionAttempts + rushingYards + thirdDownEff + possessionTime + turnovers)
detach(Georgia.useful.matrix)
attach(Opponent.useful.matrix)
Opponent.lm <- lm(points ~ homeAway + firstDowns + kickingPoints + possessionTime + totalYards + turnovers)

#Check assumptions
summary(Georgia.lm)
plot(residuals(Georgia.lm))
hist(residuals(Georgia.lm))

summary(Opponent.lm)
plot(residuals(Opponent.lm))
hist(residuals(Opponent.lm))


plot(Georgia.lm)
plot(Opponent.lm)

