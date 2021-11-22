
*Set directory

cd "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data"
*cd "C:\Users\ohrneric\Desktop" 

*Create dataset of stock prices, fama french factors, and firm characteristics

use "airlines_sp_911.dta", clear

*use "stock_prices_comp_ff3fm_2003.dta", clear
*append using "stock_prices_comp_ff3fm_2002.dta"

*Find Event Date

sort date ticker
*sort date ncusip

egen day_group = group(date)

*JGTRRA was passed by congress on May 22, 2003
* Bin Laden died on May 2, 2011

sum day_group if day == 10 & month ==9 & year == 2001
*sum day_group if day == 22 & month ==5 & year == 2003

gen event_time = day_group - 252
*gen event_time = day_group - 350

*event_time = 0 on May 22, 2003
*event_time = 0 on May 2, 2011

*generate event window

gen event_window = 0 
replace event_window = 1 if event_time>=-20 & event_time<21
*replace event_window = 1 if event_time>=-10 & event_time<11

*generate estimation window

gen estimation_window = 0
replace estimation_window = 1 if event_time<-20 & event_time >=-120
*replace estimation_window = 1 if event_time<-10 & event_time >=-110

*kick out securities that don't have 100 observations in the estimation window

egen obs = count(stock_price) if estimation_window==1, by(ticker)
*egen obs = count(stock_price) if estimation_window==1, by(ncusip)

egen mean_obs = mean(obs), by(ticker)
*egen mean_obs = mean(obs), by(ncusip)

drop if mean_obs ~=100
*drop if mean_obs ~=100

*generate a unique numerical identifier that you can loop over

egen security = group(ticker)
*egen security = group(ncusip)

sum security, detail
* There are 9 securities with 20 observations in the estimation window
* There are 4960 securities with 100 observations in the estimation window

* Generate daily stock price returns

xtset security event_time

gen return = ((stock_price - l.stock_price)/l.stock_price)*100
gen return_rf = ((stock_price - l.stock_price)/l.stock_price)*100 - rf

*Get rid of excess data

gen keeper = 1 if event_window==1
replace keeper = 1 if estimation_window==1

drop if keeper~=1
drop keeper

*Generate firm specific ff3fm coefficients

gen beta_mkt_rf = .
gen beta_smb = .
gen beta_hml = .


forvalues i = 1(1)3{
display `i'
quietly{
reg return_rf mktrf smb hml if security == `i' & estimation_window ==1
replace beta_mkt_rf = _b[mktrf] if security == `i'
replace beta_smb = _b[smb] if security == `i'
replace beta_hml = _b[hml] if security == `i'
}
}
/*
forvalues i = 1(1)4960{
display `i'
quietly{
reg return_rf mkt_rf smb hml if security == `i' & estimation_window ==1
replace beta_mkt_rf = _b[mkt_rf] if security == `i'
replace beta_smb = _b[smb] if security == `i'
replace beta_hml = _b[hml] if security == `i'
}
}*/
save "airlines_ff3fm_coefficients_911.dta", replace

