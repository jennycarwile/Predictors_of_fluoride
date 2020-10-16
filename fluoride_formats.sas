libname NH         "\\UserData\Users\jcarwile\Fluoride\NHANES files\";
libname USDAorig   "\\UserData\Users\jcarwile\Fluoride\USDA\Original";
libname USDA       "\\UserData\Users\jcarwile\Fluoride\USDA\";


proc format;
value eligible
1 = 'Age missing, <6 or >=20 years'
2 = 'Missing plasma fluoride'
3 = 'Missing water fluoride'
4 = 'Dietary recall status: missing or not reliable'
5 = 'Eligible'
;

value sddsrvyr
8 = '2013-2014'
9 = '2015-2016'
;

value yn
1 = 'Yes'
0 = 'No'
;

value yn_alt
1 = '1: Yes'
2 = '2: No'
;

value gender
1 = 'Male'
2 = 'Female'
;

value male
0 = '1: Female'
1 = '0: Male'
;

value age_cat
4 = '4: 6 to <9 years'
3 = '3: 9 to <12 years'
2 = '2: 12 to <15 years'
1 = '1: 15 to 19 years'
;

value age_catb
3 = '4: 6 to <11 years'
2 = '2: 11 to <16 years'
1 = '1: 16 to 19 years'
;

value age_cat_1619_yr
0 = '1: 6 to <16 years'
1 = '0: 16 to 19 years'
;

value race
5 = '0: Other'
4 = '4: NH White'
2 = '2: Hispanic'
3 = '3: NH Black'
1 = '1: Asian'
;

value ridreth
1 = 'Mexican American'
2 = 'Other Hispanic'
3 = 'Non-Hispanic White'
4 = 'Non-Hispanic Black'
6 = 'Non-Hispanic Asian'
7 = 'Other race, including multi-racial'
;


value epa_optimal
1 = '4: 0.1 to <0.3 mg/L'
2 = '3: 0.3 to <0.7 mg/L'
3 = '2: >=0.7-1.2 mg/L'
4 = '1: >1.2 mg/L'
;

value tap_water_cat
1 = '5: 0 cups '
2 = '4: >0 to 1 cup'
3 = '3: 1-2 cups'
4 = '2: 2-3 cups'
5 = '1: 3+ cups'
;

value fl_tapwater_cat
1 = '0 g'
2 = '>0 to 0.008 g'
3 = '>0.008 to 0.22 g'
4 = '>0.22 g'
;

value water_source
1 = '1: Well or rain cistern'
2 = '2: Spring'
3 = '3: Dont drink tap water'
4 = '4: Community supply'
;

value toothpaste
1 = 'A: Full load'
2 = 'B: Half load'
3 = 'C: Pea size'
4 = 'D: Smear'
7 = 'Refused'
9 = 'Dont know'
;

value dr1tws
1  = 'A Community supply'
2  = 'D Well or cistern'
3  = 'C Spring'
4  = 'E Dont drink tap water'
91 = 'Other'
99 = 'B Dont know'
;

value quartiles
1 = '4: <0.5 full loads'
2 = '3: 0.5 to <1 full loads'
3 = '2: 1 to <2 full loads'
4 = '1: >=2 full loads'
;

value tertiles
1 = '3: 0 to <1 full loads'
2 = '2: 1 to <2 full loads'
3 = '1: >=2 full loads'
;

value brush_amt_cat
1 = 'A 4 or more times/day'
2 = 'B 3 times/day'
3 = 'C 2 times/day'
4 = 'D 1 times /day'
;

value income_poverty_cat
1 = '3: <100'
2 = '2: 100 to <200'
3 = '1: >=200'
;

value food
1 = '0: Some recent consumption'
0 = '1: No recent consumption'
;

value tea_cat
0 = '4: None'
1 = '1: 1 serving/day'
2 = '2: 2 servings/day'
3 = '3: >=3 servings/day'
;

value creatinine_cat
1='Creatinine quartile 1'
2='Creatinine quartile 2'
3='Creatinine quartile 3'
4='Creatinine quartile 4'
;

value calcium_cat
1='Calcium quartile 1'
2='Calcium quartile 2'
3='Calcium quartile 3'
4='Calcium quartile 4'
;

value portion_cups_cat
1 = '5: 0 cups'
2 = '4: >0-1 cup'
3 = '3: >1-2 cups'
4 = '2: >2-3 cups'
5 = '1: >3 cups'
;

value LOD
1 = '<LOD'
0 = '>LOD'
;

run;