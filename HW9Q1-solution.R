###Homework 9 Question 1

d2i = qnorm(0.01)
corr = matrix(0.3,50,50)
diag(corr) = 1
library(MASS)
?mvrnorm
def = 0
loss = 0
for(i in 1:10000){
zi = mvrnorm(1,mu = rep(0,50),corr)
reco = matrix(0,50,1)
reco[which(zi<d2i)] = 10000000*rbeta(1,2,2)
loss[i] = sum(reco)
def[i] = sum(zi<d2i)
}
hist(loss,breaks = seq(0,200000000,10000000),
     main = "histogram of credit loss, rho = 0.3, random lgd")

cor1 = matrix(0.4,50,50)
diag(cor1) = 1
def1 = 0
loss1 = 0
for(i in 1:10000){
  zi = mvrnorm(1,mu = rep(0,50),cor1)
  reco = matrix(0,50,1)
  reco[which(zi<d2i)] = 10000000*rbeta(1,2,2)
  loss1[i] = sum(reco)
  def1[i] = sum(zi<d2i)
}
hist(loss1,breaks = seq(0,200000000,10000000),
     main = "histogram of credit loss, rho = 0.4, random lgd")
