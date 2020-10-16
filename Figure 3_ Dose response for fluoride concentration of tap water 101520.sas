

title 'FIGURE 3: fluoride concentration of tap water and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible_tap;
class epa_optimal  riagendr race;
model ln_plasma_fluoride= epa_optimal greenblack_tea riagendr ridageyr race 
/clparm solution vadjust=none;
run;

title 'FIGURE 3: TEST FOR TREND volume fluoridated water and plasma fluoride';
proc surveyreg data=nh.merged_examined nomcar;
strata sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible_tap;
class  riagendr race   ; 
model ln_plasma_fluoride= epa_optimal_trend greenblack_tea riagendr ridageyr race  
/clparm solution vadjust=none;
run;

title 'Footnote: n in each fluoride category';
proc surveyfreq data=nh.merged_examined ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables eligible_tap*epa_optimal
/cl row;
run;