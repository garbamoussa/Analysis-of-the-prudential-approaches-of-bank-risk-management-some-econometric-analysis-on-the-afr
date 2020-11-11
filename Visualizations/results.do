





















 xtabond2 ROA L.ROA L2.ROA CP L.CP RC RPPP RD TA GDP INFL Year, gmm(L.CP) iv(CP L.CP Year) nolevel robust
Favoring speed over space. To switch, type or click on mata: mata set matafavor space, perm.
TA dropped due to collinearity
Warning: Two-step estimated covariance matrix of moments is singular.
  Using a generalized inverse to calculate robust weighting matrix for Hansen test.
  Difference-in-Sargan/Hansen statistics may be negative.

Dynamic panel-data estimation, one-step difference GMM
------------------------------------------------------------------------------
Group variable: ID                              Number of obs      =      1575
Time variable : Year                            Number of groups   =       315
Number of instruments = 23                      Obs per group: min =         5
Wald chi2(10) =    113.00                                      avg =      5.00
Prob > chi2   =     0.000                                      max =         5
------------------------------------------------------------------------------
             |               Robust
         ROA |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
         ROA |
         L1. |  -.1535796   .1469443    -1.05   0.296    -.4415852     .134426
         L2. |   .0165876   .0803273     0.21   0.836     -.140851    .1740262
             |
          CP |
         --. |  -.0124148   .1095043    -0.11   0.910    -.2270393    .2022097
         L1. |  -.0667261   .0411924    -1.62   0.105    -.1474618    .0140095
             |
          RC |   .1567909   .1379942     1.14   0.256    -.1136727    .4272545
        RPPP |   -.082275   .0260192    -3.16   0.002    -.1332717   -.0312784
          RD |   .0137265   .0218332     0.63   0.530    -.0290658    .0565188
         GDP |   .2919913   .1691405     1.73   0.084    -.0395179    .6235005
        INFL |   .0532493   .0297686     1.79   0.074    -.0050962    .1115947
        Year |  -.0007005   .0012148    -0.58   0.564    -.0030816    .0016805
------------------------------------------------------------------------------
Instruments for first differences equation
  Standard
    D.(CP L.CP Year)
  GMM-type (missing=0, separate instruments for each period unless collapsed)
    L(1/7).L.CP
------------------------------------------------------------------------------
Arellano-Bond test for AR(1) in first differences: z =  -2.14  Pr > z =  0.033
Arellano-Bond test for AR(2) in first differences: z =   0.21  Pr > z =  0.831
------------------------------------------------------------------------------
Sargan test of overid. restrictions: chi2(13)   =   3.95  Prob > chi2 =  0.992
  (Not robust, but not weakened by many instruments.)
Hansen test of overid. restrictions: chi2(13)   =   5.64  Prob > chi2 =  0.958
  (Robust, but weakened by many instruments.)

Difference-in-Hansen tests of exogeneity of instrument subsets:
  iv(CP L.CP Year)
    Hansen test excluding group:     chi2(10)   =   4.46  Prob > chi2 =  0.924
    Difference (null H = exogenous): chi2(3)    =   1.19  Prob > chi2 =  0.757


