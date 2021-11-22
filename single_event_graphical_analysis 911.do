cd "/Users/ridhika/Desktop/Semester 8/ECN Corporate Finance/Project/Data" 

use "airlines_ff3fm_coefficients_911.dta", replace

drop if event_time <=-21

drop if event_time >=21

*Generate Predicted Returns using FF2FM
gen predicted_return = rf + beta_mkt_rf*mktrf+ beta_smb*smb + beta_hml*hml
*gen predicted_return = rf + beta_mkt_rf*mkt_rf+ beta_smb*smb + beta_hml*hml

/*
** RUN FOR RETURNS GRAPH 
collapse predicted_return return, by(event_time)
twoway (connect predicted_return event_time) (connect return event_time), legend(label(1 "FF3FM Predicted Returns") label(2 "Actual Returns"))
*/


*Generate Abnormal Returns

gen ar = return - predicted_return

*Generate Explanatory Variable

*gen div_firm = 0
*replace div_firm = 1 if dv>0 & dv~=.
*label var div_firm "Dividend Firm"

collapse ar, by(event_time)
collapse ar, by(event_time security)
*collapse ar, by(event_time div_firm)

label var ar "Abnormal Return"
*label var div_firm "Dividend Firm"
label var event_time "Event Time"

*Plot average abnormal returns for both dividend and non dividend firms
twoway (connect ar event_time)
*twoway (connect ar event_time if div_firm==1) (connect ar event_time if div_firm==0),  legend(label(1 "Dividend Firms") label(2 "Non Dividend Firms"))

*Construct Abnormal Returns that grow from event time -10 to event time 10
egen car_1 = sum(ar) if event_time<=0
egen car_2 = sum(ar) if event_time<=1
egen car_3 = sum(ar) if event_time<=2
egen car_4 = sum(ar) if event_time<=3
egen car_5 = sum(ar) if event_time<=4
egen car_6 = sum(ar) if event_time<=5
egen car_7 = sum(ar) if event_time<=6
egen car_8 = sum(ar) if event_time<=7
egen car_9 = sum(ar) if event_time<=8
egen car_10 = sum(ar) if event_time<=9
egen car_11 = sum(ar) if event_time<=10
egen car_12 = sum(ar) if event_time<=11
egen car_13 = sum(ar) if event_time<=12
egen car_14 = sum(ar) if event_time<=13
egen car_15 = sum(ar) if event_time<=14
egen car_16 = sum(ar) if event_time<=15
egen car_17 = sum(ar) if event_time<=16
egen car_18 = sum(ar) if event_time<=17
egen car_19 = sum(ar) if event_time<=18
egen car_20 = sum(ar) if event_time<=19
egen car_21 = sum(ar) if event_time<=20

egen car_1 = sum(ar) if event_time<=-20
egen car_2 = sum(ar) if event_time<=-19
egen car_3 = sum(ar) if event_time<=-18
egen car_4 = sum(ar) if event_time<=-17
egen car_5 = sum(ar) if event_time<=-16
egen car_6 = sum(ar) if event_time<=-15
egen car_7 = sum(ar) if event_time<=-14
egen car_8 = sum(ar) if event_time<=-13
egen car_9 = sum(ar) if event_time<=-12
egen car_10 = sum(ar) if event_time<=-11
egen car_11 = sum(ar) if event_time<=-10
egen car_12 = sum(ar) if event_time<=-9
egen car_13 = sum(ar) if event_time<=-8
egen car_14 = sum(ar) if event_time<=-7
egen car_15 = sum(ar) if event_time<=-6
egen car_16 = sum(ar) if event_time<=-5
egen car_17 = sum(ar) if event_time<=-4
egen car_18 = sum(ar) if event_time<=-3
egen car_19 = sum(ar) if event_time<=-2
egen car_20 = sum(ar) if event_time<=-1
egen car_21 = sum(ar) if event_time<=0
egen car_22 = sum(ar) if event_time<=1
egen car_23 = sum(ar) if event_time<=2
egen car_24 = sum(ar) if event_time<=3
egen car_25 = sum(ar) if event_time<=4
egen car_26 = sum(ar) if event_time<=5
egen car_27 = sum(ar) if event_time<=6
egen car_28 = sum(ar) if event_time<=7
egen car_29 = sum(ar) if event_time<=8
egen car_30 = sum(ar) if event_time<=9
egen car_31 = sum(ar) if event_time<=10
egen car_32 = sum(ar) if event_time<=11
egen car_33 = sum(ar) if event_time<=12
egen car_34 = sum(ar) if event_time<=13
egen car_35 = sum(ar) if event_time<=14
egen car_36 = sum(ar) if event_time<=15
egen car_37 = sum(ar) if event_time<=16
egen car_38 = sum(ar) if event_time<=17
egen car_39 = sum(ar) if event_time<=18
egen car_40 = sum(ar) if event_time<=19
egen car_41 = sum(ar) if event_time<=20
egen car_42 = sum(ar) if event_time<=21


** BY AIRLINES **
egen car_1 = sum(ar) if event_time<=0, by(security)
egen car_2 = sum(ar) if event_time<=1, by(security)
egen car_3 = sum(ar) if event_time<=2, by(security)
egen car_4 = sum(ar) if event_time<=3, by(security)
egen car_5 = sum(ar) if event_time<=4, by(security)
egen car_6 = sum(ar) if event_time<=5, by(security)
egen car_7 = sum(ar) if event_time<=6, by(security)
egen car_8 = sum(ar) if event_time<=7, by(security)
egen car_9 = sum(ar) if event_time<=8, by(security)
egen car_10 = sum(ar) if event_time<=9, by(security)
egen car_11 = sum(ar) if event_time<=10, by(security)
egen car_12 = sum(ar) if event_time<=11, by(security)
egen car_13 = sum(ar) if event_time<=12, by(security)
egen car_14 = sum(ar) if event_time<=13, by(security)
egen car_15 = sum(ar) if event_time<=14, by(security)
egen car_16 = sum(ar) if event_time<=15, by(security)
egen car_17 = sum(ar) if event_time<=16, by(security)
egen car_18 = sum(ar) if event_time<=17, by(security)
egen car_19 = sum(ar) if event_time<=18, by(security)
egen car_20 = sum(ar) if event_time<=19, by(security)
egen car_21 = sum(ar) if event_time<=20, by(security)

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

/*
xtset div_firm event_time

egen car_1 = sum(ar) if event_time <=-10 , by(div_firm)
egen car_2 = sum(ar) if event_time <=-9 , by(div_firm)
egen car_3 = sum(ar) if event_time <=-8 , by(div_firm)
egen car_4 = sum(ar) if event_time <=-7 , by(div_firm)
egen car_5 = sum(ar) if event_time <=-6 , by(div_firm)
egen car_6 = sum(ar) if event_time <=-5 , by(div_firm)
egen car_7 = sum(ar) if event_time <=-4 , by(div_firm)
egen car_8 = sum(ar) if event_time <=-3 , by(div_firm)
egen car_9 = sum(ar) if event_time <=-2 , by(div_firm)
egen car_10 = sum(ar) if event_time <=-1 , by(div_firm)
egen car_11 = sum(ar) if event_time <=0 , by(div_firm)
egen car_12 = sum(ar) if event_time <=1 , by(div_firm)
egen car_13 = sum(ar) if event_time <=2 , by(div_firm)
egen car_14 = sum(ar) if event_time <=3 , by(div_firm)
egen car_15 = sum(ar) if event_time <=4 , by(div_firm)
egen car_16 = sum(ar) if event_time <=5 , by(div_firm)
egen car_17 = sum(ar) if event_time <=6, by(div_firm)
egen car_18 = sum(ar) if event_time <=7 , by(div_firm)
egen car_19 = sum(ar) if event_time <=8 , by(div_firm)
egen car_20 = sum(ar) if event_time <=9 , by(div_firm)
egen car_21 = sum(ar) if event_time <=10 , by(div_firm)
*/

*Place these all into a single variable
gen car = .
label var car "Cumulative Abnormal Return day 0 to 20"
replace car = car_1 if event_time ==0
replace car = car_2 if event_time ==1
replace car = car_3 if event_time ==2
replace car = car_4 if event_time ==3
replace car = car_5 if event_time ==4
replace car = car_6 if event_time ==5
replace car = car_7 if event_time ==6
replace car = car_8 if event_time ==7
replace car = car_9 if event_time ==8
replace car = car_10 if event_time ==9
replace car = car_11 if event_time ==10
replace car = car_12 if event_time ==11
replace car = car_13 if event_time ==12
replace car = car_14 if event_time ==13
replace car = car_15 if event_time ==14
replace car = car_16 if event_time ==15
replace car = car_17 if event_time ==16
replace car = car_18 if event_time ==17
replace car = car_19 if event_time ==18
replace car = car_20 if event_time ==19
replace car = car_21 if event_time ==20

gen car = .
label var car "Cumulative Abnormal Return day 0 to 20"
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
/*
gen car = .
label var car "Cumulative Abnormal Return -10 to t"
replace car = car_1 if event_time ==-10
replace car = car_2 if event_time ==-9
replace car = car_3 if event_time ==-8
replace car = car_4 if event_time ==-7
replace car = car_5 if event_time ==-6
replace car = car_6 if event_time ==-5
replace car = car_7 if event_time ==-4
replace car = car_8 if event_time ==-3
replace car = car_9 if event_time ==-2
replace car = car_10 if event_time ==-1
replace car = car_11 if event_time ==-0
replace car = car_12 if event_time ==1
replace car = car_13 if event_time ==2
replace car = car_14 if event_time ==3
replace car = car_15 if event_time ==4
replace car = car_16 if event_time ==5
replace car = car_17 if event_time ==6
replace car = car_18 if event_time ==7
replace car = car_19 if event_time ==8
replace car = car_20 if event_time ==9
replace car = car_21 if event_time ==10
*/
* Graph CARs

twoway (connect car event_time), xline(0) title("Figure 1. Average Cumulative Abnormal Returns: 9/11", size(1/100)) xtitle("Days from Event Time") ytitle("CAAR from day -19 to 20")
*twoway (connect car event_time if div_firm==1) (connect car event_time if div_firm==0) ,  legend(label(1 "Dividend Firms") label(2 "Non Dividend Firms"))


** BY AIRLINES **
twoway (connect car event_time if security==1) (connect car event_time if security==2) (connect car event_time if security==3), legend(label(1 "Alaska Airlines") label(2 "Southwest Airlines") label(3 "SkyWest")) xline(0) title("Figure 4. Cumulative Abnormal Returns by Airlines: 9/11", size(1/100)) xtitle("Days from Event Time") ytitle("CAR from day -19 to 20")








