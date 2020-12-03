#Mini-project 2
#Taylor Last

###################################        2       ######################################
#First Scenario (n = 25, p = 5)
Sim.cor.1.x <- replicate(500, {
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  cor(my.matrix)[upper.tri(cor(my.matrix))]
})

#Figure 1A
hist(Sim.cor.1.x, main = "Distribution of Pairwise Correlations (n=25,p=5)",xlab = "Correlation")

#Greater than .35 for 1A
absValue.GreaterThan.35 <- sum(replicate(500, {
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  sum(cor(my.matrix)[upper.tri(cor(my.matrix))]>.35)
}))
absValue.GreaterThan.35/(500*10)




#Second Scenario (n = 25, p = 20)
Sim.cor.2.x <- replicate(500, {
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  cor(my.matrix)[upper.tri(cor(my.matrix))]
})

#Figure 1B
hist(Sim.cor.2.x, main = "Distribution of Pairwise Correlations (n=25,p=20)",xlab = "Correlation")

#Greater than .35 for 1B
absValue.GreaterThan.35 <- sum(replicate(500, {
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  sum(cor(my.matrix)[upper.tri(cor(my.matrix))]>.35)
}))
absValue.GreaterThan.35/(500*190)





#Third Scenario (n = 100, p = 15)
Sim.cor.3.x <- replicate(500, {
  my.matrix <- matrix(nrow = 100, ncol = 15, data = runif(100*15))
  cor(my.matrix)[upper.tri(cor(my.matrix))]
})

#Figure 1C
hist(Sim.cor.3.x, main = "Distribution of Pairwise Correlations (n=100,p=15)",xlab = "Correlation")

#Greater than .35 for 1C
absValue.GreaterThan.35 <- sum(replicate(500, {
  my.matrix <- matrix(nrow = 100, ncol = 15, data = runif(100*15))
  sum(cor(my.matrix)[upper.tri(cor(my.matrix))]>.35)
}))
absValue.GreaterThan.35/(500*105)



#Fourth Scenario (n = 100, p = 85)
Sim.cor.4.x <- replicate(5, {
  my.matrix <- matrix(nrow = 100, ncol = 85, data = runif(100*85))
  cor(my.matrix)[upper.tri(cor(my.matrix))]
})
#Figure 1D
hist(Sim.cor.4.x, main = "Distribution of Pairwise Correlations (n=100,p=85)",xlab = "Correlation")

#Greater than .35 for 1D
absValue.GreaterThan.35 <- sum(replicate(5, {
  my.matrix <- matrix(nrow = 100, ncol = 85, data = runif(100*85))
  sum(cor(my.matrix)[upper.tri(cor(my.matrix))]>.35)
}))
absValue.GreaterThan.35/(500*105)



#Fifth Scenario (n = 200, p = 15)
Sim.cor.5.x <- replicate(500, {
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  cor(my.matrix)[upper.tri(cor(my.matrix))]
})
#Figure 1E
hist(Sim.cor.5.x, main = "Distribution of Pairwise Correlations (n=200,p=15)",xlab = "Correlation")

#Greater than .35 for 1E
absValue.GreaterThan.35 <- sum(replicate(500, {
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(100*15))
  sum(cor(my.matrix)[upper.tri(cor(my.matrix))]>.35)
}))
absValue.GreaterThan.35/(500*105)




#Sixth Scenario (n = 200, p = 150)
Sim.cor.5.x <- replicate(5, {
  my.matrix <- matrix(nrow = 200, ncol = 150, data = runif(200*150))
  cor(my.matrix)[upper.tri(cor(my.matrix))]
})
#Figure 1D
hist(Sim.cor.5.x, main = "Distribution of Pairwise Correlations (n=200,p=150)",xlab = "Correlation")

#Greater than .35 for 1D
absValue.GreaterThan.35 <- sum(replicate(5, {
  my.matrix <- matrix(nrow = 200, ncol = 150, data = runif(200*150))
  sum(cor(my.matrix)[upper.tri(cor(my.matrix))]>.35)
}))
absValue.GreaterThan.35/(500*105)




#GENERATE Y values to plot the matrix against (ex. y1.1 First sample size, first mean/var scenario)
y1.1 = rnorm(25,0,sqrt(.5))
y1.2 = rnorm(25,0,sqrt(4))
y1.3 = rt(25,3)
y2.1 = rnorm(100,0,sqrt(.5))
y2.2 = rnorm(100,0,sqrt(4))
y2.3 = rt(100,3)
y3.1 = rnorm(200,0,sqrt(.5))
y3.2 = rnorm(200,0,sqrt(4))
y3.3 = rt(200,3)


##################################          3       ######################################
#First Scenario A (n = 25, p = 5),Normal with mean of 0 and variance of .5
a1 <- sum(replicate(500,sum(replicate(5,cor.test(runif(25,0,1),y1.1)$p.value)<.05)))

#First Scenario B (n = 25, p = 5),Normal with mean of 0 and variance of 4
a2 <- sum(replicate(500,sum(replicate(5,cor.test(runif(25,0,1),y1.2)$p.value)<.05)))

#First Scenario C (n = 25, p = 5),t with 3 degrees of freedom
a3 <- sum(replicate(500,sum(replicate(5,cor.test(runif(25,0,1),y1.3)$p.value)<.05)))

a <-replicate(500,sum(replicate(5,cor.test(runif(25,0,1),y1.1)$p.value)<.05))
hist(a,main = "Histogram of (n = 25, p = 5),~N(0,.5)", xlab = "Num of significant values")


#Second Scenario A (n = 25, p = 20),Normal with mean of 0 and variance of .5
b1 <- sum(replicate(500,sum(replicate(20,cor.test(runif(25,0,1),y1.1)$p.value)<.05)))

#Second Scenario B (n = 25, p = 20),Normal with mean of 0 and variance of 4
b2 <- sum(replicate(500,sum(replicate(20,cor.test(runif(25,0,1),y1.2)$p.value)<.05)))

#Second Scenario C (n = 25, p = 20),t with 3 degrees of freedom
b3 <- sum(replicate(500,sum(replicate(20,cor.test(runif(25,0,1),y1.3)$p.value)<.05)))



#Third Scenario A (n = 100, p = 15),Normal with mean of 0 and variance of .5
c1 <- sum(replicate(500,sum(replicate(15,cor.test(runif(100,0,1),y2.1)$p.value)<.05)))

#Third Scenario B (n = 100, p = 15),Normal with mean of 0 and variance of 4
c2 <- sum(replicate(500,sum(replicate(15,cor.test(runif(100,0,1),y2.2)$p.value)<.05)))

#Third Scenario C (n = 100, p = 15),t with 3 degrees of freedom
c3 <- sum(replicate(500,sum(replicate(15,cor.test(runif(100,0,1),y2.3)$p.value)<.05)))

c <-replicate(500,sum(replicate(15,cor.test(runif(100,0,1),y2.1)$p.value)<.05))
hist(c,main = "Histogram of (n = 100, p = 15),~N(0,.5)", xlab = "Num of significant values")



#Fourth Scenario A (n = 100, p = 85),Normal with mean of 0 and variance of .5
d1 <- sum(replicate(500,sum(replicate(85,cor.test(runif(100,0,1),y2.1)$p.value)<.05)))

#Fourth Scenario B (n = 100, p = 85),Normal with mean of 0 and variance of 4
d2 <- sum(replicate(500,sum(replicate(85,cor.test(runif(100,0,1),y2.2)$p.value)<.05)))

#Fourth Scenario C (n = 100, p = 85),t with 3 degrees of freedom
d3 <- sum(replicate(500,sum(replicate(85,cor.test(runif(100,0,1),y2.3)$p.value)<.05)))



#Fifth Scenario A (n = 200, p = 15),Normal with mean of 0 and variance of .5
e1 <- sum(replicate(500,sum(replicate(15,cor.test(runif(200,0,1),y3.1)$p.value)<.05)))

#Fifth Scenario B (n = 200, p = 15),Normal with mean of 0 and variance of 4
e2 <- sum(replicate(500,sum(replicate(15,cor.test(runif(200,0,1),y3.2)$p.value)<.05)))

#Fifth Scenario C (n = 200, p = 15),t with 3 degrees of freedom
e3 <- sum(replicate(500,sum(replicate(15,cor.test(runif(200,0,1),y3.3)$p.value)<.05)))



#Sixth Scenario A (n = 200, p = 150),Normal with mean of 0 and variance of .5
f1 <- sum(replicate(500,sum(replicate(150,cor.test(runif(200,0,1),y3.1)$p.value)<.05)))

#Sixth Scenario B (n = 200, p = 150),Normal with mean of 0 and variance of 4
f2 <- sum(replicate(500,sum(replicate(150,cor.test(runif(200,0,1),y3.2)$p.value)<.05)))

#Sixth Scenario C (n = 200, p = 150),t with 3 degrees of freedom
f3 <- sum(replicate(500,sum(replicate(150,cor.test(runif(200,0,1),y3.3)$p.value)<.05)))

f <- replicate(500,sum(replicate(150,cor.test(runif(200,0,1),y3.1)$p.value)<.05))
hist(f,main = "Histogram of (n = 200, p = 150),~N(0,.5)", xlab = "Num of significant values")


# How many significant values are in 
significant.matrix <- cbind(c(a1,b1,c1,d1,e1,f1), c(a2,b2,c2,d2,e2,f2), c(a3,b3,c3,d3,e3,f3))

significant.prop.matrix <- cbind(c(a1/(500*5),b1/(500*20),c1/(500*15),d1/(500*85),e1/(500*15),f1/(500*150)),
                                 c(a2/(500*5),b2/(500*20),c2/(500*15),d2/(500*85),e2/(500*15),f2/(500*150)),
                                 c(a3/(500*5),b3/(500*20),c3/(500*15),d3/(500*85),e3/(500*15),f3/(500*150)))

#####################################      4        #######################################
# (n = 25, p = 5),Normal with mean of 0 and variance of .5
Sim.cor.1.xy <- replicate(n = 5, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 25,
                         ncol= 1,
                         data = runif(25, 0, 1))
    p.value <- cor.test(cor.matrix,y1.1)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.1.xy)


#(n = 25, p = 5),Normal with mean of 0 and variance of 4
Sim.cor.2.xy <- replicate(n = 5, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 25,
                         ncol= 1,
                         data = runif(25, 0, 1))
    p.value <- cor.test(cor.matrix,y1.2)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.2.xy)


#(n = 25, p = 5),t with 3 degrees of freedom
Sim.cor.3.xy <- replicate(n = 5, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 25,
                         ncol= 1,
                         data = runif(25, 0, 1))
    p.value <- cor.test(cor.matrix,y1.3)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.3.xy)





# (n = 25, p = 20),Normal with mean of 0 and variance of .5
Sim.cor.4.xy <- replicate(n = 20, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 25,
                         ncol= 1,
                         data = runif(25, 0, 1))
    p.value <- cor.test(cor.matrix,y1.1)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.4.xy)

#(n = 25, p = 20),Normal with mean of 0 and variance of 4
Sim.cor.5.xy <- replicate(n = 20, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 25,
                         ncol= 1,
                         data = runif(25, 0, 1))
    p.value <- cor.test(cor.matrix,y1.2)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.5.xy)

#(n = 25, p = 20),t with 3 degrees of freedom
Sim.cor.6.xy <- replicate(n = 20, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 25,
                         ncol= 1,
                         data = runif(25, 0, 1))
    p.value <- cor.test(cor.matrix,y1.3)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.6.xy)



# (n = 100, p = 15),Normal with mean of 0 and variance of .5
Sim.cor.7.xy <- replicate(n = 15, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 100,
                         ncol= 1,
                         data = runif(100, 0, 1))
    p.value <- cor.test(cor.matrix,y2.1)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.7.xy)


#(n = 100, p = 15),Normal with mean of 0 and variance of 4
Sim.cor.8.xy <- replicate(n = 15, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 100,
                         ncol= 1,
                         data = runif(100, 0, 1))
    p.value <- cor.test(cor.matrix,y2.2)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.8.xy, main = "Histogram (n = 100, p = 15), ~N(0,4)", xlab = "Significant values per x value")


#(n = 100, p = 15),t with 3 degrees of freedom
Sim.cor.9.xy <- replicate(n = 15, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 100,
                         ncol= 1,
                         data = runif(100, 0, 1))
    p.value <- cor.test(cor.matrix,y2.3)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.9.xy, main = "Histogram (n = 100, p = 15), ~t(d.f = 3)", xlab = "Significant values per x value")



# (n = 100, p = 85),Normal with mean of 0 and variance of .5
Sim.cor.10.xy <- replicate(n = 85, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 100,
                         ncol= 1,
                         data = runif(100, 0, 1))
    p.value <- cor.test(cor.matrix,y2.1)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.10.xy)


#(n = 100, p = 85),Normal with mean of 0 and variance of 4
Sim.cor.11.xy <- replicate(n = 85, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 100,
                         ncol= 1,
                         data = runif(100, 0, 1))
    p.value <- cor.test(cor.matrix,y2.2)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.11.xy, main = "Histogram (n = 100, p = 85), ~N(0,4)", xlab = "Significant values per x value")


#(n = 100, p = 85),t with 3 degrees of freedom
Sim.cor.12.xy <- replicate(n = 85, {
  sum(replicate(500, {
    cor.matrix <- matrix(nrow = 100,
                         ncol= 1,
                         data = runif(100, 0, 1))
    p.value <- cor.test(cor.matrix,y2.3)$p.value
    sum(p.value<.05)
  }))
})

hist(Sim.cor.12.xy)




################################            5            #####################################
#(n = 25, p = 5),Normal with mean of 0 and variance of .5

Sim.rsquare.1 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  r.squared <- summary(lm(y1.1~my.matrix))$r.squared
})
hist(Sim.rsquare.1, main = "Histogram (n = 25, p = 5), ~N(0,.5) R^2 values", xlab = "R-squared")

Sim.rsquareAdj.1 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  r.squared <- summary(lm(y1.1~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.1)



#(n = 25, p = 5),Normal with mean of 0 and variance of 4
Sim.rsquare.2 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  r.squared <- summary(lm(y1.2~my.matrix))$r.squared
})
hist(Sim.rsquare.2)

Sim.rsquareAdj.2 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  r.squared <- summary(lm(y1.2~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.2)


##(n = 25, p = 5),t with 3 degrees of freedom
Sim.rsquare.3 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  r.squared <- summary(lm(y1.3~my.matrix))$r.squared
})
hist(Sim.rsquare.3)

Sim.rsquareAdj.3 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
  r.squared <- summary(lm(y1.3~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.3)



#(n = 25, p = 20),Normal with mean of 0 and variance of .5

Sim.rsquare.4 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  r.squared <- summary(lm(y1.1~my.matrix))$r.squared
})
hist(Sim.rsquare.4, main = "Histogram (n = 25, p = 20), ~N(0,.5) R^2 values", xlab = "R-squared")

Sim.rsquareAdj.4 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  r.squared <- summary(lm(y1.1~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.4)


#(n = 25, p = 20),Normal with mean of 0 and variance of 4
Sim.rsquare.5 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  r.squared <- summary(lm(y1.2~my.matrix))$r.squared
})
hist(Sim.rsquare.5)

Sim.rsquareAdj.5 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  r.squared <- summary(lm(y1.2~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.5)



##(n = 25, p = 20),t with 3 degrees of freedom
Sim.rsquare.6 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  r.squared <- summary(lm(y1.3~my.matrix))$r.squared
})
hist(Sim.rsquare.6)

Sim.rsquareAdj.6 <- replicate(500,{
  my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
  r.squared <- summary(lm(y1.3~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.6)



#(n = 200, p = 15),Normal with mean of 0 and variance of .5

Sim.rsquare.7 <- replicate(500,{
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  r.squared <- summary(lm(y3.1~my.matrix))$r.squared
})
hist(Sim.rsquare.7, main = "Histogram (n = 200, p = 15), ~N(0,.5) R^2 values", xlab = "R-squared")

Sim.rsquareAdj.7 <- replicate(500,{
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  r.squared <- summary(lm(y3.1~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.7)


#(n = 200, p = 15),Normal with mean of 0 and variance of 4

Sim.rsquare.8 <- replicate(500,{
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  r.squared <- summary(lm(y3.2~my.matrix))$r.squared
})
hist(Sim.rsquare.8)

Sim.rsquareAdj.8 <- replicate(500,{
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  r.squared <- summary(lm(y3.2~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.8)



#(n = 200, p = 15),t with 3 degrees of freedom

Sim.rsquare.9 <- replicate(500,{
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  r.squared <- summary(lm(y3.3~my.matrix))$r.squared
})
hist(Sim.rsquare.9)

Sim.rsquareAdj.9 <- replicate(500,{
  my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
  r.squared <- summary(lm(y3.3~my.matrix))$adj.r.squared
})
hist(Sim.rsquareAdj.9)



################################            6            #####################################

#(n = 25, p = 5),Normal with mean of 0 and variance of .5
Sim.cor1.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
    (coef((summary(lm(y1.1~my.matrix))))[,4])<.05}))
  })
hist(Sim.cor1.xy.fitted, main = "Histogram (n = 25, p = 5), ~N(0,.5) fitted model", xlab = "estimated significant coefficients at .05")

Sim.cor1a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
    (coef((summary(lm(y1.1~my.matrix))))[,4])<.2}))
})
hist(Sim.cor1a.xy.fitted)



#(n = 25, p = 5),Normal with mean of 0 and variance of 4
Sim.cor2.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
    (coef((summary(lm(y1.2~my.matrix))))[,4])<.05}))
})
hist(Sim.cor2.xy.fitted)

Sim.cor2a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
    (coef((summary(lm(y1.2~my.matrix))))[,4])<.2}))
})
hist(Sim.cor2a.xy.fitted)

#(n = 25, p = 5),t with 3 degrees of freedom
Sim.cor3.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
    (coef((summary(lm(y1.3~my.matrix))))[,4])<.05}))
})
hist(Sim.cor3.xy.fitted)


Sim.cor3a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 5, data = runif(25*5))
    (coef((summary(lm(y1.3~my.matrix))))[,4])<.2}))
})
hist(Sim.cor3a.xy.fitted)



#(n = 25, p = 20),Normal with mean of 0 and variance of .5
Sim.cor4.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
    (coef((summary(lm(y1.1~my.matrix))))[,4])<.05}))
})
hist(Sim.cor4.xy.fitted) 


Sim.cor4a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
    (coef((summary(lm(y1.1~my.matrix))))[,4])<.2}))
})
hist(Sim.cor4a.xy.fitted) 


#(n = 25, p = 20),Normal with mean of 0 and variance of 4
Sim.cor5.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
    (coef((summary(lm(y1.2~my.matrix))))[,4])<.05}))
})
hist(Sim.cor5.xy.fitted) 


Sim.cor5a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
    (coef((summary(lm(y1.2~my.matrix))))[,4])<.2}))
})
hist(Sim.cor5a.xy.fitted)



#(n = 25, p = 20),t with 3 degrees of freedom
Sim.cor6.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
    (coef((summary(lm(y1.3~my.matrix))))[,4])<.05}))
})
hist(Sim.cor6.xy.fitted) 


Sim.cor6a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 25, ncol = 20, data = runif(25*20))
    (coef((summary(lm(y1.3~my.matrix))))[,4])<.2}))
})
hist(Sim.cor6a.xy.fitted)



#(n = 200, p = 15),Normal with mean of 0 and variance of .5
Sim.cor7.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
    (coef((summary(lm(y3.1~my.matrix))))[,4])<.05}))
})
hist(Sim.cor7.xy.fitted, main = "Histogram (n = 200, p = 15), ~N(0,.5) fitted model", xlab = "estimated significant coefficients at .05")

Sim.cor7a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
    (coef((summary(lm(y3.1~my.matrix))))[,4])<.2}))
})
hist(Sim.cor7a.xy.fitted, main = "Histogram (n = 200, p = 15), ~N(0,.5) fitted model", xlab = "estimated significant coefficients at .2")



#(n = 200, p = 15),Normal with mean of 0 and variance of 4
Sim.cor8.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
    (coef((summary(lm(y3.2~my.matrix))))[,4])<.05}))
})
hist(Sim.cor8.xy.fitted)

Sim.cor8a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
    (coef((summary(lm(y3.2~my.matrix))))[,4])<.2}))
})
hist(Sim.cor8a.xy.fitted)



#(n = 200, p = 15),t with 3 degrees of freedom
Sim.cor9.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
    (coef((summary(lm(y3.3~my.matrix))))[,4])<.05}))
})
hist(Sim.cor9.xy.fitted)

Sim.cor9a.xy.fitted <- replicate(n = 500, {
  sum(replicate(5, {
    my.matrix <- matrix(nrow = 200, ncol = 15, data = runif(200*15))
    (coef((summary(lm(y3.3~my.matrix))))[,4])<.2}))
})
hist(Sim.cor9a.xy.fitted)


    