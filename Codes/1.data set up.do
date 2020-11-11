*The data comes from the NLSY 1997, available at
*https://www.nlsinfo.org/investigator/pages/search.jsp?s=NLSY97

clear all
set more off

global in "C:"

/*************************************************************************************************/
*get information on martital status and personal ID
infile using "$in\default-maritalstatus.dct", clear
keep   R7007000 R0000100
rename R7007000 married
rename R0000100 pubid
save "$in\marital_status", replace

*insheet complete dataset 
infile using "$in\default.dct", clear
*get the value labels
include "$in\default-value-labels.do"
rename R0000100 pubid
save "$in\full_data", replace


use "$in\full_data", clear
*merge the marital status by personal ID
merge 1:1 pubid using "$in\marital_status"

*check how the merge went
tab _merge

*now drop the merge indicator -> not needed anymore (plus, if we merge another dataset, we need to have dropped this merge indicator before mergin again)
drop _merge

*keep married women only
keep if  married==1 &  R0214800==2

*keep white females only
drop if R0214700!=3

*get number of children under 6 in year 2000
gen nbr_under6=0
foreach var of varlist R9900002-R9907402{
gen temp=(2000-`var'-1) if `var'!=-4
replace nbr_under6=nbr_under6+1 if temp<7 & temp!=.
drop temp
}

*now drop these vars on chidlren birth years
drop R9900002-R9907402

*now create a variable for work experience - nbr of years worked at least 6 months
gen experience=0
foreach var of varlist  R0215700-  R6480000 R7007700 {
replace experience=experience+1 if `var'>=24 & `var'!=-4
}

drop R0215700-R6480000 

rename  R7007600 annual_hours_worked
replace annual_hours_worked=0 if annual_hours_worked<0
gen woman_wage=R6909701/annual_hours_worked if R6909701>0 & annual_hours_worked>0

gen annual_hours_sp=(R6749800*R6749700)
replace annual_hours_sp=0 if annual_hours_sp<0
gen spouse_wage=(R6917801/annual_hours_sp) if R6917801>0 & (annual_hours_sp>0)
*code the negatives ones as 0
replace woman_wage=0 if woman_wage==.
replace spouse_wage=0 if spouse_wage==.

rename  R7007700 annual_weeks_worked_2000

drop  R0214800 R7007100

rename  R7007300 years_education
rename R6940101 assets

drop R0214700- R6917801

*examine the characteristics of the wage data
summ woman_wage, detail
tab woman_wage,miss

*examine the characteristics of the hours data
summ annual_hours_worked, detail

*note: if 80-hour week, maximum number of hours should be 52*80=4160, so code those larger than that as missing/wrong 
replace annual_hours_worked=. if annual_hours_worked>4160
*also correct the woman wage
replace woman_wage=. if annual_hours_worked==.

*make some corrections to make sure consistent data
replace woman_wage=0 if annual_hours_worked==0
replace annual_hours_worked=0 if woman_wage<1.01 /*this is arbitrary -> just for practice now*/
replace woman_wage=0 if woman_wage<1.01

*create a flag for working status
gen employed=0
replace employed=1 if annual_hours_worked!=0
replace employed=. if annual_hours_worked==.

gen work_status="working" if employed==1
replace work_status="not working" if work_status==""


*transform wage into log wage
gen log_woman_wage=log(woman_wage)
*note that all the zero wages (for women not working) would be coded as missing under a log wage for now


*get yrs of education
gen years_education2=1 if years_education==1
replace years_education2=2 if years_education==2
replace years_education2=3 if years_education==3
replace years_education2=4 if years_education==4
replace years_education2=5 if years_education==5
replace years_education2=6 if years_education==6
replace years_education2=7 if years_education==7
replace years_education2=8 if years_education==8
replace years_education2=9 if years_education==9
replace years_education2=10 if years_education==10
replace years_education2=11 if years_education==11
replace years_education2=12 if years_education==12
replace years_education2=13 if years_education==13
replace years_education2=14 if years_education==14
replace years_education2=15 if years_education==15
replace years_education2=16 if years_education==16
replace years_education2=17 if years_education==17
replace years_education2=18 if years_education==18
replace years_education2=19 if years_education==19
replace years_education2=20 if years_education==20

drop years_education
rename years_education2 years_education


gen educ_categories="not completed_HS" if years_education<12
replace educ_categories="HS education" if years_education==12
replace educ_categories="some college" if years_education>12 & years_education<16
replace educ_categories="college" if years_education==16
replace educ_categories="graduate degree" if years_education>16



*output data in stata format
save "$in\nlsy_wage_data", replace

*output data as an excel file
outsheet using "$in\nlsy_wage_data.xls", replace

