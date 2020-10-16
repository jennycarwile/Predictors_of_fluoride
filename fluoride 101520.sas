%include '\\UserData\Users\jcarwile\Fluoride\SAS programs\fluoride_formats.sas';


data nh.merged_examined;
set nh.merged_diet;

/******************************************************/
/**************** SURVEY VARIABLES ********************/
/******************************************************/

/* restrict to MEC-examined participants  */
/* https://www.cdc.gov/nchs/tutorials/dietary/Downloads/mod21%20task3%20SAS.sas */
where ridstatr=2 ;

/* 1 obs coded as DR1DRSTZ=1, but missing all diet data (see original_merge file for more details) */
if seqn=89592 then do;
wtdrd1=0;
dr1drstz=2;
end;

/* determine eligibility */
     if ridageyr=. or ridageyr<6 or ridageyr>=20 then eligible_a=1;
else if lbdpfl=.                                 then eligible_a=2;
else if lbdwfl=.                                 then eligible_a=3;
else if DR1DRSTZ =2                              then eligible_a=4;
else                                                  eligible_a=5;

/* create overall eligibility variable to use in domain statement */
if eligible_a=5 then eligible=1;
else                 eligible=0;


/* determine eligibility for fluoride drops/tabs analyses, which are restricted to 6-15 year olds */
     if ridageyr=. or ridageyr<6 or ridageyr>=16 then eligible_b=1;
else if lbdpfl=.                                 then eligible_b=2;
else if lbdwfl=.                                 then eligible_b=3;
else if DR1DRSTZ =2                              then eligible_b=4;
else                                                  eligible_b=5;

/* create overall eligibility variable to use in domain statement for fluoride drops analyses */
if eligible_b=5 then eligible_tabs=1;
else                 eligible_tabs=0;

/* contruct 4-year dietary weights */
if sddsrvyr in (8,9) then diet4yr=1/2*WTDRD1;

/******************************************************/
/****************** DEMOGRAPHICS **********************/
/******************************************************/

/* 1a. Age categories */
     if  6=<ridageyr<9   then age_cat=4;
else if  9=<ridageyr<12  then age_cat=3;
else if 12=<ridageyr<15  then age_cat=2;
else if 15=<ridageyr=<19 then age_cat=1;

/* 1b. Age categories, 2 */
     if   6=<ridageyr<11   then age_cat2=3;
else if  11=<ridageyr<16   then age_cat2=2;
else if  16=<ridageyr<=19  then age_cat2=1;

/* 2. Sex */
     if riagendr=2 then male=0;
else if riagendr=1 then male=1;

/* 3. Race/ethnicity */
     if ridreth3 =6       then race=1;
else if ridreth3 in (1,2) then race=2;
else if ridreth3=4        then race=3;
else if ridreth3=3        then race=4;
else if ridreth3=7        then race=5;
else                           race=.;

/* 4. Income to poverty ratio */
if INDFMPIR ne . then do;
income_poverty_pct=INDFMPIR*100;
end;
else income_poverty_pct=.;

     if    .<income_poverty_pct<100  then income_poverty_cat=1;
else if  100<=income_poverty_pct<200 then income_poverty_cat=2;
else                                      income_poverty_cat=3;


/******************************************************/
/******************* ORAL HEALTH **********************/
/******************************************************/

/* 1. Recent visit to dentist */
     if ohq030=1                then recent_dentist=1;
else if ohq030 in (2,3,4,5,6,7) then recent_dentist=2;
else if ohq030 in (77,99)       then recent_dentist=.;

/* 2a. Ever fluoride drops or tablets, '13-'14 */
if sddsrvyr=8 then do;
        if ohq580=1 or  ohq565=1 then fluoride_supp=1; /* Yes */
   else if ohq580=2 and ohq565=2 then fluoride_supp=2; /* No */
   else                               fluoride_supp=.;
end;

if sddsrvyr=8 and fluoride_supp=1 then do;
        if OHQ575G=2 or OHQ590G=2               then current_fluoride_supp=1;
   else if OHQ575G in(7,9) and OHQ590G in (7,9) then current_fluoride_supp=.;
   else                                              current_fluoride_supp=2;
end;

     if sddsrvyr=8 and fluoride_supp=2 then current_fluoride_supp=2; /* never users are not current users */
else if sddsrvyr=8 and fluoride_supp=. then current_fluoride_supp=.;

/* 2b. Ever fluoride drops or tablets, '15-'16 */
if sddsrvyr=9 then do;
        if OHQ566=1 then fluoride_supp=1;
   else if OHQ566=2 then fluoride_supp=2;
   else                  fluoride_supp=.;
end;

/* 3. Current fluoride drops/tablets */
if sddsrvyr=9 and fluoride_supp=1 then do; /* ever took fluoride drops */
     if ohq576g=2        then current_fluoride_supp=1; /* still taking supps */
else if ohq576g in (7,9) then current_fluoride_supp=.; /* missing data on when stopped */
else if ohq576g=1        then current_fluoride_supp=2;
end;

     if sddsrvyr=9 and fluoride_supp=2 then current_fluoride_supp=2; /* never users are not current users */
else if sddsrvyr=9 and fluoride_supp=. then current_fluoride_supp=.;


/* 4. Amount of toothpaste, categories */
     if ohq849=1 then amt_paste=1;
else if ohq849=2 then amt_paste=0.5;
else if ohq849=3 then amt_paste=0.25;
else if ohq849=4 then amt_paste=0.125;
else                  amt_paste=.;

     if ohq849=1 then amt_paste_cat=1;
else if ohq849=2 then amt_paste_cat=2;
else if ohq849=3 then amt_paste_cat=3;
else if ohq849=4 then amt_paste_cat=4;
else                  amt_paste_cat=.;

/* 5. Categories of brushing */

if ohq848q <10 then do; /* exclude refused and missing */
brush_amt=ohq848q;
end;
else brush_amt=.;

     if brush_amt=1  then brush_amt_cat=4;
else if brush_amt=2  then brush_amt_cat=3; 
else if brush_amt=3  then brush_amt_cat=2; 
else if brush_amt>=4 then brush_amt_cat=1; 
else brush_amt_cat=.;


/******************************************************/
/***************** PLASMA FLUORIDE ********************/
/******************************************************/

/* 1. Log-transform plasma fluoride */
if lbdpfl ne . then do;
ln_plasma_fluoride=log(lbdpfl);      
end;
else lbdpfl=.;


/******************************************************/
/******************* TAP WATER ************************/
/******************************************************/

/* 1. Tap water source */
     if DR1TWS in (91,99) then water_source=.;
else if DR1TWS =2         then water_source=1;
else if DR1TWS =3         then water_source=2;
else if DR1TWS =4         then water_source=3;
else if DR1TWS =1         then water_source=4;

if dr1tws in (1,2,3) then water_source_alt=dr1tws;
else water_source_alt=.;

/* 2. Drink any tap water (report in results text */
     if dr1_330z=0 then any_tapwater=0;
else if dr1_330z>0 then any_tapwater=1;
else                    any_tapwater=.;

/* 3. Create eligibility variable for restricting analyses to tap water consumers */
if eligible=1 and any_tapwater=1 then eligible_tap=1;
else                                  eligible_tap=0;

/* 4. Use in Figure 2: Categorize intake of FL tap water (g) into servings */
if lbdwfl>=0.7 and any_tapwater=1 then do; /* fluoridated water and drinks tap */
cont_fl_tap=dr1_330z; /* continuous fluoridated tap water, grams */
cups_fl_water=dr1_330z/236.59; /* 9/24/20: continuous fluoridated tap water, cups */
     if        dr1_330z =0      then fl_water_cat=1;
else if      0<dr1_330z<=236.59 then fl_water_cat=2; /* g in a cup of water */
else if 236.59<dr1_330z<=473.18 then fl_water_cat=3;
else if 473.18<dr1_330z<=709.77 then fl_water_cat=4;
else if 709.77<dr1_330z         then fl_water_cat=5;
else                                 fl_water_cat=1;
end;
else do;
fl_water_cat=1;
cont_fl_tap=0;
cups_fl_water=0;
end;/* non tapwater drinkers and all with unfluoridated tap part of reference */

/* Use in Figure 2: Fluoride consumer, amount consumed, trend variable */
     if fl_water_cat=1 then fl_trend=0;
else if fl_water_cat=2 then fl_trend=136.43;
else if fl_water_cat=3 then fl_trend=314.64;
else if fl_water_cat=4 then fl_trend=524.07;
else if fl_water_cat=5 then fl_trend=1040.1;

/* 5. 9/28/20 continuous water fluoride (mg/L)(report association of continuour water fluoride and plasma fluoride in results text) */
if any_tapwater=1 then do;
cont_water_fl=lbdwfl;
end;
else cont_water_fl=0;

/* 6. For use in Figure 3: categorize tap water fluoride around EPA optimal fluoridation levels */
     if   .< lbdwfl eq .  then epa_optimal=.;
else if      lbdwfl< 0.3  then epa_optimal=1;
else if 0.3<=lbdwfl< 0.7  then epa_optimal=2;
else if 0.7<= lbdwfl<=1.2 then epa_optimal=3;
else if 1.2 <lbdwfl       then epa_optimal=4;

/* trend variable */
     if epa_optimal=1 then epa_optimal_trend=0.128605;
else if epa_optimal=2 then epa_optimal_trend=0.547354;
else if epa_optimal=3 then epa_optimal_trend=0.791013;
else if epa_optimal=4 then epa_optimal_trend=1.559730;


/* 7. recent ingestion of fluoridated tap water */
if any_tapwater=1 then do;
     if      lbdwfl=.   then fl_consumption=.;
else if    .<lbdwfl<0.7 then fl_consumption=2;
else if 0.7=<lbdwfl     then fl_consumption=1;
end;
else if any_tapwater=0  then fl_consumption=2;
else if any_tapwater=.  then fl_consumption=.;


/* 8. Presence of fluoridated tap water */
     if      lbdwfl=.   then fl_exposure=.;
else if    .<lbdwfl<0.7 then fl_exposure=2;
else if 0.7=<lbdwfl     then fl_exposure=1;

/* 9. recent ingestion of fluoridated tap water >0.5 mg/L */
if any_tapwater=1 then do;
     if      lbdwfl=.   then fl_consumption5=.;
else if    .<lbdwfl<0.5 then fl_consumption5=2;
else if 0.5=<lbdwfl     then fl_consumption5=1;
end;
else if any_tapwater=0  then fl_consumption5=2;
else if any_tapwater=.  then fl_consumption5=.;

/* having fluoridated tap water >0.5 mg/L */
     if      lbdwfl=.   then fl_consumption_have=.;
else if    .<lbdwfl<0.5 then fl_consumption_have=2;
else if 0.5=<lbdwfl     then fl_consumption_have=1;


/******************************************************/
/********************** DIET **************************/
/******************************************************/

/* 1. GB TEA VOLUME */
/* create trend variable for gb tea volume using median value of each category*/
     if portion_cups_cat=0 then trend_volume=0;
else if portion_cups_cat=1 then trend_volume=0.64;
else if portion_cups_cat=2 then trend_volume=1.37;
else if portion_cups_cat=3 then trend_volume=2.29;
else if portion_cups_cat=4 then trend_volume=4.19;

format eligible eligible_tabs  fluoride_supp_new yn.
fluoride_supp current_fluoride_supp recent_dentist  fl_consumption yn_alt.
sddsrvyr sddsrvyr.
riagendr gender. male male.
race race. ridreth3 ridreth.
age_cat age_cat. age_cat2 age_catb.
income_poverty_cat income_poverty_cat.

eligible_a eligible.
epa_optimal epa_optimal.
fl_water_cat tap_water_cat.
water_source  water_source.
ohq849 amt_paste_cat toothpaste.
brush_amt_cat brush_amt_cat.
dr1tws dr1tws.
LBDPFLLC LBDWFL lod.

;

label eligible             = 'Eligible'
      diet4yr              = '4-yr weight'
	  epa_optimal          = 'EPA optimal fluoridation of tap water'
	  recent_dentist       = 'Dentist within past 6 months'
	  fluoride_supp        = 'Ever given prescription fluoride drops/tablets' 
	  brush_amt            = 'Number of times per day brush teeth'
	  amt_paste            = 'Amount of toothpaste'
	  ln_plasma_fluoride   = 'Ln transformed plasma fluoride'
	  lbdpfllc             = 'Plasma fluoride <LOD (0.25 nmol)'
	  lbdwfllc			   = 'Water fluoride <LOD (0.1 mg/L)'
;
run;



/**************************************************************************************/
/* TREND TEST */
title 'CALCULATE MEDIAN VALUE FOR EACH CATEGORY OF FL_WATER_CAT FOR USE IN TREND TEST';
proc surveymeans data=nh.merged_examined median ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
var dr1_330z;
domain eligible*fl_water_cat;
run;


title 'CALCULATE MEDIAN VALUE FOR EACH CATEGORY OF GB TEA';
proc surveymeans data=nh.merged_examined median ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
domain eligible*portion_cups_cat;
var portion_cups 
;
run;

title 'CALCULATE MEDIAN VALUE FOR EACH CATEGORY OF WATER FLUORIDATION FOR USE IN TREND TEST';
proc surveymeans data=nh.merged_examined median ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
var lbdwfl;
domain eligible*epa_optimal;
run;

/*****************************************************************************/