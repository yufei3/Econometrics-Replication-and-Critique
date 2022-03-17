//Yufei Zhao, yzhao87, 31548281, TR 14:00-15:25
//Group Member: Xuchen Huang
cls
clear all

use replication_data.dta
browse

*index of activity
gen activeindex = last24hr_mc_go_to_work + last24hr_mc_grocery + last24hr_mc_exercise + last24hr_mc_take_a_walk + last24hr_mc_visit_friend_family + last24hr_mc_restaurant + last24hr_mc_medical_care

*generate dummy variables for all categories

gen republican = .
replace republican = 1 if pid5 == "Republican"
replace republican = 0 if pid5 == "Lean Republican" | pid5 == "Independent" | pid5 == "Lean Democrat" | pid5 == "Democrat"

gen lrepublican = .
replace lrepublican = 1 if pid5 == "Lean Republican"
replace lrepublican = 0 if pid5 == "Republican" | pid5 == "Independent" | pid5 == "Lean Democrat" | pid5 == "Democrat"

gen independent = .
replace independent = 1 if pid5 == "Independent"
replace independent = 0 if pid5 == "Lean Republican" | pid5 == "Republican" | pid5 == "Lean Democrat" | pid5 == "Democrat"

gen ldemocrat = .
replace ldemocrat = 1 if pid5 == "Lean Democrat"
replace ldemocrat = 0 if pid5 == "Lean Republican" | pid5 == "Independent" | pid5 == "Republican" | pid5 == "Democrat"

gen democrat = .
replace democrat = 1 if pid5 == "Democrat"
replace democrat = 0 if pid5 == "Lean Republican" | pid5 == "Independent" | pid5 == "Lean Democrat" | pid5 == "Republican"

*gengerate Republican and Democrat with leaners
gen republicans = .
replace republicans = 1 if pid5 == "Republican" | pid5 == "Lean Republican"
replace republicans = 0 if pid5 == "Democrat" | pid5 == "Lean Democrat" | pid5 == "Independent"

gen democrats = .
replace democrats = 1 if pid5 == "Democrat" | pid5 == "Lean Democrat"
replace democrats = 0 if pid5 == "Republican" | pid5 == "Lean Republican" | pid5 == "Independent"

*generate urban-rural indicators
browse density
gen urban = .
replace urban = 1 if density == "Urban"
replace urban = 0 if density == "Rural" | density == "Suburban"

gen rural = .
replace rural = 1 if density == "Rural"
replace rural = 0 if density == "Urban" | density == "Suburban"


*table S1
regress activeindex trend trend_sq democrat ldemocrat lrepublican republican casechange female income_30_75 income_75_150 income_above150 age_25_34 age_35_44 age_45_54 age_55_64 age_65_p other_race black asian hispanic hs associates_somecollege college postgrad unemployed rural urban state_2 state_3 state_4 state_5 state_6 state_7 state_8 state_9 state_10 state_11 state_12 state_13 state_14 state_15 state_16 state_17 state_18 state_19 state_20 state_21 state_22 state_23 state_24 state_25 state_26 state_27 state_28 state_29 state_30 state_31 state_32 state_33 state_34 state_35 state_36 state_37 state_38 state_39 state_40 state_41 state_42 state_43 state_44 state_45 state_46 state_47 state_48 state_49 state_50 state_51, cluster(state)


* table S3
*model1
regress activeindex trend trend_sq female income_30_75 income_75_150 income_above150 age_25_34 age_35_44 age_45_54 age_55_64 age_65_p other_race black asian hispanic hs associates_somecollege college postgrad unemployed rural urban state_2 state_3 state_4 state_5 state_6 state_7 state_8 state_9 state_10 state_11 state_12 state_13 state_14 state_15 state_16 state_17 state_18 state_19 state_20 state_21 state_22 state_23 state_24 state_25 state_26 state_27 state_28 state_29 state_30 state_31 state_32 state_33 state_34 state_35 state_36 state_37 state_38 state_39 state_40 state_41 state_42 state_43 state_44 state_45 state_46 state_47 state_48 state_49 state_50 state_51, cluster(state)

*model2
regress activeindex trend trend_sq democrats republicans female income_30_75 income_75_150 income_above150 age_25_34 age_35_44 age_45_54 age_55_64 age_65_p other_race black asian hispanic hs associates_somecollege college postgrad unemployed rural urban state_2 state_3 state_4 state_5 state_6 state_7 state_8 state_9 state_10 state_11 state_12 state_13 state_14 state_15 state_16 state_17 state_18 state_19 state_20 state_21 state_22 state_23 state_24 state_25 state_26 state_27 state_28 state_29 state_30 state_31 state_32 state_33 state_34 state_35 state_36 state_37 state_38 state_39 state_40 state_41 state_42 state_43 state_44 state_45 state_46 state_47 state_48 state_49 state_50 state_51, cluster(state)

*model3
regress activeindex trend trend_sq statecasechange female income_30_75 income_75_150 income_above150 age_25_34 age_35_44 age_45_54 age_55_64 age_65_p other_race black asian hispanic hs associates_somecollege college postgrad unemployed rural urban state_2 state_3 state_4 state_5 state_6 state_7 state_8 state_9 state_10 state_11 state_12 state_13 state_14 state_15 state_16 state_17 state_18 state_19 state_20 state_21 state_22 state_23 state_24 state_25 state_26 state_27 state_28 state_29 state_30 state_31 state_32 state_33 state_34 state_35 state_36 state_37 state_38 state_39 state_40 state_41 state_42 state_43 state_44 state_45 state_46 state_47 state_48 state_49 state_50 state_51, cluster(state)

*model4
regress activeindex trend trend_sq democrats republicans statecasechange female income_30_75 income_75_150 income_above150 age_25_34 age_35_44 age_45_54 age_55_64 age_65_p other_race black asian hispanic hs associates_somecollege college postgrad unemployed rural urban state_2 state_3 state_4 state_5 state_6 state_7 state_8 state_9 state_10 state_11 state_12 state_13 state_14 state_15 state_16 state_17 state_18 state_19 state_20 state_21 state_22 state_23 state_24 state_25 state_26 state_27 state_28 state_29 state_30 state_31 state_32 state_33 state_34 state_35 state_36 state_37 state_38 state_39 state_40 state_41 state_42 state_43 state_44 state_45 state_46 state_47 state_48 state_49 state_50 state_51, cluster(state)

