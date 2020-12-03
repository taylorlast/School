#####################
# Taylor Last
# HW 4 STAT 5010
#####################


# Question 1

train <- read.csv("/Users/taylorlast/Documents/GitHub/School/R/Statistics Capstone/train.txt", sep="")
train

x_train = data.frame(cbind(train[,1:8]))
y_train = train$y

library(DiceKriging)

model=km(formula = ~1, design = x_train,response = y_train,
         covtype = "matern5_2")
model

test <- read.csv("/Users/taylorlast/Documents/GitHub/School/R/Statistics Capstone/test.txt", sep="")

x_test = data.frame(cbind(test[,1:8]))
y_test = test$y

p = predict(model,newdata=data.frame(x_test),type="UK")$mean
p

summary(y_test)
#Calculate RMSE
gaus_RMSE = sqrt(mean((as.vector(p)-as.vector(y_test))^2))

#Transform the response for assumptions
y_train.trans = sqrt(y_train)
y_test.trans = sqrt(y_test)

MVLM = lm(y_train.trans~x_train$x1*(x_train$x4 + x_train$x6 + x_train$x7 + x_train$x8))

#Check Assumptions
summary(MVLM)
plot(MVLM)


p_MVLM = predict(MVLM,data.frame(x_test))
linear_RMSE = sqrt(mean((as.vector(p_MVLM)-as.vector(y_test.trans))^2))

c(gaus_RMSE,linear_RMSE)


# Question 2

borehole <- function(xx)
{
  #https://www.sfu.ca/~ssurjano/borehole.html#:~:text=The%20Borehole%20function%20models%20water,%2C%20in%20m3%2Fyr.
  # OUTPUT AND INPUT:
  # y  = water flow rate
  # xx = c(rw, r, Tu, Hu, Tl, Hl, L, Kw)
  # xx is 0-1 design
  ##########################################################################
  rw <- xx[1]*(0.15-0.05) + 0.05
  r  <- xx[2]*(50000-100) + 100
  Tu <- xx[3]*(115600-63070) + 63070
  Hu <- xx[4]*(1110-990) + 990
  Tl <- xx[5]*(116-63.1) + 63.1
  Hl <- xx[6]*(820-700) + 700
  L  <- xx[7]*(1680-1120) + 1120
  Kw <- xx[8]*(12045-9855) + 9855
  
  frac1 <- 2 * pi * Tu * (Hu-Hl)
  
  frac2a <- 2*L*Tu / (log(r/rw)*rw^2*Kw)
  frac2b <- Tu / Tl
  frac2 <- log(r/rw) * (1+frac2a+frac2b)
  
  y <- frac1 / frac2
  return(y)
}

model.mm <- km(design = x_train, response = y_train, 
                  control = list(pop.size = 50, max.generations = 20, wait.generations = 5, BFGSburnin = 5), optim.method = "gen")

#active learning
nsteps <- 50
res.nsteps <- EGO.nsteps(model = model.mm, fun = borehole, nsteps = nsteps, lower = rep(0, 8), upper = rep(1, 8), parinit = rep(0.5, 8), 
                         control = list(pop.size = 50, max.generations = 20, wait.generations = 5, BFGSburnin = 5), kmcontrol = NULL)
print(res.nsteps$par)
print(res.nsteps$value)
min(res.nsteps$value)
res.nsteps$par[which(res.nsteps$value == min(res.nsteps$value)),]

plot(1:length(res.nsteps$value), res.nsteps$value, type = "both")

