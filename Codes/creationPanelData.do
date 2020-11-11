preserve

keep CountryName CountryCode D

gen year=1990

drop D

save "/Users/garbamoussa/Desktop/Data/an90.dta", replace

restore

preserve

keep CountryName CountryCode E

gen year=1991

drop E

save "/Users/garbamoussa/Desktop/Data/an91.dta", 

restore

preserve

keep CountryName CountryCode F

gen year=1992

drop F

save "/Users/garbamoussa/Desktop/Data/an92.dta"

restore


preserve
keep CountryName CountryCode G

gen year=1993

drop G

save "/Users/garbamoussa/Desktop/Data/an93.dta"

restore

preserve

keep CountryName CountryCode H

gen year=1994

drop H

save "/Users/garbamoussa/Desktop/Data/an94.dta"

restore

preserve

keep CountryName CountryCode I

gen year=1995

drop I

save "/Users/garbamoussa/Desktop/Data/an95.dta"

restore

preserve

keep CountryName CountryCode J

gen year=1996

drop J

save "/Users/garbamoussa/Desktop/Data/an96.dta"

restore

preserve

keep CountryName CountryCode K

gen year=1997

drop K

save "/Users/garbamoussa/Desktop/Data/an97.dta"

restore

preserve

keep CountryName CountryCode L

gen year=1998

drop L

save "/Users/garbamoussa/Desktop/Data/an98.dta"

restore

preserve

keep CountryName CountryCode M

gen year=1999

drop M

save "/Users/garbamoussa/Desktop/Data/an99.dta"

restore

preserve

keep CountryName CountryCode N

gen year=2000

drop N

save "/Users/garbamoussa/Desktop/Data/an00.dta"

restore

preserve

keep CountryName CountryCode O

gen year=2001

drop O

save "/Users/garbamoussa/Desktop/Data/an01.dta"

restore

preserve

keep CountryName CountryCode P

gen year=2002

drop P

save "/Users/garbamoussa/Desktop/Data/an02.dta"

restore

preserve

keep CountryName CountryCode Q

gen year=2003

drop Q

save "/Users/garbamoussa/Desktop/Data/an03.dta"

restore

preserve

keep CountryName CountryCode R

gen year=2004

drop R

save "/Users/garbamoussa/Desktop/Data/an04.dta"

restore

preserve

keep CountryName CountryCode S

gen year=2005

drop S

save "/Users/garbamoussa/Desktop/Data/an05.dta"

restore

preserve

keep CountryName CountryCode T

gen year=2006

drop T

save "/Users/garbamoussa/Desktop/Data/an06.dta"

restore

preserve

keep CountryName CountryCode U

gen year=2007

drop U

save "/Users/garbamoussa/Desktop/Data/an07.dta"

restore

preserve

keep CountryName CountryCode V

gen year=2008

drop V

save "/Users/garbamoussa/Desktop/Data/an08.dta"

restore

preserve

keep CountryName CountryCode W

gen year=2009

drop W

save "/Users/garbamoussa/Desktop/Data/an09.dta"

restore

preserve

keep CountryName CountryCode X

gen year=2010

drop X

save "/Users/garbamoussa/Desktop/Data/an10.dta"

restore


preserve

keep CountryName CountryCode Y

gen year=2011

drop Y

save "/Users/garbamoussa/Desktop/Data/an11.dta"

restore

preserve

keep CountryName CountryCode Z

gen year=2012

drop Z

save "/Users/garbamoussa/Desktop/Data/an12.dta"

restore



preserve

keep CountryName CountryCode AA

gen year=2013

drop AA

save "/Users/garbamoussa/Desktop/Data/an13.dta"

restore

preserve

keep CountryName CountryCode AB

gen year=2014

drop AB

save "/Users/garbamoussa/Desktop/Data/an14.dta"

restore

preserve

keep CountryName CountryCode AC

gen year=2015

drop AC

save "/Users/garbamoussa/Desktop/Data/an15.dta"

restore


append using "/Users/garbamoussa/Desktop/Data/an00.dta" "/Users/garbamoussa/Desktop/Data/an01.dta"

