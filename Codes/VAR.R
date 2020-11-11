pi1 = matrix(c(0.7,0.2,0.2,0.7),2,2)

mu.vec = c(1, 5)

c.vec = as.vector(diag((2)-pi1)%*%mu.vec)

cov.mat = matrix(c(1,0.5,0.5,1),2,2)

var1.mod = list(const=c.vec,ar=pi1,Sigma=cov.mat)

#set.seed(301)
#library(mvtnorm)
#library(sandwich)
#library(dse)
library(mlVAR)
y.var = mlVAR(var1.mod,n=250, y0=t(as.matrix(mu.vec)))

set.seed(123) # Reset random number generator for reasons of reproducability

# Generate sample
t <- 200 # Number of time series observations
k <- 2 # Number of endogenous variables
p <- 2 # Number of lags

# Generate coefficient matrices
A.1 <- matrix(c(-.3, .6, -.4, .5), k) # Coefficient matrix of lag 1
A.2 <- matrix(c(-.1, -.2, .1, .05), k) # Coefficient matrix of lag 2
A <- cbind(A.1, A.2) # Companion form of the coefficient matrices

# Generate series
series <- matrix(0, k, t + 2*p) # Raw series with zeros
for (i in (p + 1):(t + 2*p)){ # Generate series with e ~ N(0,0.5)
  series[, i] <- A.1%*%series[, i-1] + A.2%*%series[, i-2] + rnorm(k, 0, .5)
}

series <- ts(t(series[, -(1:p)])) # Convert to time series format
names <- c("V1", "V2") # Rename variables

plot.ts(series) # Plot the series