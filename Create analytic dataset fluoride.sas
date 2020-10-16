/* 2015-2016 */
libname XP_A xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\DEMO_I.xpt";
libname XP_B xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\DR1IFF_I.xpt";
libname XP_C xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\DRXFCD_I.xpt";
libname XP_D xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\FASTQX_I.xpt";
libname XP_E xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\FLDEP_I.xpt";
libname XP_F xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\FLDEW_I.xpt";
libname XP_G xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\ohq_I.xpt";
libname XP_H xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\dr1tot_I.xpt";
libname XP_I xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\smq_I.xpt";
libname XP_J xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\smqfam_I.xpt";
libname XP_K xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\bmx_I.xpt";
libname XP_KK xport "\\UserData\Users\jcarwile\Fluoride\temp_1516\biopro_I.xpt";


proc copy in=xp_a out=nh; run;
proc copy in=xp_b out=nh; run;
proc copy in=xp_c out=nh; run;
proc copy in=xp_d out=nh; run;
proc copy in=xp_e out=nh; run;
proc copy in=xp_f out=nh; run;
proc copy in=xp_g out=nh; run;
proc copy in=xp_h out=nh; run;
proc copy in=xp_i out=nh; run;
proc copy in=xp_j out=nh; run;
proc copy in=xp_k out=nh; run;
proc copy in=xp_kk out=nh; run;


/* Merge*/
proc sort data=nh.demo_i;   by seqn; run;
proc sort data=nh.fastqx_i; by seqn; run; 
proc sort data=nh.fldep_i;  by seqn; run;
proc sort data=nh.fldew_i;  by seqn; run;
proc sort data=nh.ohq_i;    by seqn; run;
proc sort data=nh.dr1tot_i; by seqn; run;
proc sort data=nh.smq_i;    by seqn; run;
proc sort data=nh.smqfam_i; by seqn; run;
proc sort data=nh.bmx_i; 	by seqn; run;
proc sort data=nh.biopro_i; by seqn; run;
/* waiting on: DR1IFF_I,, DRXFCD_I */ 

data nhanes_1516;
merge nh.demo_i nh.fastqx_i nh.fldep_i nh.fldew_i nh.ohq_i 
nh.dr1tot_i (keep=seqn dr1_320z dr1_330z dr1bwatz dr1tws dr1tkcal dr1tcalc dr1tcaff wtdrd1)
nh.smq_i nh.smqfam_i nh.bmx_i
nh.biopro_i;
by seqn;
run;

/* SEQN=89592 shows up as missing all food variables
  -wtdrd1 and dr1drdstz are found in dr1tot_i, dr1iff_i
  -in dr1tot_i has a wtdrd1 positive weight and dr1drdstz=1 **but all diet vars missing **
  -not in dr1iff_h at all
  -->re-assign weight to 0 and recall status to not reliable
*/

*proc print data=nh.ds1ids_i;
*where seqn eq 89592;
*var seqn wtdrd1 dr1drstz;
*run;

/* 2013-2014 */
libname XP_L xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\DEMO_H.xpt";
libname XP_M xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\DR1IFF_H.xpt";
libname XP_N xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\DRXFCD_H.xpt";
libname XP_O xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\FASTQX_H.xpt";
libname XP_P xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\FLDEP_H.xpt";
libname XP_Q xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\FLDEW_H.xpt";
libname XP_R xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\ohq_H.xpt";
libname XP_S xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\dr1tot_H.xpt";
libname XP_T xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\smq_H.xpt";
libname XP_U xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\smqfam_H.xpt";
libname XP_V xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\bmx_H.xpt";
libname XP_W xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\biopro_H.xpt";
libname XP_X xport "\\UserData\Users\jcarwile\Fluoride\temp_1314\ds1ids_H.xpt"; /* dont include in merge */

proc copy in=xp_l out=nh; run;
proc copy in=xp_m out=nh; run;
proc copy in=xp_n out=nh; run;
proc copy in=xp_o out=nh; run;
proc copy in=xp_p out=nh; run;
proc copy in=xp_q out=nh; run;
proc copy in=xp_r out=nh; run;
proc copy in=xp_s out=nh; run;
proc copy in=xp_t out=nh; run;
proc copy in=xp_u out=nh; run;
proc copy in=xp_v out=nh; run;
proc copy in=xp_w out=nh; run;
proc copy in=xp_x out=nh; run;



/* Merge*/
proc sort data=nh.demo_h;   by seqn; run;
proc sort data=nh.fastqx_h; by seqn; run; 
proc sort data=nh.fldep_h;  by seqn; run;
proc sort data=nh.fldew_h;  by seqn; run;
proc sort data=nh.ohq_h;    by seqn; run;
proc sort data=nh.dr1tot_h; by seqn; run;
proc sort data=nh.smq_h;    by seqn; run;
proc sort data=nh.smqfam_h; by seqn; run;
proc sort data=nh.bmx_h;    by seqn; run;
proc sort data=nh.biopro_h; by seqn; run;


data nhanes_1314;
merge nh.demo_h  nh.fldep_h nh.fldew_h nh.ohq_h 
nh.dr1tot_h (keep=seqn dr1_320z dr1_330z dr1bwatz dr1tws dr1tkcal dr1tcalc dr1tcaff wtdrd1)
nh.smq_h nh.smqfam_h nh.bmx_h nh.biopro_h ;
by seqn;
run;


/* Concatonate */
data nh.merged;
set nhanes_1516 nhanes_1314;
run;

proc contents data=nh.merged; run;

/***************************************************************************/
/* 1. FLUORIDE FROM NUTRIENT SUPPLEMENT FILE */
/* As of 9/24/19, only available for 13-14 cycle */
data supps;
set nh.ds1ids_h (keep=seqn dsdsupp dsdsupid);
if index(dsdsupp,'FLUORIDE')>=1 then fluoride_supp_new=1;
else fluoride_supp_new=0;
run;

proc freq data=supps;
tables fluoride_supp_new;
run;

proc freq data=supps;
table dsdsupp dsdsupid;
where fluoride_supp_new=1;
run;

proc transpose data=supps out=fluoride_supp_new (drop=_name_);
by seqn;
var fluoride_supp_new;
run;

data fluoride_supp_new (keep=seqn fluoride_supp_new);
set fluoride_supp_new;
fluoride_supp_new=sum(of col1-col20);
if fluoride_supp_new>1 then fluoride_supp_new=1;
run;
/***************************************************************************/
/************************************************************************/
/* SET UP */

*DATA usda.new_foodcats_1516;
*set WORK.WWEIA1516_FOODCAT_FNDDS_0000;
*run; 

*DATA usda.new_foodcats_1314;
*set WORK.WWEIA1314_FOODCAT_FNDDS;
*run; 


data dr1iff_i (keep=seqn drxfdcd dr1icalc dr1icaff dr1ikcal dr1igrms dr1_040z);
set nh.dr1iff_i (rename=(DR1ifdcd= drxfdcd));
run;

data dr1iff_h (keep=seqn  drxfdcd dr1icalc dr1icaff dr1ikcal dr1igrms dr1_040z);
set nh.dr1iff_h (rename=(DR1ifdcd= drxfdcd));
run;

proc sort data=dr1iff_h; by drxfdcd; run;
proc sort data=dr1iff_i; by drxfdcd; run;




*data usda.new_foodcats_1516 (drop=food_code);
*set usda.new_foodcats_1516 (rename=(food_code=drxfdcd));
*run;

*data usda.new_foodcats_1314 (drop=food_code);
*set usda.new_foodcats_1314 (rename=(food_code=drxfdcd));
*run;

proc sort data=usda.new_foodcats_1516;      by drxfdcd; run;
proc sort data=usda.new_foodcats_1314;      by drxfdcd; run;


data usda_nhanes_merge_new_1314;
merge dr1iff_h (in=a) usda.new_foodcats_1314;
by drxfdcd;
if a ;
run;

*data usda.new_foodcats_1516;
*length v1 $194.;
*set usda.new_foodcats_1516 (rename=(food_code_description=v1));
*run;


data usda_nhanes_merge_new_1516;
merge dr1iff_i (in=a) usda.new_foodcats_1516 (rename=(v1=food_code_description));
by drxfdcd;
if a ;
run;

/* concatonate */
data usda_nhanes_merge_new;
set usda_nhanes_merge_new_1516 usda_nhanes_merge_new_1314;
run;
/************************************************************************/
proc sort data=usda_nhanes_merge_new; by seqn; run;

data merged3 (rename=
		(tea_new			=tea_new_cont 
		greenblack_tea		=greenblack_tea_cont 
 		green_tea			=green_tea_cont 
		black_tea			=black_tea_cont 
		herbal_tea			=herbal_tea_cont 
		any_other_tea		=any_other_tea_cont	
		bottled_tea			=bottled_tea_cont		
		brewed_tea			=brewed_tea_cont	
		instant_tea			=instant_tea_cont 
		coffee_new			=coffee_new_cont 
		grapes_new			=grapes_new_cont 
		shellfish_new		=shellfish_new_cont 
		fruit_juice_new		=fruit_juice_new_cont	 
		chicken_nuggets_new	=chicken_nuggets_new_cont 
		tap_water			=tap_water_cont)
	drop= food_code_description other_tea) ; 
set usda_nhanes_merge_new;

food_code_description_new=upcase(food_code_description);

/* 1. Tea, any */
if category_description='Tea' then tea_new	=dr1igrms;
else tea_new=0;

/* 1a. Tea, green/black */
if tea_new >0 then do;
if index(food_code_description_new, 'HERBAL')>=1 
OR index(food_code_description_new, 'HIBISCUS')>=1
or index(food_code_description_new, 'CHAMOMILE')>=1
/* or index(food_code_description_new, 'oolong')>=1 */ /* 8/20 19 */
or index(food_code_description_new, 'LEMONADE')>=1 then greenblack_tea=0;
else greenblack_tea	=dr1igrms;
end;
if tea_new=0 then greenblack_tea=0;

/* 1b. Tea, green */
if tea_new>0 then do;
if index(food_code_description_new, 'GREEN')>=1 then green_tea	=dr1igrms;
else green_tea=0;
end;
if tea_new=0 then green_tea=0;

/* 1c. Tea, black */
if tea_new>0 then do;
if index(food_code_description_new, 'BLACK')>=1 
OR index(food_code_description_new, 'CHAI')>=1 
then black_tea	=dr1igrms;
else black_tea=0;
end;
if tea_new=0 then black_tea=0;

/* 1d. Tea, herbal */
if tea_new>0 then do;
if index(food_code_description_new, 'HERBAL')>=1 
OR index(food_code_description_new, 'HIBISCUS')>=1
or index(food_code_description_new, 'CHAMOMILE')>=1
/* or index(food_code_description_new, 'OOLONG')>=1 */ /* 8/30/19 */
then herbal_tea	=dr1igrms;
else herbal_tea=0;
end;
if tea_new=0 then herbal_tea=0;

/* 1e. Tea, lemonade */
if tea_new>0 then do;
if index(food_code_description_new, 'LEMONADE')>=1 
then other_tea	=dr1igrms;
else other_tea=0;
end;
if tea_new=0 then other_tea=0;

/* 1f. Tea, lemonade/other */
if other_tea>0 or herbal_tea>0 then any_other_tea	=dr1igrms;
else any_other_tea=0;

/* 1g. Tea, bottled */
if greenblack_tea>0 then do;
if index(food_code_description_new, 'BOTTLED')>=1 then bottled_tea	=dr1igrms;
else bottled_tea=0;
end;
if greenblack_tea=0 then bottled_tea=0;

/* 1h. Tea, brewed */
if greenblack_tea>0 then do;
if index(food_code_description_new, 'BREWED')>=1 then brewed_tea	=dr1igrms;
else brewed_tea=0;
end;
if greenblack_tea=0 then brewed_tea=0;

/* 1i. Tea, instant */
if greenblack_tea>0 then do;
if index(food_code_description_new, 'INSTANT')>=1 then instant_tea	=dr1igrms;
else instant_tea=0;
end;
if greenblack_tea=0 then instant_tea=0;

/* 2 */
if category_description='Coffee' then coffee_new	=dr1igrms;
else coffee_new=0;

/* 3. Grapes */
if category_description='Grapes' then grapes_new	=dr1igrms;
else grapes_new=0;

/* 4 */
if category_description='Shellfish' then shellfish_new	=dr1igrms;
else shellfish_new=0;

/* 5 */
if category_description='Citrus juice' or category_description='Other fruit juice'
or category_description='Apple juice'
then fruit_juice_new	=dr1igrms;
else fruit_juice_new=0;

/* 6 */
if category_description='Chicken patties, nuggets and tenders' then chicken_nuggets_new	=dr1igrms;
else chicken_nuggets_new=0;

/* 7.  */
if category_description='Tap water' then tap_water	=dr1igrms;
else tap_water=0;

run;

proc sort data=merged3; by seqn; run;

proc sql;
create table example 
as select seqn
,sum(tea_new_cont				) as tea_new_cont
,sum(greenblack_tea_cont		) as greenblack_tea_cont		
,sum(green_tea_cont	         	) as green_tea_cont	
,sum(black_tea_cont	         	) as black_tea_cont
,sum(herbal_tea_cont	       	) as herbal_tea_cont	
,sum(any_other_tea_cont	        ) as any_other_tea_cont	
,sum(bottled_tea_cont	      	) as bottled_tea_cont		
,sum(brewed_tea_cont	       	) as brewed_tea_cont	
,sum(instant_tea_cont	       	) as instant_tea_cont
,sum(coffee_new_cont	      	) as coffee_new_cont
,sum(grapes_new_cont	      	) as grapes_new_cont
,sum(shellfish_new_cont	       	) as shellfish_new_cont
,sum(fruit_juice_new_cont	    ) as fruit_juice_new_cont	
,sum(chicken_nuggets_new_cont	) as chicken_nuggets_new_cont
,sum(tap_water_cont				) as tap_water_cont	

from merged3
group by
seqn
;
quit;



data nh.all_diet_new (drop=tea_new_cont greenblack_tea_cont green_tea_cont black_tea_cont herbal_tea_cont any_other_tea_cont	bottled_tea_cont		
brewed_tea_cont	instant_tea_cont coffee_new_cont grapes_new_cont shellfish_new_cont fruit_juice_new_cont	
 chicken_nuggets_new_cont tap_water_cont i);
set example (rename= (greenblack_tea_cont=gb_portion_grams));



array cont_foods{15} 
tea_new_cont gb_portion_grams green_tea_cont black_tea_cont herbal_tea_cont any_other_tea_cont	bottled_tea_cont		
brewed_tea_cont	instant_tea_cont coffee_new_cont grapes_new_cont shellfish_new_cont fruit_juice_new_cont chicken_nuggets_new_cont tap_water_cont;
array yn_foods{15}  tea_new greenblack_tea green_tea black_tea herbal_tea any_other_tea	bottled_tea		
brewed_tea	instant_tea coffee_new grapes_new shellfish_new fruit_juice_new	  chicken_nuggets_new tap_water;

do i=1 to 15;
if cont_foods{i}>=1 then yn_foods{i}=1; 
else if cont_foods{i}=0 then yn_foods{i}=0;
end;

if greenblack_tea=0 then do;
portion_cups=0;
portion_cups_cat=1;
end;

if greenblack_tea=1 then do;
portion_cups=gb_portion_grams/236.6; /* 236.6 g/cup water */
     if   portion_cups =0 then portion_cups_cat=1;
else if 0<portion_cups<=1 then portion_cups_cat=2;
else if 1<portion_cups<=2 then portion_cups_cat=3;
else if 2<portion_cups<=3 then portion_cups_cat=4;
else if 3<portion_cups    then portion_cups_cat=5;
end;

format tea_new greenblack_tea
green_tea black_tea herbal_tea any_other_tea bottled_tea brewed_tea instant_tea
coffee_new grapes_new  shellfish_new fruit_juice_new 
 chicken_nuggets_new tap_water food.
portion_cups_cat portion_cups_cat.;
run;


/* merge dietary files with non-diet file */
proc sort data=fluoride_supp_new;  by seqn; run;
proc sort data=nh.merged;          by seqn; run;
proc sort data=nh.all_diet_new;    by seqn; run;

data nh.merged_diet;
merge fluoride_supp_new nh.merged nh.all_diet_new;
by seqn;
run;