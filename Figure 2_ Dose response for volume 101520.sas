%include '\\UserData\Users\jcarwile\Fluoride\SAS programs\fluoride_formats.sas';


/*************************************************************************************/
title 'FIGURE: Volume of fluoridated water consumption and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class fl_water_cat portion_cups_cat riagendr race;
model ln_plasma_fluoride= fl_water_cat portion_cups_cat riagendr ridageyr race 
/clparm solution vadjust=none;
run;

title 'FIGURE: TEST FOR TREND volume fluoridated water and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class portion_cups_cat riagendr race   ; /* model as a continuous variable */
model ln_plasma_fluoride= fl_trend portion_cups_cat riagendr ridageyr race  
/clparm solution vadjust=none;
run;

/*************************************************************************************/
title 'FIGURE. Model 3: Amount of green/black tea and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class portion_cups_cat riagendr race fl_water_cat ;
model ln_plasma_fluoride= portion_cups_cat riagendr ridageyr race  fl_water_cat
/clparm solution vadjust=none;
run;

title 'FIGURE: TEST FOR TREND amount of green/black tea and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible;
class  riagendr race fl_water_cat  ; 
model ln_plasma_fluoride= trend_volume riagendr ridageyr race  fl_water_cat
/clparm solution vadjust=none;
run;

/******************************************************************************************/

title 'Figure: Ns for footnote';
proc surveyfreq data=nh.merged_examined missing ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible*fl_water_cat 
eligible*portion_cups_cat
/clwt row
;
run;
