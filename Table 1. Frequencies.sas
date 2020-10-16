%include '\\UserData\Users\jcarwile\Fluoride\fluoride_formats.sas';

title 'Table 1. Frequencies';
proc surveyfreq data=nh.merged_examined  missing ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible*age_cat eligible*riagendr eligible*race eligible*income_poverty_cat
eligible*recent_dentist  eligible_tabs*current_fluoride_supp 
eligible*brush_amt_cat eligible*amt_paste 
eligible*dr1tws eligible*water_source  eligible*fl_exposure eligible*fl_consumption
eligible*grapes_new eligible*grape_foods  eligible*chicken_nuggets_new  eligible*shellfish_new 
eligible*greenblack_tea eligible*any_other_tea eligible*coffee_new 
eligible*fruit_juice_new
/cl row;
run;
/* **SEE EXCEL FOR RECALCULATED WEIGHTED ROW PERCENTS FOR VARIABLES WITH MISSINGS */