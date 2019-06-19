clear all
set more off
use "C:\Users\danie\Documents\SPRING 2019\ECON 6060 ADVANCED ECONIMETRICS\assignment\assignment 5\crime.dta" 

// PART 1
replace sworn=sworn/citypop*100000
replace civil=civil/citypop*100000
replace murder=murder/citypop*100000
replace rape=rape/citypop*100000
replace robb=robb/citypop*100000
replace assa=assa/citypop*100000
replace burg=burg/citypop*100000
replace larc=larc/citypop*100000
replace auto=auto/citypop*100000

summarize sworn civil murder rape robb assa burg larc auto


gen d_sworn=ln(sworn)-ln(sworn[_n-1]) if city==city[_n-1]



reg d_sworn elecyear governor i.year
// eststo model1


gen d_sta_welf=ln(sta_welf)-ln(sta_welf[_n-1]) if city==city[_n-1]
gen d_sta_educ=ln(sta_educ)-ln(sta_educ[_n-1]) if city==city[_n-1]
gen d_unemp=unemp-unemp[_n-1] if city==city[_n-1]
gen d_citybla=citybla-citybla[_n-1] if city==city[_n-1]
gen d_cityfemh=cityfemh-cityfemh[_n-1] if city==city[_n-1]
gen a15_24=a15_19+a20_24
gen d_a15_24=a15_24-a15_24[_n-1] if city==city[_n-1]
generate citysize=0
replace citysize=1 if citypop<250000
replace citysize=2 if (citypop<500000&citypop>=250000)
replace citysize=3 if (citypop<1000000&citypop>=500000)
replace citysize=4 if (citypop>=1000000)
tab citysize, gen(cs) nof
reg d_sworn elecyear governor i.year d_sta_welf d_sta_educ d_unemp d_citybla d_cityfemh d_a15_24 cs2 cs3 cs4 
// eststo model2


reg d_sworn elecyear governor i.year d_sta_welf d_sta_educ d_unemp d_citybla d_cityfemh d_a15_24 cs2 cs3 cs4 b1.city
// eststo model3

// esttab, r2 ar2 se scalar(rmse)

summarize cs1 cs2 cs3 cs4 

//Part 2
use "C:\Users\danie\Documents\SPRING 2019\ECON 6060 ADVANCED ECONIMETRICS\assignment\assignment 5\crime_second.dta" , clear
gen violent =murder+rape+robbery+assa


gen d_violent=ln(violent)-ln(violent[_n-1]) if city==city[_n-1]
reg d_violent d_sworn c_st_edu c_st_wel c_a15_24 c_black c_femhea c_unemp cc2 cc3 cc4 cc5 cc6 cc7 cc8 cc9 cc10 cc11 cc12 cc13 cc14 cc15 cc16 cc17 cc18 cc19 cc20 cc21 cc22 cc23 cc24 cc25 cc26 cc27 cc28 cc29 cc30 cc31 cc32 cc33 cc34 cc35 cc36 cc37 cc38 cc39 cc40 cc41 cc42 cc43 cc44 cc45 cc46 cc47 cc48 cc49 cc50 cc51 cc52 cc53 cc54 cc55 cc56 cc57 cc58 cc59 cs2 cs3 cs4 cs5 cs6 cs7 cs8 cs9 cs10 cs11 cs12 cs13 cs14 cs15 cs16 cs17 cs18 cs19 cs20 cs21 cs22 cs23 cs24 cs25 cs26 cs27 cs28 yy2 yy3 yy4 yy5 yy6 yy7 yy8 yy9 yy10 yy11 yy12 yy13 yy14 yy15 yy16 yy17 yy18 yy19 yy20 yy21 yy22 yy23 yy24 yy25 yy26 yy27 yy28 yy29 yy30 yy31 yy32 yy33 yy34 yy35 yy36 yy37 yy38 yy39
eststo model1


reg d_sworn elecyear governor cc2 cc3 cc4 cc5 cc6 cc7 cc8 cc9 cc10 cc11 cc12 cc13 cc14 cc15 cc16 cc17 cc18 cc19 cc20 cc21 cc22 cc23 cc24 cc25 cc26 cc27 cc28 cc29 cc30 cc31 cc32 cc33 cc34 cc35 cc36 cc37 cc38 cc39 cc40 cc41 cc42 cc43 cc44 cc45 cc46 cc47 cc48 cc49 cc50 cc51 cc52 cc53 cc54 cc55 cc56 cc57 cc58 cc59 cs2 cs3 cs4 cs5 cs6 cs7 cs8 cs9 cs10 cs11 cs12 cs13 cs14 cs15 cs16 cs17 cs18 cs19 cs20 cs21 cs22 cs23 cs24 cs25 cs26 cs27 cs28 yy2 yy3 yy4 yy5 yy6 yy7 yy8 yy9 yy10 yy11 yy12 yy13 yy14 yy15 yy16 yy17 yy18 yy19 yy20 yy21 yy22 yy23 yy24 yy25 yy26 yy27 yy28 yy29 yy30 yy31 yy32 yy33 yy34 yy35 yy36 yy37 yy38 yy39
eststo model2
reg d_violent d_sworn c_st_edu c_st_wel c_a15_24 c_black c_femhea c_unemp cc** cs** yy**
eststo model3
reg d_sworn elecyear governor cc** cs** yy**
eststo model4
predict d_sworn_fits


gen d_sworn_fits1=d_sworn_fits[_n-1]
gen d_sworn_fits2=d_sworn_fits[_n-2]

reg d_violent d_sworn_fits d_sworn_fits1 d_sworn_fits2 c_st_edu c_st_wel c_a15_24 c_black c_femhea c_unemp cc** cs** yy**
eststo model5

esttab, r2 ar2 se scalar(rmse)









