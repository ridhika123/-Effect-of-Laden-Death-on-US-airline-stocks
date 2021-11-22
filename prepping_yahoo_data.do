

*Prepping Data from Yahoo! Finance

*Step 1: Find daily stock price data on firms that you care about

*Copy and paste data into Stata.

*gen ticker = "   " for each firm

*Saving a new .dta file for each firm

*Append .dta files together. 


* Generating tickers for airlines
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/alaska_2.dta"
gen ticker = "ALK"
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/allegiant_2.dta"
gen ticker = "ALGT" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/american_2.dta"
gen ticker = "AAL" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/delta_2.dta"
gen ticker = "DAL" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/hawaiian_2.dta"
gen ticker = "HA" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/jetblu_2.dta"
gen ticker = "JBLU"
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/skywest_2.dta"
gen ticker = "SKYW" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/southwest_2.dta"
gen ticker = "LUV" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/united_2.dta"
gen ticker = "UAL" 

use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/ALK.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/ALGT.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/AAL.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/DAL.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/HA.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/JBLU.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/SKYW.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/LUV.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/UAL.dta"


*Step 2: Create Stata dates and merge on FF3FM data

rename date date_string

gen date = date(date_string, "MDY")

merge m:1 date using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/ff3fm_data.dta"

drop if _merge~=3

drop _merge

*gen stock_price = real(adjclose)

*OR 

rename adjclose stock_price

*drop adjclose

drop open high low close volume

gen day = day(date)
gen month = month(date)
gen year = year(date)

*Step 3 Save as data for analysis

save "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/airlines_sp.dta", replace

