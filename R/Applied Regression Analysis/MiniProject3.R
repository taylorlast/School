#Mini Project 3
#Taylor Last

#Scenario 1 - Normal with mean of 0 and variance of 16 (4 noise)
x.matrix1 <- matrix(nrow = 150, ncol = 10, data = runif(150*10))
x1 = x.matrix1[,1]
x2 = x.matrix1[,2]
x3 = x.matrix1[,3]
x4 = x.matrix1[,4]
x5 = x.matrix1[,5]
x6 = x.matrix1[,6]

output1 <- replicate(500, leaps(x.matrix1, 4*x1 + 5*x2 + 5.5*x3 + x4 + 1.5*x5 +.5*x6 + rnorm(150,0,4), 
                     method = "adjr2", nbest = 3)$which)

output1.rsquare <- leaps(x.matrix1, 4*x1 + 5*x2 + 5.5*x3 + x4 + 1.5*x5 +.5*x6 + rnorm(150,0,4), 
                                        method = "adjr2", nbest = 3)$adjr2

output1.rquareConcat <- c(sum(output1.rsquare[1:3])/3,sum(output1.rsquare[4:6])/3,sum(output1.rsquare[7:9])/3,
                          sum(output1.rsquare[10:12])/3,sum(output1.rsquare[13:15])/3,sum(output1.rsquare[16:18])/3,
                          sum(output1.rsquare[19:21])/3, sum(output1.rsquare[22:24])/3, sum(output1.rsquare[25:27])/3,
                          output1.rsquare[28])

plot(output1.rquareConcat, main = "Adjusted R^2 for each explanatory variable", xlab = "Explanatory Variables",
                            ylab = "Adj-R^2")

outputAct1 <- apply(output1,c(1,2),sum)

outputAct1Concat <- c(sum(outputAct1[1:3,1:3])/sum(outputAct1[1:3,]), sum(outputAct1[4:6,1:3])/sum(outputAct1[4:6,]),
                      sum(outputAct1[7:9,1:3])/sum(outputAct1[7:9,]), sum(outputAct1[10:12,1:3])/sum(outputAct1[10:12,]),
                      sum(outputAct1[13:15,1:3])/sum(outputAct1[13:15,]), sum(outputAct1[16:18,1:3])/sum(outputAct1[16:18,]),
                      sum(outputAct1[19:21,1:3])/sum(outputAct1[19:21,]), sum(outputAct1[22:24,1:3])/sum(outputAct1[22:24,]),
                      sum(outputAct1[25:27,1:3])/sum(outputAct1[25:27,]), sum(outputAct1[28,1:3])/sum(outputAct1[28,]))

outputAct1Concat2 <- c(sum(outputAct1[1:3,1:3]), sum(outputAct1[4:6,1:3]),
                       sum(outputAct1[7:9,1:3]), sum(outputAct1[10:12,1:3]),
                       sum(outputAct1[13:15,1:3]), sum(outputAct1[16:18,1:3]),
                       sum(outputAct1[19:21,1:3]), sum(outputAct1[22:24,1:3]),
                       sum(outputAct1[25:27,1:3]), sum(outputAct1[28,1:3]))

plot(outputAct1Concat, main = "Proportion of strong predictors included",
                      xlab = "# of explanatory variables", ylab = "proportion of strong predictors")

plot(outputAct1Concat2, main = "Number of Strong Predictors Included", xlab = "# of explanatory variables",
                      ylab = "Number of Strong Predictors")

outputTrueIncluded1 <- (6*sum(outputAct1[16:18,1:6])/(500*18) + 7*sum(outputAct1[19:21,1:6])/(500*18) + 
                      8*sum(outputAct1[22:24,1:6])/(500*18) + 9*sum(outputAct1[25:27,1:6])/(500*18))/4

stronglyRelated1 <- (sum(outputAct1[1:3,1:3])/(500*3*1) + sum(outputAct1[4:6,1:3])/(500*3*2) + 
                       sum(outputAct1[7:9,1:3])/(500*3*3) + sum(outputAct1[10:12,1:3])/(500*3*4) +
                       sum(outputAct1[13:15,1:3])/(500*3*5) + sum(outputAct1[16:18,1:3])/(500*3*6) +
                       sum(outputAct1[19:21,1:3])/(500*3*7) + sum(outputAct1[22:24,1:3])/(500*3*8) +
                       sum(outputAct1[25:27,1:3])/(500*3*9) + sum(outputAct1[28,1:3])/(500*1*10))/10

weeklyRelated1 <- (sum(outputAct1[1:3,4:6])/(500*3*1) + sum(outputAct1[4:6,4:6])/(500*3*2) + 
                     sum(outputAct1[7:9,4:6])/(500*3*3) + sum(outputAct1[10:12,4:6])/(500*3*4) +
                     sum(outputAct1[13:15,4:6])/(500*3*5) + sum(outputAct1[16:18,4:6])/(500*3*6) +
                     sum(outputAct1[19:21,4:6])/(500*3*7) + sum(outputAct1[22:24,4:6])/(500*3*8) +
                     sum(outputAct1[25:27,4:6])/(500*3*9) + sum(outputAct1[28,4:6])/(500*1*10))/10

#Scenario 2 - Normal with mean of 0 and variance of 4 (4 noise)

output2 <- replicate(500, leaps(x.matrix1, 4*x1 + 5*x2 + 5.5*x3 + x4 + 1.5*x5 +.5*x6 + rnorm(150,0,2), 
                                method = "adjr2", nbest = 3)$which)

outputAct2 <- apply(output2,c(1,2),sum)

outputTrueIncluded2 <- (6*sum(outputAct2[16:18,1:6])/(500*18) + 7*sum(outputAct2[19:21,1:6])/(500*18) + 
                          8*sum(outputAct2[22:24,1:6])/(500*18) + 9*sum(outputAct2[25:27,1:6])/(500*18))/4

stronglyRelated2 <- (sum(outputAct2[1:3,1:3])/(500*3*1) + sum(outputAct2[4:6,1:3])/(500*3*2) + 
                       sum(outputAct2[7:9,1:3])/(500*3*3) + sum(outputAct2[10:12,1:3])/(500*3*4) +
                       sum(outputAct2[13:15,1:3])/(500*3*5) + sum(outputAct2[16:18,1:3])/(500*3*6) +
                       sum(outputAct2[19:21,1:3])/(500*3*7) + sum(outputAct2[22:24,1:3])/(500*3*8) +
                       sum(outputAct2[25:27,1:3])/(500*3*9) + sum(outputAct2[28,1:3])/(500*1*10))/10

weeklyRelated2 <- (sum(outputAct2[1:3,4:6])/(500*3*1) + sum(outputAct2[4:6,4:6])/(500*3*2) + 
                     sum(outputAct2[7:9,4:6])/(500*3*3) + sum(outputAct2[10:12,4:6])/(500*3*4) +
                     sum(outputAct2[13:15,4:6])/(500*3*5) + sum(outputAct2[16:18,4:6])/(500*3*6) +
                     sum(outputAct2[19:21,4:6])/(500*3*7) + sum(outputAct2[22:24,4:6])/(500*3*8) +
                     sum(outputAct2[25:27,4:6])/(500*3*9) + sum(outputAct2[28,4:6])/(500*1*10))/10

#Scenario 3 - Normal with mean of 0 and variance of .4 (4 noise)

output3 <- replicate(500, leaps(x.matrix1, 4*x1 + 5*x2 + 5.5*x3 + x4 + 1.5*x5 +.5*x6 + rnorm(150,0,sqrt(.4)), 
                                method = "adjr2", nbest = 3)$which)

outputAct3 <- apply(output3,c(1,2),sum)


outputTrueIncluded3 <- (6*sum(outputAct3[16:18,1:6])/(500*18) + 7*sum(outputAct3[19:21,1:6])/(500*18) + 
                          8*sum(outputAct3[22:24,1:6])/(500*18) + 9*sum(outputAct3[25:27,1:6])/(500*18))/4

stronglyRelated3 <- (sum(outputAct3[1:3,1:3])/(500*3*1) + sum(outputAct3[4:6,1:3])/(500*3*2) + 
                       sum(outputAct3[7:9,1:3])/(500*3*3) + sum(outputAct3[10:12,1:3])/(500*3*4) +
                       sum(outputAct3[13:15,1:3])/(500*3*5) + sum(outputAct3[16:18,1:3])/(500*3*6) +
                       sum(outputAct3[19:21,1:3])/(500*3*7) + sum(outputAct3[22:24,1:3])/(500*3*8) +
                       sum(outputAct3[25:27,1:3])/(500*3*9) + sum(outputAct3[28,1:3])/(500*1*10))/10

weeklyRelated3 <- (sum(outputAct3[1:3,4:6])/(500*3*1) + sum(outputAct3[4:6,4:6])/(500*3*2) + 
                     sum(outputAct3[7:9,4:6])/(500*3*3) + sum(outputAct3[10:12,4:6])/(500*3*4) +
                     sum(outputAct3[13:15,4:6])/(500*3*5) + sum(outputAct3[16:18,4:6])/(500*3*6) +
                     sum(outputAct3[19:21,4:6])/(500*3*7) + sum(outputAct3[22:24,4:6])/(500*3*8) +
                     sum(outputAct3[25:27,4:6])/(500*3*9) + sum(outputAct3[28,4:6])/(500*1*10))/10


#Scenario 1.b - Normal with mean 0 and variance 16 (10 noise)

x.matrix2 <- matrix(nrow = 150, ncol = 16, data = runif(150*16))
x1b = x.matrix2[,1]
x2b = x.matrix2[,2]
x3b = x.matrix2[,3]
x4b = x.matrix2[,4]
x5b = x.matrix2[,5]
x6b = x.matrix2[,6]

output1b <- replicate(500, leaps(x.matrix2, 4*x1b + 5*x2b + 5.5*x3b + x4b + 1.5*x5b +.5*x6b + rnorm(150,0,4), 
                                method = "adjr2", nbest = 3)$which)

outputAct1b <- apply(output1b,c(1,2),sum)

outputTrueIncluded1b <- (6*sum(outputAct1b[16:18,1:6])/(500*18) + 7*sum(outputAct1b[19:21,1:6])/(500*18) + 
                          8*sum(outputAct1b[22:24,1:6])/(500*18) + 9*sum(outputAct1b[25:27,1:6])/(500*18) +
                           10*sum(outputAct1b[28:30,1:6])/(500*18) + 11*sum(outputAct1b[31:33,1:6])/(500*18)+
                           12*sum(outputAct1b[34:36,1:6])/(500*18) + 13*sum(outputAct1b[37:39,1:6])/(500*18)+
                           14*sum(outputAct1b[40:42,1:6])/(500*18) + 15*sum(outputAct1b[43:45,1:6])/(500*18))/10

stronglyRelated1b <- (sum(outputAct1b[1:3,1:3])/(500*3*1) + sum(outputAct1b[4:6,1:3])/(500*3*2) + 
                       sum(outputAct1b[7:9,1:3])/(500*3*3) + sum(outputAct1b[10:12,1:3])/(500*3*4) +
                       sum(outputAct1b[13:15,1:3])/(500*3*5) + sum(outputAct1b[16:18,1:3])/(500*3*6) +
                       sum(outputAct1b[19:21,1:3])/(500*3*7) + sum(outputAct1b[22:24,1:3])/(500*3*8) +
                       sum(outputAct1b[25:27,1:3])/(500*3*9) + sum(outputAct1b[28:30,1:3])/(500*3*10) +
                       sum(outputAct1b[31:33,1:3])/(500*3*11) + sum(outputAct1b[34:36,1:3])/(500*3*12) +
                       sum(outputAct1b[37:39,1:3])/(500*3*13) + sum(outputAct1b[40:42,1:3])/(500*3*14) +
                       sum(outputAct1b[43:45,1:3])/(500*3*15) + sum(outputAct1b[46,1:3])/(500*1*16))/16

weeklyRelated1b <- (sum(outputAct1b[1:3,4:6])/(500*3*1) + sum(outputAct1b[4:6,4:6])/(500*3*2) + 
                      sum(outputAct1b[7:9,4:6])/(500*3*3) + sum(outputAct1b[10:12,4:6])/(500*3*4) +
                      sum(outputAct1b[13:15,4:6])/(500*3*5) + sum(outputAct1b[16:18,4:6])/(500*3*6) +
                      sum(outputAct1b[19:21,4:6])/(500*3*7) + sum(outputAct1b[22:24,4:6])/(500*3*8) +
                      sum(outputAct1b[25:27,4:6])/(500*3*9) + sum(outputAct1b[28:30,4:6])/(500*3*10) +
                      sum(outputAct1b[31:33,4:6])/(500*3*11) + sum(outputAct1b[34:36,4:6])/(500*3*12) +
                      sum(outputAct1b[37:39,4:6])/(500*3*13) + sum(outputAct1b[40:42,4:6])/(500*3*14) +
                      sum(outputAct1b[43:45,4:6])/(500*3*15) + sum(outputAct1b[46,4:6])/(500*1*16))/16


#Scenario 2.b - Normal with mean 0 and variance 4 (4 noise)

output2b <- replicate(500, leaps(x.matrix2, 4*x1b + 5*x2b + 5.5*x3b + x4b + 1.5*x5b +.5*x6b + rnorm(150,0,2), 
                                 method = "adjr2", nbest = 3)$which)

outputAct2b <- apply(output2b,c(1,2),sum)

outputTrueIncluded2b <- (6*sum(outputAct2b[16:18,1:6])/(500*18) + 7*sum(outputAct2b[19:21,1:6])/(500*18) + 
                           8*sum(outputAct2b[22:24,1:6])/(500*18) + 9*sum(outputAct2b[25:27,1:6])/(500*18) +
                           10*sum(outputAct2b[28:30,1:6])/(500*18) + 11*sum(outputAct2b[31:33,1:6])/(500*18)+
                           12*sum(outputAct2b[34:36,1:6])/(500*18) + 13*sum(outputAct2b[37:39,1:6])/(500*18)+
                           14*sum(outputAct2b[40:42,1:6])/(500*18) + 15*sum(outputAct2b[43:45,1:6])/(500*18))/10

stronglyRelated2b <- (sum(outputAct2b[1:3,1:3])/(500*3*1) + sum(outputAct2b[4:6,1:3])/(500*3*2) + 
                        sum(outputAct2b[7:9,1:3])/(500*3*3) + sum(outputAct2b[10:12,1:3])/(500*3*4) +
                        sum(outputAct2b[13:15,1:3])/(500*3*5) + sum(outputAct2b[16:18,1:3])/(500*3*6) +
                        sum(outputAct2b[19:21,1:3])/(500*3*7) + sum(outputAct2b[22:24,1:3])/(500*3*8) +
                        sum(outputAct2b[25:27,1:3])/(500*3*9) + sum(outputAct2b[28:30,1:3])/(500*3*10) +
                        sum(outputAct2b[31:33,1:3])/(500*3*11) + sum(outputAct2b[34:36,1:3])/(500*3*12) +
                        sum(outputAct2b[37:39,1:3])/(500*3*13) + sum(outputAct2b[40:42,1:3])/(500*3*14) +
                        sum(outputAct2b[43:45,1:3])/(500*3*15) + sum(outputAct2b[46,1:3])/(500*1*16))/16

weeklyRelated2b <- (sum(outputAct2b[1:3,4:6])/(500*3*1) + sum(outputAct2b[4:6,4:6])/(500*3*2) + 
                      sum(outputAct2b[7:9,4:6])/(500*3*3) + sum(outputAct2b[10:12,4:6])/(500*3*4) +
                      sum(outputAct2b[13:15,4:6])/(500*3*5) + sum(outputAct2b[16:18,4:6])/(500*3*6) +
                      sum(outputAct2b[19:21,4:6])/(500*3*7) + sum(outputAct2b[22:24,4:6])/(500*3*8) +
                      sum(outputAct2b[25:27,4:6])/(500*3*9) + sum(outputAct2b[28:30,4:6])/(500*3*10) +
                      sum(outputAct2b[31:33,4:6])/(500*3*11) + sum(outputAct2b[34:36,4:6])/(500*3*12) +
                      sum(outputAct2b[37:39,4:6])/(500*3*13) + sum(outputAct2b[40:42,4:6])/(500*3*14) +
                      sum(outputAct2b[43:45,4:6])/(500*3*15) + sum(outputAct2b[46,4:6])/(500*1*16))/16


#Scenario 3.b - Normal with mean 0 and variance .4 (10 noise)

output3b <- replicate(500, leaps(x.matrix2, 4*x1b + 5*x2b + 5.5*x3b + x4b + 1.5*x5b +.5*x6b + rnorm(150,0,sqrt(.4)), 
                                 method = "adjr2", nbest = 3)$which)

outputAct3b <- apply(output3b,c(1,2),sum)

outputTrueIncluded3b <- (6*sum(outputAct3b[16:18,1:6])/(500*18) + 7*sum(outputAct3b[19:21,1:6])/(500*18) + 
                           8*sum(outputAct3b[22:24,1:6])/(500*18) + 9*sum(outputAct3b[25:27,1:6])/(500*18) +
                           10*sum(outputAct3b[28:30,1:6])/(500*18) + 11*sum(outputAct3b[31:33,1:6])/(500*18)+
                           12*sum(outputAct3b[34:36,1:6])/(500*18) + 13*sum(outputAct3b[37:39,1:6])/(500*18)+
                           14*sum(outputAct3b[40:42,1:6])/(500*18) + 15*sum(outputAct3b[43:45,1:6])/(500*18))/10

stronglyRelated3b <- (sum(outputAct3b[1:3,1:3])/(500*3*1) + sum(outputAct3b[4:6,1:3])/(500*3*2) + 
                        sum(outputAct3b[7:9,1:3])/(500*3*3) + sum(outputAct3b[10:12,1:3])/(500*3*4) +
                        sum(outputAct3b[13:15,1:3])/(500*3*5) + sum(outputAct3b[16:18,1:3])/(500*3*6) +
                        sum(outputAct3b[19:21,1:3])/(500*3*7) + sum(outputAct3b[22:24,1:3])/(500*3*8) +
                        sum(outputAct3b[25:27,1:3])/(500*3*9) + sum(outputAct3b[28:30,1:3])/(500*3*10) +
                        sum(outputAct3b[31:33,1:3])/(500*3*11) + sum(outputAct3b[34:36,1:3])/(500*3*12) +
                        sum(outputAct3b[37:39,1:3])/(500*3*13) + sum(outputAct3b[40:42,1:3])/(500*3*14) +
                        sum(outputAct3b[43:45,1:3])/(500*3*15) + sum(outputAct3b[46,1:3])/(500*1*16))/16

weeklyRelated3b <- (sum(outputAct3b[1:3,4:6])/(500*3*1) + sum(outputAct3b[4:6,4:6])/(500*3*2) + 
                      sum(outputAct3b[7:9,4:6])/(500*3*3) + sum(outputAct3b[10:12,4:6])/(500*3*4) +
                      sum(outputAct3b[13:15,4:6])/(500*3*5) + sum(outputAct3b[16:18,4:6])/(500*3*6) +
                      sum(outputAct3b[19:21,4:6])/(500*3*7) + sum(outputAct3b[22:24,4:6])/(500*3*8) +
                      sum(outputAct3b[25:27,4:6])/(500*3*9) + sum(outputAct3b[28:30,4:6])/(500*3*10) +
                      sum(outputAct3b[31:33,4:6])/(500*3*11) + sum(outputAct3b[34:36,4:6])/(500*3*12) +
                      sum(outputAct3b[37:39,4:6])/(500*3*13) + sum(outputAct3b[40:42,4:6])/(500*3*14) +
                      sum(outputAct3b[43:45,4:6])/(500*3*15) + sum(outputAct3b[46,4:6])/(500*1*16))/16


# Analysis

dist <- c("~N(0,16)", "~N(0,4)", ~"N(0,.4)")
avg_exp_var_4noise <- c(outputTrueIncluded1, outputTrueIncluded2, outputTrueIncluded3)
avg_exp_var_10noise  <- c(outputTrueIncluded1b, outputTrueIncluded2b, outputTrueIncluded3b)
tableTrueIncluded <- data.frame(avg_exp_var_4noise , avg_exp_var_10noise, row.names = dist)

prop_strong_4noise <- c(stronglyRelated1, stronglyRelated2, stronglyRelated3)
prop_strong_10noise <- c(stronglyRelated1b, stronglyRelated2b, stronglyRelated3b)
tableStrongRelated <- data.frame(prop_strong_4noise, prop_strong_10noise, row.names = dist)

prop_weakly_4noise <- c(weeklyRelated1, weeklyRelated2, weeklyRelated3)
prop_weakly_10noise <- c(weeklyRelated1b, weeklyRelated2b, weeklyRelated3b)
tableWeakRelated <- data.frame(prop_weakly_4noise, prop_weakly_10noise, row.names = dist)

dfWeak <- df(1:3, prop_weakly_10noise, prop_weakly_4noise)
  