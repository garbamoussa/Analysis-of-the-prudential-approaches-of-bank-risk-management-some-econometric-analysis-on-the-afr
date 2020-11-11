# DMA CODE, UNIVARIATE CASE WITH FIXED FORGETTING FACTOR LAMBDA
# (c) 2012
# Update: February, 2017 - I went through the code and did some redesign and cleaning. Explanatory comments were added.
# New code was not extensively tested on data,so I would be grateful for reporting the bugs.
# I take no resposability for the use of the code. The code comes with no warranty.


# The code considers a set of models of the following form:
# y = X*Beta_t + e_t, Var(e_t) = H_t     EWMA estimate is used for the variance H_t, i.e. H_t = kappa*H_t-1 + (1-kappa)*(y- beta_t/t-1)^2
# Beta_t = Beta_t-1 + q_t,  Var(q_t) = S_t Estimation of S_t relies on using a forgeting factor lambda, i.e. S_t = (1-lambda/lambda)*P_t-1

# Model "switching" is controlled by using another forgetting factor alpha (see the DMA methodology)




# -----------------------------------------------------------------------------------------------
#                  AREA WHERE USERS' INPUT IS REQUIRED
#       Variables, the universe of models and the choice of parameter values  -------------------
#------------------------------------------------------------------------------------------------

y <- # some data (vector) for dependent variable
X <- # some data (matrix) for potential regressors (intercept is NOT added automatically)
M <- # matrix of zeroes and ones, each row defines variables included in one potential model - ones in a given row imply that the variable should included
# if you want to consider all possible combinations of variables, you can construct M in the following way
# M <- expand.grid(c(0,1), c(0,1),....,c(0,1)))[-1,]
nMod <- nrow(M)      # number of models to be evaluated
nVar <- ncol(X)      # number of regressors in the unrestricted model
nObs <- nrow(X)      # number of observations - length of the time series

lambda <- 0.95       # forgeting factor regulating the degree of time-varyingness of regression coefficients (Betas)
kappa <- 0.96        # decay parameter for EWMA (time-varying variance of the error term in observation equation)
alpha <- 0.95        # forgeting factor regulating the speed of "model-switching"
B00 <- 0             # initial value for all states (Beta paramaters) in all models, you may also set this manually below in the code
P00 <- 100            # intial variance for all states in all models, you may also set this manually below in the code
# ------------------ END OF USER-DEFINED OPTIONS --------------------------------------------------
   


# --------------------------------------------------------------------------------------------
# Enumerate the universe of all possible models (stored in the list: M.X)
# --------------------------------------------------------------------------------------------

M.X <- list()  # list storing a set of explanatory variables included in each model
for (k in 1:nMod)
  {
     M.X[[k]] <- matrix(X[,which(M[k,]==1)], nrow = nObs)
  }

#-----------------------------------------------------------------------------------------------------------------------------
#        INITIALIZING MATRICES, SETTING INITIAL CONDITIONS FOR STATES, THEIR VARIANCES AND MODEL PROBABILITIES
#-----------------------------------------------------------------------------------------------------------------------------
B10 <- list()             # Beta_t/t-1 (Betas for each model are stored separately in the list)
B11 <- list()             # Beta_t/t (Betas for each model are stored separately in the list)
Btt <- list()             # list for storing the whole time series of Beta_t/t (Betas for each model are stored separately in the list)
    
P10 <- list()             # P_t/t-1 (Variance of the state - stored separately for each model)
P11 <- list()             # P_t/t (Variance of the state - stored separately for each model)
Ptt <- list()             # list for storing the whole sequence of P_t/t for t= 1...nObs  (stored separately for each model)
    
ferr <- list()            # prediction error: y - X*Beta_t/t-1 (stored separately for each model)
feta <- list()            # prediction error variance (stored separately for each model)

H <- list()                                    # variance of an error term in the Observation Eq. ("observational variance",stored separately for each model)
Htt <- matrix(NA, ncol = k, nrow = nObs)       # sequence of error terms in the Observation Eq. for t = 1...nObs (one column per model)
KG <- list()                                   # Kalman Gain (auxiliary variable)
Prob10 <- numeric()                            # vector of model probabilities (prediction) - one vector element for each model
Prob11 <- numeric()                            # vector of model probabilities (update) - one vector element for each model
Probtt <- matrix(NA, nrow = nObs, ncol = nMod) # Posterior model probabilities for t = 1...nObs, (one column per model)
y.B10 <- matrix(NA, nrow = nObs, ncol = nMod)  # predictions for dependent variable (y_hat = Beta_t/t-1*X)
y.B11 <- matrix(NA, nrow = nObs, ncol = nMod)  # fitted values of dependent variable (y_hat = Beta_t/t*X)

for(k in 1:nMod)
  {
    B11[[k]] <- c(rep(B00,ncol(M.X[[k]])))  #-------->  Prior mean  of the states (Beta_0/0) is set to zero in all models. You may want to change it.
    P11[[k]] <- diag(rep(P00,ncol(M.X[[k]])), nrow = ncol(M.X[[k]]))     #---------> Prior variance of the states (P_0/0) set to 10 in all models.
    Prob11[k] <- 1/nMod      #-----------> Prior probability of each model being a "true" model is set to the same value

    Btt[[k]] <- matrix(NA, nrow = nObs, ncol = ncol(M.X[[k]]))
    Ptt[[k]] <- array(NA, dim = c(ncol(M.X[[k]]),ncol(M.X[[k]]),nObs))
    ferr[[k]] <- numeric()
    H[[k]] <- var(y)/10
   
  }
    
PredDensity <- numeric()   # vector of predictive densities (changed in each loop)
numerator <- numeric()     # vector containing values for product of Predictive Density (PredDensity) and model probabilities (Prob10)
#xxxxxxxxxxxxxxxxxxxxxxxxx end of: INITIAL CONDITIONS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



#=====================STARTING KALMAN LOOP ==========================================================================================
for (i in 1:nObs)
    {
    #---------model probabilities predictions------------------------------------------------------
        
    Prob10 <- ((Prob11^alpha) + (0.00001/nMod))/(sum(Prob11^alpha) + (0.00001/nMod))   # small value of 0.00001/nMod is added to avoid degeneracies
        
    #----------------------------------------------------------------------------------------------

        # START LOOP TO GET PREDICTIONS AND UPDATES FOR EACH MODEL------------------------------------------------------------------------
        for (k in 1:nMod)
        {
          
        #--------PREDICTION EQUATIONS FOR STATES AND THEIR COVARIANCES (DISPERSIONS)-----------------
          
        B10[[k]] <- B11[[k]]
        P10[[k]] <- (1/lambda)*P11[[k]]
        y.B10[i,k] <- M.X[[k]][i,] %*% B10[[k]]
              
        #------ PREDICTION ERROR ------------------------------------------------------------
           
        ferr[[k]] <- y[i] - M.X[[k]][i,] %*% B10[[k]]

        #----- EWMA ESTIMATE FOR Ht (variance of a disturbance term in the measurement eq.)----------
            
        H[[k]] <- kappa*H[[k]] + ((1-kappa)*(ferr[[k]]^2))
        Htt[i,k] <- H[[k]]
           
        #----- PREDICTION ERROR VARIANCE  ------------------------------------------------------------

        feta[[k]] <- H[[k]] + M.X[[k]][i,,drop=FALSE] %*% P10[[k]] %*% t(M.X[[k]][i,,drop=FALSE])

        #----- KALMAN GAIN -----------------------------------------------------------------------
        
        KG[[k]] <- P10[[k]] %*% t(M.X[[k]][i,,drop=FALSE]) * c(1/feta[[k]])
            
        #----- UPDATE STATES AND THEIR COVARIANCES (DISPERSIONS)------------------------------------
        B11[[k]] <- B10[[k]] + KG[[k]] * c(ferr[[k]])
        P11[[k]] <- P10[[k]] - (KG[[k]] %*% M.X[[k]][i,,drop=FALSE] %*% P10[[k]])
        y.B11[i,k] <- M.X[[k]][i,] %*% B11[[k]]

        #------ EVALUATE PREDICTIVE DENSITIES FOR EACH MODEL ---------------------------------------------
        PredDensity[k] <- (1/((2*pi*feta[[k]])^0.5))*exp(-1*((ferr[[k]])^2)/(2*feta[[k]]))
        numerator[k] <- Prob10[k]*PredDensity[k]
       
            
        #------ STORE ESTIMATES OF BETAs AND THEIR VARIANCE ----------------------------------
        Btt[[k]][i,] <- B11[[k]]
        Ptt[[k]][,,i] <- P11[[k]]
            
            
         } # end of the "predict-and-update" loop (end of "k" cycle)

    #----- UPDATE MODEL PROBABILITIES
    denominator <- sum(numerator)
    Prob11 <- numerator/denominator
      
    #----- STORE POSTERIOR MODEL PROBABILITIES
        
    Probtt[i,] <- Prob11
    
    } # end of the Kalman loop (end of "i" cycle)
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx END OF KALMAN FILTER CALCULATIONS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  

  
#==================================================================================================================================
#    EVERYTHING IS COMPUTED. NOW, LET's PRODUCE SOME RESULTS
#==================================================================================================================================

# posterior model probabilities ---------------------------------------------------
Probtt


# posterior inclusion probabilities for individual variables ----------------------
InclProb <- matrix(NA,nrow = nObs,ncol = nVar)
for (i in 1:nVar)
{
  InclProb[,i] <- rowSums(Probtt[,which(M[,i]==1)])
}


# DMA fitted values ---------------------------------------------------------------
rowSums(Probtt*y.B11)
# DMA predicted values ------------------------------------------------------------
rowSums(rbind(rep(1/nMod, nMod), Probtt[-nObs,])*y.B10)

# DMS (Dynamic model selection) fitted values -------------------------------------
indx <- c(apply(Probtt,1, function(x) which(x == max(x))))
apply(cbind(1:nObs, indx),1, function(x) y.B11[x[1],x[2]])


# DMA Beta coefficients (regression coefficients) ---------------------------------- 
BtDMA <- matrix(NA,nrow = nObs,ncol = nVar)
for (i in 1:nVar)
{
  indx <- which(M[,i] == 1)
  M.Subset <- M[which(M[,i] == 1),]  
  B.indx <- apply(M.Subset, 1, function(x) which(which(x==1)==i))
  BtDMA[,i] <- rep(0, nObs)
  for (k in 1:length(indx))
    {
      BtDMA[,i] <- BtDMA[,i] + Btt[[indx[k]]][,B.indx[k]]*Probtt[,indx[k]]
    }
}


# DMA Standard deviations of Beta coefficients (regression coefficients) -----------
BtSdDMA <- matrix(NA,nrow = nObs,ncol = nVar)
for (i in 1:nVar)
{
  indx <- which(M[,i] == 1)
  M.Subset <- M[which(M[,i] == 1),]  
  B.indx <- apply(M.Subset, 1, function(x) which(which(x==1)==i))
  BtSdDMA[,i] <- rep(0, nObs)
  for (k in 1:length(indx))
  {
    BtSdDMA[,i] <- BtSdDMA[,i] + sqrt(Ptt[[indx[k]]][B.indx[k],B.indx[k],])*Probtt[,indx[k]]
  }
}

# DMA variance of error terms in observation equation
rowSums(Htt*Probtt)

# Average size of the model
rowSums(matrix(rep(rowSums(M),nObs), nrow = nObs, byrow = TRUE)*Probtt)
