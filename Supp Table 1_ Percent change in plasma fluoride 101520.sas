
%include '\\UserData\Users\jcarwile\Fluoride\SAS programs\fluoride_formats.sas';

/**********************************************************************************/
/* MODEL 1: Unadjusted */

title 'Model 1: Age categories and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class age_cat;
model ln_plasma_fluoride= age_cat  
/clparm solution vadjust=none;
run;

title 'Model 1: Sex and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class male ;
model ln_plasma_fluoride= male 
/clparm solution vadjust=none;
run;

title 'Model 1: Race/ethnicity and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class race ;
model ln_plasma_fluoride= race  
/clparm solution vadjust=none;
run;

title 'Model 1: Income to poverty ratio and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class income_poverty_cat ;
model ln_plasma_fluoride= income_poverty_cat
/clparm solution vadjust=none;
run;

/* Tap water characteristics */
title 'Model 1: Water source and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class dr1tws;
model ln_plasma_fluoride= dr1tws/clparm solution vadjust=none;
run;

title 'Model 1: Fluoride consumption and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fl_consumption;
model ln_plasma_fluoride= fl_consumption/clparm solution vadjust=none;
run;

/* DIET */
title 'Model 1: Green/black tea and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class greenblack_tea;
model ln_plasma_fluoride= greenblack_tea /clparm solution vadjust=none;
run;

title 'Model 1: Other tea and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class any_other_tea;
model ln_plasma_fluoride= any_other_tea /clparm solution vadjust=none;
run;

title 'Model 1: Juice and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fruit_juice_new;
model ln_plasma_fluoride= fruit_juice_new /clparm solution vadjust=none;
run;

title 'Model 1:  Grapes and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class grapes_new;
model ln_plasma_fluoride= grapes_new /clparm solution vadjust=none;
run;

title 'Model 1: Shellfish and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class shellfish_new;
model ln_plasma_fluoride= shellfish_new /clparm solution vadjust=none;
run;

title 'Model 1: Coffee and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class coffee_new;
model ln_plasma_fluoride= coffee_new /clparm solution vadjust=none;
run;

title 'Model 1: Chicken nuggets and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class chicken_nuggets_new;
model ln_plasma_fluoride= chicken_nuggets_new /clparm solution vadjust=none;
run;

/* ORAL HEALTH */
title 'Model 1: Recent dentist and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class recent_dentist ;
model ln_plasma_fluoride= recent_dentist  
/clparm solution vadjust=none;
run;

title 'Model 1: Amount of toothpaste and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class amt_paste_cat;
model ln_plasma_fluoride= amt_paste_cat/clparm solution vadjust=none;
run;

title 'Model 1: Brushing frequency and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class brush_amt_cat;
model ln_plasma_fluoride= brush_amt_cat/clparm solution vadjust=none;
run;


title 'Model 1: Fluoride drops/tabs and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible_tabs;
class current_fluoride_supp;
model ln_plasma_fluoride= current_fluoride_supp /clparm solution vadjust=none;
run;


/*****************************************************************************************************/
/* MODEL 2: Adjusted for demographics and mutually adjusted for green/black tea and consumption of FL water */

title 'Model 2: Age categories and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class age_cat riagendr race fl_consumption greenblack_tea;
model ln_plasma_fluoride= age_cat riagendr race fl_consumption greenblack_tea
/clparm solution vadjust=none;
run;

title 'Model 2: Sex and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class male race fl_consumption greenblack_tea ;
model ln_plasma_fluoride= male ridageyr race fl_consumption greenblack_tea
/clparm solution vadjust=none;
run;

title 'Model 2: Race/ethnicity and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class race riagendr fl_consumption greenblack_tea;
model ln_plasma_fluoride= race  riagendr ridageyr  fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

title 'Model 2: Income to poverty ratio and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class income_poverty_cat riagendr race fl_consumption greenblack_tea ;
model ln_plasma_fluoride= income_poverty_cat riagendr ridageyr  race fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

/* Tap water consumption */
title 'Model 2: Tap water source and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class dr1tws riagendr race fl_consumption greenblack_tea ;
model ln_plasma_fluoride= dr1tws riagendr ridageyr race fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;


title 'Model 2: Fluoride consumption and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fl_consumption riagendr race greenblack_tea  ;
model ln_plasma_fluoride= fl_consumption riagendr ridageyr  race greenblack_tea 
/clparm solution vadjust=none;
run;

/* Diet */
title 'Model 2: Green/black tea and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class greenblack_tea riagendr race fl_consumption;
model ln_plasma_fluoride= greenblack_tea riagendr ridageyr race 
fl_consumption 
/clparm solution vadjust=none;
run;

title 'Model 2: Other tea and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class any_other_tea riagendr race fl_consumption greenblack_tea  ;
model ln_plasma_fluoride= any_other_tea riagendr ridageyr race 
 fl_consumption greenblack_tea
/clparm solution vadjust=none;
run;

title 'Model 2:  Juice and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fruit_juice_new riagendr race fl_consumption greenblack_tea ;
model ln_plasma_fluoride= fruit_juice_new riagendr ridageyr race 
fl_consumption greenblack_tea
/clparm solution vadjust=none;
run;

title 'Model 2: Grapes and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class grapes_new riagendr race fl_consumption greenblack_tea ;
model ln_plasma_fluoride= grapes_new riagendr ridageyr race 
 fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

title 'Model 2: Shellfish and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class shellfish_new riagendr race fl_consumption greenblack_tea;
model ln_plasma_fluoride= shellfish_new riagendr ridageyr race 
fl_consumption greenblack_tea
/clparm solution vadjust=none;
run;

title 'Model 2: Coffee and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class coffee_new riagendr race fl_consumption greenblack_tea;
model ln_plasma_fluoride= coffee_new riagendr ridageyr race 
 fl_consumption greenblack_tea
/clparm solution vadjust=none;
run;

title 'Model 2: Chicken nuggets and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class chicken_nuggets_new riagendr race fl_consumption greenblack_tea;
model ln_plasma_fluoride= chicken_nuggets_new riagendr ridageyr race 
 fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

/* Oral health */
title 'Model 2: Recent dentist and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class recent_dentist riagendr race fl_consumption greenblack_tea  ;
model ln_plasma_fluoride= recent_dentist riagendr ridageyr  race fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

title 'Model 2: Toothpaste amount and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class amt_paste_cat riagendr race  fl_consumption greenblack_tea ;
model ln_plasma_fluoride= amt_paste_cat riagendr ridageyr  race  fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

title 'Model 2: Brushing frequency and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class brush_amt_cat riagendr race fl_consumption greenblack_tea ;
model ln_plasma_fluoride= brush_amt_cat riagendr ridageyr race fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;

title 'Model 2: Fluoride drops/tabs and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible_tabs;
class current_fluoride_supp riagendr race fl_consumption  greenblack_tea  ;
model ln_plasma_fluoride= current_fluoride_supp riagendr ridageyr race fl_consumption greenblack_tea 
/clparm solution vadjust=none;
run;


