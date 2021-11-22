

*Prepping Data from Yahoo! Finance

*Step 1: Find daily stock price data on firms that you care about

*Copy and paste data into Stata.

*gen ticker = "   " for each firm

*Saving a new .dta file for each firm

*Append .dta files together. 


* Generating tickers for airlines
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/911_alaska_2.dta"
gen ticker = "ALK"
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/911_skywest_2.dta"
gen ticker = "SKYW" 
use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/911_southwest_2.dta"
gen ticker = "LUV"  

use "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/911_ALK.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/911_SKYW.dta"
append using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/911_LUV.dta"

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

save "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/airlines_sp_911.dta", replace

