****************************************************
* Author: Jennifer Zheng                           *
* Date Created:10 April 2022                       *
* Date Edited:10 April 2022                        *
* Purpose: Final Project                           *
* Version: Stata 17.0                              *
****************************************************


*************************************** DATA CLEANING & MERGING ***************************************** 

* Clean Mortality Rate Data (Cause of death, by communicable diseases and maternal, prenatal and nutrition conditions (% of total))

keep CountryName IndicatorName BC BH BL
rename BC MRData2010
rename BH MRData2015
rename BL MRData2019
label variable MRData2010 "2010 Mortality Rate Data. Cause of death, by communicable diseases and maternal, prenatal and nutrition conditions, % of total"
label variable MRData2015 "2015 Mortality Rate Data. Cause of death, by communicable diseases and maternal, prenatal and nutrition conditions, % of total"
label variable MRData2019 "2019 Mortality Rate Data. Cause of death, by communicable diseases and maternal, prenatal and nutrition conditions, % of total"
save MR.dta



* Clean Government Expenditure on Education Data (Government expenditure on education, total (% of government expenditure))

keep CountryName IndicatorName BC BH BL

rename BC EEData2010
rename BH EEData2015
rename BL EEData2019
label variable EEData2010 "2010 Government Expenditure on Education Data. Government expenditure on education, total, % of government expenditure."
label variable EEData2015 "2015 Government Expenditure on Education Data. Government expenditure on education, total, % of government expenditure."
label variable EEData2019 "2019 Government Expenditure on Education Data. Government expenditure on education, total, % of government expenditure."
save EE.dta

* Clean Government expenditure on education, total (% of GDP)

keep CountryName IndicatorName BC BH BL

rename BC EEGDPData2010
rename BH EEGDPData2015
rename BL EEGDPData2019
label variable EEGDPData2010 "2010 Government expenditure on education, total (% of GDP)"
label variable EEGDPData2015 "2015 Government expenditure on education, total (% of GDP)"
label variable EEGDPData2019 "2019 Government expenditure on education, total (% of GDP)"
save EEGDP.dta


* Clean Primary Completion Rate Data 
keep CountryName IndicatorName BC BH BL

rename BC PCData2010
rename BH PCData2015
rename BL PCData2019
label variable PCData2010 "2010 Primary Completion Rate"
label variable PCData2015 "2015 Primary Completion Rate"
label variable PCData2019 "2019 Primary Completion Rate"

save PC.dta


* Clean GDP (current US$)

keep CountryName IndicatorName BC BH BL
rename BC GDPData2010
rename BH GDPData2015
rename BL GDPData2019
label variable GDPData2010 "2010 GDP, current US$"
label variable GDPData2015 "2015 GDP, current US$"
label variable GDPData2019 "2019 GDP, current US$"
save GDP1.dta

* Clean School enrollment, primary (% gross) Gross" 
* Enrollment includes students of all ages. In other words, it includes students whose age exceeds the official age group (e.g. repeaters). Thus, if there is late enrollment, early enrollment, or repetition, the total enrollment can exceed the population of the age group that officially corresponds to the level of education – leading to ratios greater than 100 percent

keep CountryName IndicatorName BC BH BL
rename BC PEData2010
rename BH PEData2015
rename BL PEData2019
label variable PEData2010 "2010 School enrollment, primary (% gross) Gross"
label variable PEData2015 "2015 School enrollment, primary (% gross) Gross"
label variable PEData2019 "2019 School enrollment, primary (% gross) Gross"
save PE.dta
use PE.dta

* Clean School enrollment, secondary (% gross) Gross" 

keep CountryName IndicatorName BC BH BL
rename BC SEData2010
rename BH SEData2015
rename BL SEData2019
label variable SEData2010 "2010 School enrollment, secondary (% gross) Gross"
label variable SEData2015 "2015 School enrollment, secondary (% gross) Gross"
label variable SEData2019 "2019 School enrollment, secondary (% gross) Gross"
save SE.dta
use SE.dta

* Clean School enrollment, tertiary (% gross) Gross" 

keep CountryName IndicatorName BC BH BL
rename BC TEData2010
rename BH TEData2015
rename BL TEData2019
label variable TEData2010 "2010 School enrollment, tertiary (% gross) Gross"
label variable TEData2015 "2015 School enrollment, tertiary (% gross) Gross"
label variable TEData2019 "2019 School enrollment, tertiary (% gross) Gross"
save TE.dta
use TE.dta

* Clean Population, total

keep CountryName IndicatorName BC BH BL
rename BC PPLData2010
rename BH PPLData2015
rename BL PPLData2019
drop IndicatorName
label variable PPLData2010 "2010 Population, total"
label variable PPLData2015 "2015 Population, total"
label variable PPLData2019 "2019 Population, total"
save PPL.dta
use PPL.dta

* Clean Immunization, DPT (% of children ages 12-23 months)
keep if SeriesName == "Immunization, DPT (% of children ages 12-23 months)"
rename YR2010 IDPT2010
rename YR2015 IDPT2015
rename YR2019 IDPT2019
drop CountryCode SeriesCode
drop SeriesCode 
drop SeriesName
generate IDPT2010_n = real(IDPT2010)
generate IDPT2015_n = real(IDPT2015)
generate IDPT2019_n = real(IDPT2019)

label variable IDPT2010_n "2010 Immunization, DPT (% of children ages 12-23 months)"
label variable IDPT2015_n "2015 Immunization, DPT (% of children ages 12-23 months)"
label variable IDPT2019_n "2019 Immunization, DPT (% of children ages 12-23 months)"

drop IDPT2010 IDPT2015 IDPT2019
save IDPT.dta
use IDPT.dta

* Clean Immunization, measles (% of children ages 12-23 months)
keep if SeriesName == "Immunization, measles (% of children ages 12-23 months)"
rename YR2010 IMea2010
rename YR2015 IMea2015
rename YR2019 IMea2019
drop CountryCode SeriesCode
drop SeriesCode 
drop SeriesName
generate IMea2010_n = real(IMea2010)
generate IMea2015_n = real(IMea2015)
generate IMea2019_n = real(IMea2019)

label variable IMea2010_n "2010 Immunization, measles (% of children ages 12-23 months)"
label variable IMea2015_n "2015 Immunization, measles (% of children ages 12-23 months)"
label variable IMea2019_n "2019 Immunization, measles (% of children ages 12-23 months)"

drop IMea2010 IMea2015 IMea2019
save IMea.dta
use IMea.dta

* Clean Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)
keep if SeriesName == "Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)"
rename YR2010 AlC2010
rename YR2015 AlC2015
rename YR2019 AlC2019
drop CountryCode SeriesCode
* drop SeriesCode 
drop SeriesName
generate AlC2010_n = real(AlC2010)
generate AlC2015_n = real(AlC2015)
generate AlC2019_n = real(AlC2019)

label variable AlC2010_n "2010 Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)"
label variable AlC2015_n "2015 Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)"
label variable AlC2019_n "2019 Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)"

drop AlC2010 AlC2015 AlC2019
save AlC2010.dta

* Clean Current health expenditure (% of GDP)
keep if SeriesName == "Current health expenditure (% of GDP)"
rename YR2010 HE2010
rename YR2015 HE2015
rename YR2019 HE2019
drop CountryCode SeriesCode
* drop SeriesCode 
drop SeriesName
generate HE2010_n = real(HE2010)
generate HE2015_n = real(HE2015)
generate HE2019_n = real(HE2019)

label variable HE2010_n "2010 Current health expenditure (% of GDP)"
label variable HE2015_n "2015 Current health expenditure (% of GDP)"
label variable HE2019_n "2019 Current health expenditure (% of GDP)"

drop HE2010 HE2015 HE2019
save HE.dta

* Clean Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)
keep if SeriesName == "Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"
rename YR2010 MRC2010
rename YR2015 MRC2015
rename YR2019 MRC2019
drop CountryCode SeriesCode
* drop SeriesCode 
drop SeriesName
generate MRC2010_n = real(MRC2010)
generate MRC2015_n = real(MRC2015)
generate MRC2019_n = real(MRC2019)

label variable MRC2010_n "2010 Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"
label variable MRC2015_n "2015 Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"
label variable MRC2019_n "2019 Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"

drop MRC2010 MRC2015 MRC2019
save MRC.dta

* Clean Immunization, Hib3 (% of children ages 12-23 months)
keep if SeriesName == "Immunization, Hib3 (% of children ages 12-23 months)"
rename YR2010 IHIB2010
rename YR2015 IHIB2015
rename YR2019 IHIB2019
drop CountryCode SeriesCode
* drop SeriesCode 
drop SeriesName
generate MRC2010_n = real(MRC2010)
generate MRC2015_n = real(MRC2015)
generate MRC2019_n = real(MRC2019)

label variable MRC2010_n "2010 Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"
label variable MRC2015_n "2015 Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"
label variable MRC2019_n "2019 Mortality from CVD, cancer, diabetes or CRD between exact ages 30 and 70 (%)"

drop MRC2010 MRC2015 MRC2019
save MRC.dta

* Clean People using at least basic sanitation services (% of population)
keep if SeriesName == "People using at least basic sanitation services (% of population)"
rename YR2010 PPLS2010
rename YR2015 PPLS2015
rename YR2019 PPLS2019
drop CountryCode SeriesCode
* drop SeriesCode 
drop SeriesName
generate PPLS2010_n = real(PPLS2010)
generate PPLS2015_n = real(PPLS2015)
generate PPLS2019_n = real(PPLS2019)

label variable PPLS2010_n "2010 People using at least basic sanitation services (% of population)"
label variable PPLS2015_n "2015 People using at least basic sanitation services (% of population)"
label variable PPLS2019_n "2019 People using at least basic sanitation services (% of population)"

drop PPLS2010 PPLS2015 PPLS2019
save PPLS.dta

* Clean People using safely managed sanitation services (% of population)
keep if SeriesName == "People using safely managed sanitation services (% of population)"
rename YR2010 PPLSMS2010
rename YR2015 PPLSMS2015
rename YR2019 PPLSMS2019
drop CountryCode SeriesCode
* drop SeriesCode 
drop SeriesName
generate PPLSMS2010_n = real(PPLSMS2010)
generate PPLSMS2015_n = real(PPLSMS2015)
generate PPLSMS2019_n = real(PPLSMS2019)

label variable PPLSMS2010_n "2010 People using safely managed sanitation services (% of population)"
label variable PPLSMS2015_n "2015 People using safely managed sanitation services (% of population)"
label variable PPLSMS2019_n "People using safely managed sanitation services (% of population)"

drop PPLSMS2010 PPLSMS2015 PPLSMS2019
save PPLSMS.dta

*******************************Combined Function********************************

use Combined.dta
use finaldata.dta
drop _merge
merge 1:1 CountryName using EEGDP.dta
save Combined.dta

drop SeriesCode 
drop SeriesName

help merge
merge 1:1 CountryName using EE.dta


*************************************** START ***************************************** 

clear all
capture log close

cd "/Users/jinqingmei/Desktop/stats/Final Project"

log using final_project.log, replace
set more off

use finaldata.dta

*************************************** Sample data ***************************************** 
reg MortalityRateDataCause EEGDPData2010 Schoolenrollmentprimary Schoolenrollmentsecondar Schoolenrollmenttertiary ImmunizationDPTofchi Immunizationmeaslesof Totalalcoholconsumptionp Peopleusingatleastbasic Peopleusingsafelymanaged GDPData2010

gen sample2010=(e(sample))

tab CountryName if sample2010 == 1
*************************************** FIRST MODEL ***************************************** 
* So, our theoretical model would be: 
* MR = beta_zero + beta_one(EE)  + Epsilon.

* The estimated mdoel would be:
* MR^ = beta_zero^ + beta_one^(Edu Expenditure)

reg MortalityRateDataCause EEGDPData2010 if sample2010==1
eststo first

// regress MRData2015 EEData2015
// regress MRData2019 EEData2019
//
//
// corr MRData2010 EEData2010
// corr MRData2015 EEData2015
// corr MRData2019 EEData2019

*************************************** SECOND MODEL ***************************************** 
* So, our theoretical model would be: 
* MR = beta_zero + beta_one(Edu Expenditure)  + beta_two(Education) + Epsilon.

* The estimated mdoel would be:
* MR^ = beta_zero^ + beta_one^(Edu Expenditure) + beta_two^(Education)

reg MortalityRateDataCause EEGDPData2010 Schoolenrollmentprimary Schoolenrollmentsecondar Schoolenrollmenttertiary if sample2010==1
eststo second

// regress MRData2015 EEData2015 PCData2015
// regress MRData2019 EEData2019 PCData2019
//
// corr MRData2010 EEData2010 PCData2010
// corr MRData2015 EEData2015 PCData2015
// corr MRData2019 EEData2019 PCData2019

*************************************** Third MODEL ***************************************** 
* So, our theoretical model would be: 
* MR = beta_zero + beta_one(Edu Expenditure)  + beta_two(Education) + beta_three(Health behavior) + Epsilon.

* The estimated mdoel would be:
* MR^ = beta_zero^ + beta_one^(Edu Expenditure) + beta_two^(Education) + beta_three^(Health behavior)

reg MortalityRateDataCause EEGDPData2010 Schoolenrollmentprimary Schoolenrollmentsecondar Schoolenrollmenttertiary ImmunizationDPTofchi Immunizationmeaslesof Totalalcoholconsumptionp Peopleusingatleastbasic Peopleusingsafelymanaged if sample2010==1
eststo third

// regress MRData2015 EEData2015 PCData2015
// regress MRData2019 EEData2019 PCData2019
//
// corr MRData2010 EEData2010 PCData2010
// corr MRData2015 EEData2015 PCData2015
// corr MRData2019 EEData2019 PCData2019

*************************************** Weighted by Population ***************************************** 
reg MortalityRateDataCause EEGDPData2010 Schoolenrollmentprimary Schoolenrollmentsecondar Schoolenrollmenttertiary ImmunizationDPTofchi Immunizationmeaslesof Totalalcoholconsumptionp Peopleusingatleastbasic Peopleusingsafelymanaged if sample2010==1 [aw=Populationtotal]
eststo fourth


*************************************** Add in GDP ***************************************** 
reg MortalityRateDataCause EEGDPData2010 Schoolenrollmentprimary Schoolenrollmentsecondar Schoolenrollmenttertiary ImmunizationDPTofchi Immunizationmeaslesof Totalalcoholconsumptionp Peopleusingatleastbasic Peopleusingsafelymanaged GDPData2010 if sample2010==1 [aw=Populationtotal]
eststo fifth


*************************************** visualize model ***************************************** 
ssc install outreg2
ssc install estout
ssc install esttab
ssc install asdoc

// export regression model
outreg2 [first second third fourth fifth] using regressions_2010_result.doc,dec(2) replace

esttab [first second third fourth fifth] using regressions_result.csv 

//export descriptive statistics
asdoc sum MortalityRateDataCause EEGDPData2010 Schoolenrollmentprimary Schoolenrollmentsecondar Schoolenrollmenttertiary ImmunizationDPTofchi Immunizationmeaslesof Totalalcoholconsumptionp Peopleusingatleastbasic Peopleusingsafelymanaged GDPData2010 Populationtotal if sample2010 ==1

//export sample country name
asdoc tab CountryName if sample2010 ==1

*************************************** clean data ***************************************** 

save finaldata_cleaned.dta
rename MortalityRateDataCause MortalityRate
rename EEGDPData2010 GovernmentExpenditureEdu

rename ImmunizationDPTofchi ImmunizationDPT
rename Immunizationmeaslesof ImmunizationMeasle
rename Totalalcoholconsumptionp AlcoholicConsumption
rename Peopleusingatleastbasic BasicSanitization
rename Peopleusingsafelymanaged SafelyManagedSanitization




