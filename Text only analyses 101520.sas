%include '\\UserData\Users\jcarwile\Fluoride\SAS programs\fluoride_formats.sas';



/******************************************************************/
title 'ABSTRACT. Geometric mean plasma fluoride, overall';
proc surveymeans data=nh.merged_examined nobs geomean missing ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible
;
var lbdpfl 
;
run;

/*****************************************************************/
title  'METHODS: Eligibility status';
proc surveyfreq data=nh.merged_examined /* missing */;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible_a
/cl row;
run;

/******************************************************************/
title 'RESULTS. Geometric mean plasma fluoride, overall';
proc surveymeans data=nh.merged_examined nobs geomean missing ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
var lbdpfl 
;
run;

title 'RESULTS: Percent of plasma samples <LOD';
proc surveyfreq data=nh.merged_examined /* missing */;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible*LBDPFLLC
/cl row;
run;

title 'RESULTS: mean tap water fluoride by NHANES cycle';
proc surveymeans data=nh.merged_examined nobs median nmiss ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
var  LBDWFL ;
domain eligible eligible*sddsrvyr ;
run;

title 'RESULTS: Percent of participants with fluoridated home water';
proc surveyfreq data=nh.merged_examined /* missing */;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible*fl_exposure
/cl row;
run;

title 'RESULTS: Percent of water samples <LOD';
proc surveyfreq data=nh.merged_examined /* missing */;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible*LBDWFLLC
/cl row;
run;

title 'RESULTS: R-squared for fully adjusted model';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fl_consumption riagendr race greenblack_tea  ;
model ln_plasma_fluoride= fl_consumption riagendr ridageyr  race greenblack_tea 
/clparm solution vadjust=none adjrsq anova;
run;

title 'RESULTS: R-squared for fully adjusted model - green/black tea';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fl_consumption riagendr race   ;
model ln_plasma_fluoride= fl_consumption riagendr ridageyr  race 
/clparm solution vadjust=none adjrsq anova;
run;

title 'RESULTS: R-squared for fully adjusted model - fluoridated drinking water';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class  riagendr race greenblack_tea  ;
model ln_plasma_fluoride=  riagendr ridageyr  race greenblack_tea 
/clparm solution vadjust=none adjrsq anova;
run;


title 'RESULTS: Tap water fluoride, by supplementation';
proc surveymeans data=nh.merged_examined nobs median q1 q3 min max nmiss ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
var  lbdwfl ;
domain eligible*fluoride_supp;
run;

/* SENSITIVITY ANALYSES */
/* 1. Continuous water fluoride and plasma fluoride, among tap water consumers */
title 'Model 3: Tap water fluoride concentrations and plasma fluoride, overall, tap water consumers';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible_tap;
class   race  riagendr ;
model ln_plasma_fluoride= lbdwfl riagendr ridageyr  race greenblack_tea
/clparm solution vadjust=none;
run;

/* 2. Classifying fluoridated water as >0.5 */
title 'RESULTS: Percentage consuming fluoridated water, new defintion ';
proc surveyfreq data=nh.merged_examined missing ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables eligible*fl_consumption_have/clwt row
;
run;
/* 28.0 % */

title 'RESULTS: Association between consumption of fluoridated (>0.5) tap water and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class  fl_consumption5 riagendr race  greenblack_tea ;
model ln_plasma_fluoride=   fl_consumption5 riagendr ridageyr race greenblack_tea 
/clparm solution vadjust=none;
run;

/* 3. Green and black tea separately */
title 'RESULTS: Black or green tea only and plasma fluoride, with mutual adjustment';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class black_tea riagendr race green_tea fl_consumption;
model ln_plasma_fluoride= black_tea riagendr ridageyr race 
 fl_consumption green_tea
/clparm solution vadjust=none;
run;

/* 4. RESULTS: Method of tea preparation */
title 'RESULTS: Tea by preparation type and plasma fluoride, with mutual adjustment';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class bottled_tea brewed_tea instant_tea riagendr race fl_consumption ;
model ln_plasma_fluoride= bottled_tea brewed_tea instant_tea riagendr ridageyr race 
fl_consumption 
/clparm solution vadjust=none;
run;


/* 5. 16-19 year old girls only */
title 'RESULTS: Green/black tea and plasma fluoride, 16-19 year old girls only';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible*age_cat2*riagendr;
class greenblack_tea race fl_consumption;
model ln_plasma_fluoride= greenblack_tea  ridageyr race 
fl_consumption 
/clparm solution vadjust=none;
run;


