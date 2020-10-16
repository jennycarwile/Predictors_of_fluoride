%include '\\UserData\Users\jcarwile\Fluoride\SAS programs\fluoride_formats.sas';


title 'Tea drinkers vs non-tea drinker, categorical';
proc surveyfreq data=nh.merged_examined ;
stratum sdmvstra;
cluster sdmvpsu;
weight diet4yr;
tables 
eligible*greenblack_tea*age_cat 
eligible*greenblack_tea*riagendr 
eligible*greenblack_tea*race 
eligible*greenblack_tea*income_poverty_cat 
eligible*greenblack_tea*dr1tws 
eligible*greenblack_tea*fl_consumption
eligible*greenblack_tea*any_other_tea
eligible*greenblack_tea*fruit_juice_new
eligible*greenblack_tea*grapes_new
eligible*greenblack_tea*shellfish_new 
eligible*greenblack_tea*coffee_new 
eligible*greenblack_tea*chicken_nuggets_new
eligible*greenblack_tea*recent_dentist 
eligible*greenblack_tea*amt_paste 
eligible*greenblack_tea*brush_amt_cat
eligible_tabs*greenblack_tea*current_fluoride_supp 
/cl row;
run;