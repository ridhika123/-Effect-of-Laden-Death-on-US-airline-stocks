
*set directory

cd "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data" 

use "airlines_ff3fm_coefficients.dta", replace

*get rid of excess data

drop if event_time <-19
*drop if event_time <-10

*Generate Predicted Returns using FF2FM

gen predicted_return = rf + beta_mkt_rf*mktrf+ beta_smb*smb + beta_hml*hml
*gen predicted_return = rf + beta_mkt_rf*mkt_rf+ beta_smb*smb + beta_hml*hml

*Generate Abnormal Returns

gen ar = return - predicted_return

*Generate cumulative abnormal returns

egen car_3_1 = sum(ar) if event_time>-1 & event_time<4, by(security)
label var car_3_1 "3 day CAR"

egen car_7_1 = sum(ar) if event_time>-1 & event_time<8,  by(security)
label var car_7_1 "7 day CAR"

egen car_14_1 = sum(ar) if event_time>-1 & event_time<15,  by(security)
label var car_14_1 "14 day CAR"

egen car_20_1 = sum(ar) if event_time>-1 & event_time<21,  by(security)
label var car_20_1 "20 day CAR"

*Find CAARs and test for statistical significance

sum car_3_1 if event_time==0, detail
estpost sum car_3_1 if event_time==0
eststo car_3_est  
display r(N)*r(mean)/r(sd) //tstat

sum car_7_1 if event_time==0, detail
estpost sum car_7_1 if event_time==0
eststo car_7_est  
display r(N)*r(mean)/r(sd)

sum car_14_1 if event_time==0, detail
estpost sum car_14_1 if event_time==0
eststo car_14_est  
display r(N)*r(mean)/r(sd)

sum car_20_1 if event_time==0, detail
estpost sum car_20_1 if event_time==0
eststo car_20_est  
display r(N)*r(mean)/r(sd)

estpost tabstat car_3_1 car_7_1 car_14_1 car_20_1 if event_time==0, statistics(mean sd) column(statistics)
eststo car_all
esttab car_all using car_bl_1.rtf, replace cell(mean sd(par)) mti nonumber label title("Table 1. Average CARs") mtitle("Bin Laden Death")


estpost tabstat car_3_1 if security==1, statistics(mean) column(statistics)
eststo car_3_a_1
estpost tabstat car_3_1 if security==2, statistics(mean) column(statistics)
eststo car_3_a_2
estpost tabstat car_3_1 if security==3, statistics(mean) column(statistics)
eststo car_3_a_3
estpost tabstat car_3_1 if security==4, statistics(mean) column(statistics)
eststo car_3_a_4
estpost tabstat car_3_1 if security==5, statistics(mean) column(statistics)
eststo car_3_a_5
estpost tabstat car_3_1 if security==6, statistics(mean) column(statistics)
eststo car_3_a_6
estpost tabstat car_3_1 if security==7, statistics(mean) column(statistics)
eststo car_3_a_7
estpost tabstat car_3_1 if security==8, statistics(mean) column(statistics)
eststo car_3_a_8
estpost tabstat car_3_1 if security==9, statistics(mean) column(statistics)
eststo car_3_a_9

esttab car_3_a_1 car_3_a_2 car_3_a_3 car_3_a_4 car_3_a_5 car_3_a_6 car_3_a_7 car_3_a_8 car_3_a_9 using car_bl3_2.rtf, replace cell(mean) mti nonumber label title("Table 2. Average CARs") 


estpost tabstat car_7_1 if security==1, statistics(mean) column(statistics)
eststo car_7_a_1
estpost tabstat car_7_1 if security==2, statistics(mean) column(statistics)
eststo car_7_a_2
estpost tabstat car_7_1 if security==3, statistics(mean) column(statistics)
eststo car_7_a_3
estpost tabstat car_7_1 if security==4, statistics(mean) column(statistics)
eststo car_7_a_4
estpost tabstat car_7_1 if security==5, statistics(mean) column(statistics)
eststo car_7_a_5
estpost tabstat car_7_1 if security==6, statistics(mean) column(statistics)
eststo car_7_a_6
estpost tabstat car_7_1 if security==7, statistics(mean) column(statistics)
eststo car_7_a_7
estpost tabstat car_7_1 if security==8, statistics(mean) column(statistics)
eststo car_7_a_8
estpost tabstat car_7_1 if security==9, statistics(mean) column(statistics)
eststo car_7_a_9

esttab car_7_a_1 car_7_a_2 car_7_a_3 car_7_a_4 car_7_a_5 car_7_a_6 car_7_a_7 car_7_a_8 car_7_a_9 using car_bl7_2.rtf, replace cell(mean) mti nonumber label title("Table 2. Average CARs") 

estpost tabstat car_14_1 if security==1, statistics(mean) column(statistics)
eststo car_14_a_1
estpost tabstat car_14_1 if security==2, statistics(mean) column(statistics)
eststo car_14_a_2
estpost tabstat car_14_1 if security==3, statistics(mean) column(statistics)
eststo car_14_a_3
estpost tabstat car_14_1 if security==4, statistics(mean) column(statistics)
eststo car_14_a_4
estpost tabstat car_14_1 if security==5, statistics(mean) column(statistics)
eststo car_14_a_5
estpost tabstat car_14_1 if security==6, statistics(mean) column(statistics)
eststo car_14_a_6
estpost tabstat car_14_1 if security==7, statistics(mean) column(statistics)
eststo car_14_a_7
estpost tabstat car_14_1 if security==8, statistics(mean) column(statistics)
eststo car_14_a_8
estpost tabstat car_14_1 if security==9, statistics(mean) column(statistics)
eststo car_14_a_9

esttab car_14_a_1 car_14_a_2 car_14_a_3 car_14_a_4 car_14_a_5 car_14_a_6 car_14_a_7 car_14_a_8 car_14_a_9 using car_bl14_2.rtf, replace cell(mean) mti nonumber label title("Table 2. Average CARs") 

estpost tabstat car_20_1 if security==1, statistics(mean) column(statistics)
eststo car_20_a_1
estpost tabstat car_20_1 if security==2, statistics(mean) column(statistics)
eststo car_20_a_2
estpost tabstat car_20_1 if security==3, statistics(mean) column(statistics)
eststo car_20_a_3
estpost tabstat car_20_1 if security==4, statistics(mean) column(statistics)
eststo car_20_a_4
estpost tabstat car_20_1 if security==5, statistics(mean) column(statistics)
eststo car_20_a_5
estpost tabstat car_20_1 if security==6, statistics(mean) column(statistics)
eststo car_20_a_6
estpost tabstat car_20_1 if security==7, statistics(mean) column(statistics)
eststo car_20_a_7
estpost tabstat car_20_1 if security==8, statistics(mean) column(statistics)
eststo car_20_a_8
estpost tabstat car_20_1 if security==9, statistics(mean) column(statistics)
eststo car_20_a_9

esttab car_20_a_1 car_20_a_2 car_20_a_3 car_20_a_4 car_20_a_5 car_20_a_6 car_20_a_7 car_20_a_8 car_20_a_9 using car_bl20_2.rtf, replace cell(mean) mti nonumber label title("Table 2. Average CARs") 

egen car_1 = sum(ar) if event_time<=-20, by(security)
egen car_2 = sum(ar) if event_time<=-19, by(security)
egen car_3 = sum(ar) if event_time<=-18, by(security)
egen car_4 = sum(ar) if event_time<=-17, by(security)
egen car_5 = sum(ar) if event_time<=-16, by(security)
egen car_6 = sum(ar) if event_time<=-15, by(security)
egen car_7 = sum(ar) if event_time<=-14, by(security)
egen car_8 = sum(ar) if event_time<=-13, by(security)
egen car_9 = sum(ar) if event_time<=-12, by(security)
egen car_10 = sum(ar) if event_time<=-11, by(security)
egen car_11 = sum(ar) if event_time<=-10, by(security)
egen car_12 = sum(ar) if event_time<=-9, by(security)
egen car_13 = sum(ar) if event_time<=-8, by(security)
egen car_14 = sum(ar) if event_time<=-7, by(security)
egen car_15 = sum(ar) if event_time<=-6, by(security)
egen car_16 = sum(ar) if event_time<=-5, by(security)
egen car_17 = sum(ar) if event_time<=-4, by(security)
egen car_18 = sum(ar) if event_time<=-3, by(security)
egen car_19 = sum(ar) if event_time<=-2, by(security)
egen car_20 = sum(ar) if event_time<=-1, by(security)
egen car_21 = sum(ar) if event_time<=0, by(security)
egen car_22 = sum(ar) if event_time<=1, by(security)
egen car_23 = sum(ar) if event_time<=2, by(security)
egen car_24 = sum(ar) if event_time<=3, by(security)
egen car_25 = sum(ar) if event_time<=4, by(security)
egen car_26 = sum(ar) if event_time<=5, by(security)
egen car_27 = sum(ar) if event_time<=6, by(security)
egen car_28 = sum(ar) if event_time<=7, by(security)
egen car_29 = sum(ar) if event_time<=8, by(security)
egen car_30 = sum(ar) if event_time<=9, by(security)
egen car_31 = sum(ar) if event_time<=10, by(security)
egen car_32 = sum(ar) if event_time<=11, by(security)
egen car_33 = sum(ar) if event_time<=12, by(security)
egen car_34 = sum(ar) if event_time<=13, by(security)
egen car_35 = sum(ar) if event_time<=14, by(security)
egen car_36 = sum(ar) if event_time<=15, by(security)
egen car_37 = sum(ar) if event_time<=16, by(security)
egen car_38 = sum(ar) if event_time<=17, by(security)
egen car_39 = sum(ar) if event_time<=18, by(security)
egen car_40 = sum(ar) if event_time<=19, by(security)
egen car_41 = sum(ar) if event_time<=20, by(security)
egen car_42 = sum(ar) if event_time<=21, by(security)


gen car = .
label var car "Cumulative Abnormal Return from day -19 to 20"
replace car = car_1 if event_time ==-20
replace car = car_2 if event_time ==-19
replace car = car_3 if event_time ==-18
replace car = car_4 if event_time ==-17
replace car = car_5 if event_time ==-16
replace car = car_6 if event_time ==-15
replace car = car_7 if event_time ==-14
replace car = car_8 if event_time ==-13
replace car = car_9 if event_time ==-12
replace car = car_10 if event_time ==-11
replace car = car_11 if event_time ==-10
replace car = car_12 if event_time ==-9
replace car = car_13 if event_time ==-8
replace car = car_14 if event_time ==-7
replace car = car_15 if event_time ==-6
replace car = car_16 if event_time ==-5
replace car = car_17 if event_time ==-4
replace car = car_18 if event_time ==-3
replace car = car_19 if event_time ==-2
replace car = car_20 if event_time ==-1
replace car = car_21 if event_time ==0
replace car = car_22 if event_time ==1
replace car = car_23 if event_time ==2
replace car = car_24 if event_time ==3
replace car = car_25 if event_time ==4
replace car = car_26 if event_time ==5
replace car = car_27 if event_time ==6
replace car = car_28 if event_time ==7
replace car = car_29 if event_time ==8
replace car = car_30 if event_time ==9
replace car = car_31 if event_time ==10
replace car = car_32 if event_time ==11
replace car = car_33 if event_time ==12
replace car = car_34 if event_time ==13
replace car = car_35 if event_time ==14
replace car = car_36 if event_time ==15
replace car = car_37 if event_time ==16
replace car = car_38 if event_time ==17
replace car = car_39 if event_time ==18
replace car = car_40 if event_time ==19
replace car = car_41 if event_time ==20
replace car = car_42 if event_time ==21

**** Regression of Percent of International routes
merge m:1 ticker using "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data/international.dta"
label variable international "Percent of International Seat Miles"
xtset security date
xtreg car international
eststo car_international
esttab car_international using a.rtf, replace label noconstant nonumber title("Percent of International Seat Miles of Airlines vs. CAR") mtitle("CAR") se star(* .10 ** .05 *** .01)


