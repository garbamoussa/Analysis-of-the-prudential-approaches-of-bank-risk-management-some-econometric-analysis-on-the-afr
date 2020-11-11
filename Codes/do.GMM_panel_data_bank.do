use "/Users/imad019/Documents/thèse/Thèse2/Chapitre 3/Calculs_croissance/4.11 New/26:02:19H.dta"
use "/Users/imad019/Documents/thèse/Thèse2/Chapitre 3/Calculs_croissance/4.11 New/26:02:19H.dta"
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp lrem lopen inf lkh ldepgov, lag(2 2)) gmm (lpop linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp lrem lopen inf lkh ldepgov, lag(2 2)) gmm (lrem lpop linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp  linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp lrem lopen inf lkh ldepgov, lag(2 2)) gmm (lpop lrem linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp lopen inf lkh ldepgov, lag(2 2)) gmm (lpop lrem linv, lag (2 3) collapse)
log using "/Users/imad019/Documents/thèse/Thèse2/Chapitre 3/Calculs_croissance/estimation avec endogeinite.smcl"
use "/Users/imad019/Documents/thèse/Thèse2/Chapitre 3/Calculs_croissance/4.11 New/26:02:19H.dta"
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp lopen inf lkh ldepgov, lag(2 2)) gmm (lpop lrem linv, lag (2 3) collapse)
lincom l.lgdp-1
xtabond2 lgdp l.lgdp ldvfin1 lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp ldvfin1 lopen inf lkh ldepgov, lag(2 3)) gmm (lpop lrem linv, lag (2 3) collapse)
lincom l.lgdp-1
xtabond2 lgdp l.lgdp ldvfin2 lrem linv lpop lopen lkh ldepgov tps1 tps2 tps3 tps4 tps5,iv(tps1 tps2 tps4 tps5) gmm (l.lgdp ldvfin1 lopen lkh ldepgov, lag(3 2)) gmm (lpop lrem linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp ldvfin2 lrem linv lpop lopen lkh ldepgov tps1 tps2 tps3 tps4,iv(tps1 tps2 tps4 tps5) gmm (l.lgdp ldvfin1 lopen lkh ldepgov, lag(3 2)) gmm (lpop lrem linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp ldvfin2 lrem linv lpop lopen lkh ldepgov tps1 tps2 tps3 ,iv(tps1 tps2 tps4 tps5) gmm (l.lgdp ldvfin1 lopen lkh ldepgov, lag(3 2)) gmm (lpop lrem linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp ldvfin2 lrem linv lpop lopen lkh ldepgov tps1 tps2 tps3 tps4 tps5,iv(tps1 tps2 tps4 tps5) gmm (l.lgdp ldvfin1 lopen lkh ldepgov, lag(3 2)) gmm (lpop lrem linv, lag (2 3) collapse)
lincom l.lgdp-1
xtabond2 lgdp lrem inter1 ldvfin1 linv lkh ldepgov inf lpop lopen l.lgdp tps2 tps3 tps4 tps5 tps6, iv(tps1 tps2 tps3 tps4 tps5 tps6)  gmm (lrem ldvfin1 inter1 lkh inf ldepgov lopen l.lgdp , lag (2 1) collapse) gmm ( linv lpop , lag (1 2) collapse) 
lincom l.lgdp-1
 xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(2 2)) gmm (lpop lrem linv, lag (2 3) collapse)
 xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 tps3,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(2 2)) gmm (lpop lrem linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(2 2)) gmm (lrem lpop linv, lag (2 3) collapse)
lincom l.lgdp-1
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov lpop, lag(2 2)) gmm (lrem  linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2,iv(tps1 tps2) gmm (l.lgdp  lopen inf  ldepgov lpop, lag(2 2)) gmm (lrem lkh linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 tps3,iv(tps1 tps2 tps3) gmm (l.lgdp  lopen inf lkh ldepgov, lag(2 2)) gmm (lrem lpop linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 ,iv(tps1 ) gmm (l.lgdp  lopen inf lkh ldepgov, lag(2 2)) gmm (lrem lpop linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps3 ,iv(tps1 tps3) gmm (l.lgdp  lopen inf lkh ldepgov, lag(2 2)) gmm (lrem lpop linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps3 ,iv(tps1 tps3) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 1)) gmm (lrem lpop linv, lag (2 3) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps3 ,iv(tps1 tps3) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 1)) gmm (lrem lpop linv, lag (1 1) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 ,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 1)) gmm (lrem lpop linv, lag (1 1) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 ,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 2)) gmm (lrem lpop linv, lag (1 2) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 ,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 2)) gmm (lrem lpop linv, lag (2 2) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 ,iv(tps1 tps2) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 2)) gmm (lrem lpop linv, lag (1 2) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 tps4 ,iv(tps1 tps2 tps4) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 2)) gmm (lrem lpop linv, lag (1 2) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps2 tps4 tps5 ,iv(tps1 tps2 tps4 tps5) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 2)) gmm (lrem lpop linv, lag (1 2) collapse)
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov  tps5 ,iv(tps5) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 2)) gmm (lrem lpop linv, lag (1 2) collapse)
lincom l.lgdp-1
save "/Users/imad019/Documents/thèse/Thèse2/Chapitre 3/Calculs_croissance/20:11:14_11H21.dta"
xtabond2 lgdp l.lgdp lrem linv lpop inf lopen lkh ldepgov tps1 tps3 ,iv(tps1 tps3) gmm (l.lgdp  lopen inf lkh ldepgov, lag(1 1)) gmm (lrem lpop linv, lag (1 1) collapse)
