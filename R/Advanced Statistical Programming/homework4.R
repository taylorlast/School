##################
# Taylor Last
# Homework 4 4365

# Using vectorized calculations
##################

# Set the variables for the simulation
r = 100000
n = 10
p = .5

#Question 1
# 1i
sim_coin = matrix(runif(n*r),nrow=n)
sim_coin_bool = sim_coin<p

#1ii
sim_coin_means = apply(sim_coin_bool,2,sum)
sim_coin_means

#1iii
num_of_successes = table(sim_coin_means)
num_of_successes

#1iv
real_binom = dbinom(0:10,10,.5) * r
real_binom
# Only will work if there is 0 and 10 sucesses in sim_coin
binom_comp = cbind(num_of_successes,real_binom)
binom_comp

#Question 2
#2i

#Create the matrix
r = 20
n = 10
meanseq = seq(1,10,by = 1)-1
sdseq = seq(1,10)*.5
normal_col_mat = matrix(rnorm(n*r,meanseq,sd=sdseq),nrow = r,byrow = TRUE)
normal_col_mat

#2a
normal_col_mat_means = apply(normal_col_mat,2,mean)
normal_col_mat_means 
normal_col_mat_sd = apply(normal_col_mat,2,sd)
normal_col_mat_sd


#2b
contained = sum((meanseq*.8 < normal_col_mat_means) & (normal_col_mat_means < meanseq*1.2)
                     & sdseq*.8 < normal_col_mat_sd & normal_col_mat_sd < sdseq*1.2)
contained

#2c

col_contained = matrix((meanseq*.8 < normal_col_mat_means) & (normal_col_mat_means < meanseq*1.2)& sdseq*.8 < normal_col_mat_sd & normal_col_mat_sd < sdseq*1.2)

new_normal_col_mat = normal_col_mat[,col_contained]
new_normal_col_mat

#2d

adj_normal_mat = (new_normal_col_mat - apply(new_normal_col_mat,2,mean))/apply(new_normal_col_mat,2,sd)
adj_normal_mat





