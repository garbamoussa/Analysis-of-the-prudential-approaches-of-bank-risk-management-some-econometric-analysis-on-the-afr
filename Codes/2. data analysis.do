clear all
set more off

global in "C:"
/*************************************************************************************************/

use "$in\nlsy_wage_data", clear


*see determinants of wage for women who work
reg log_woman_wage years_education experience
outreg2 using "$in\reg_results.xls", excel noparen noaster nonotes bdec(6) replace  ctitle(no indicators)

reg log_woman_wage years_education experience
estimates store m1
xi: reg log_woman_wage i.educ_categories experience
estimates store m2
xi: reg log_woman_wage i.educ_categories*nbr_under6 experience
estimates store m3

outreg2 [m1 m2 m3] using "$in\reg_results.xls", excel noparen noaster nonotes bdec(6) replace  ctitle(no indicators)


tabout	experience educ_categories using "$in\Experience by Education.xls"  ,  replace
