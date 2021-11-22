
*set directory

cd "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data" 

use "airlines_ff3fm_coefficients_911.dta", replace

*get rid of excess data

drop if event_time <-20
*drop if event_time <-10

*Generate Predicted Returns using FF2FM

gen predicted_return = rf + beta_mkt_rf*mktrf+ beta_smb*smb + beta_hml*hml
*gen predicted_return = rf + beta_mkt_rf*mkt_rf+ beta_smb*smb + beta_hml*hml

*Generate Abnormal Returns

gen ar = return - predicted_return

*Generate cumulative abnormal returns

egen car_3_2 = sum(ar) if event_time>-1 & event_time<4, by(security)
label var car_3_2 "3 day CAR"

egen car_7_2 = sum(ar) if event_time>-1 & event_time<8,  by(security)
label var car_7_2 "7 day CAR"

egen car_14_2 = sum(ar) if event_time>-1 & event_time<15,  by(security)
label var car_14_2 "14 day CAR"

egen car_20_2 = sum(ar) if event_time>-1 & event_time<21,  by(security)
label var car_20_2 "20 day CAR"

estpost tabstat car_3_2 car_7_2 car_14_2 car_20_2 if event_time==0, statistics(mean sd) column(statistics)
eststo car_all_911
esttab car_all_911 using car_911.rtf, replace cell(mean sd(par)) mti nonumber label title("Table 1. Average CARs") note("* p < .10, ** p < .05, *** p < .01") addnote("Note: ")

esttab car_all car_all_911 using car_both_1.rtf, replace cell(mean sd(par)) mti nonumber label title("Table 1. Average CARs") note("* p < .10, ** p < .05, *** p < .01") addnote("Note: ")


*Find CAARs and test for statistical significance

sum car_3_2 if event_time==0, detail
display r(N)*r(mean)/r(sd) //tstat

sum car_7_2 if event_time==0, detail
display r(N)*r(mean)/r(sd)

sum car_14_2 if event_time==0, detail
display r(N)*r(mean)/r(sd)

sum car_20_2 if event_time==0, detail
display r(N)*r(mean)/r(sd)


