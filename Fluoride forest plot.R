
library(forestplot)
library(ggplot2)

fluoride<-
  structure(list(
    mean  = c(NA, NA,  -7.7, -16.9, -11.5,  5.1, NA, -10.3, -2.3,  -11.2,  -9.4, NA,  1.4, -0.8, NA, NA, NA,  1.8,   4.1,  -6.0, -8.8,  35.5, NA, NA, 41.7,   6.4,  0.6,  3.7,  3.6,  7.8,  5.1, NA, NA, -0.7, NA,     0,  -1.3,  -0.7, NA,  1.3,  9.1,   7.0, -12.2),
    lower = c(NA, NA, -14.4, -21.4, -16.8,  1.2, NA, -19.6, -12.4, -22.3, -19.9, NA, -3.9, -8.2, NA, NA, NA, -6.1, -11.0, -17.8, -31.4,   22, NA, NA, 26.7, -18.2, -4.4, -3.8, -5.5, -3.2, -2.3, NA, NA, -6.5, NA, -12.6, -12.4, -13.7, NA, -3.6,    0, -13.5,   -32),
    upper = c(NA, NA,   0.6, -12.2,  -5.8,  9.1, NA,  -0.1,   9.0,  1.4,   2.3,  NA,  6.9,  7.3, NA, NA, NA, 10.3,  21.8,   7.6,  21.4, 50.5, NA, NA, 58.4,   38.4,  6.0, 11.9,   13.7, 20, 13, NA, NA,  5.5, NA,  14.4,   11.1,  14.1, NA,  6.4, 18.9,  32.3,  13.4)),
    .Names = c("mean", "lower", "upper"),
    row.names = c(NA, -43L),
    class = "data.frame")
    
    tabletext<-cbind(
    c("Demographics",
      "Age (vs. 6 to <9 y)", "  9 to <12 y", "  12 to <15 y", "  15 to 19 y",
      "Male (vs. female)",
      "Race/ethnicity (vs. non-Hispanic white)", "  Hispanic", "  Non-Hispanic Black", "  Asian", "  Other",
      "Income to poverty ratio, FPL, % (vs. <100)", "  100 to <200", "  \u2265  200", NA,
      "Drinking water characteristics", "Water source (vs. don't drink tap water)", "  Community water", "  Well/cistern", "  Don't know", "  Spring",
      "Recent consumption of fluoridated water", NA,
      "Diet", "Green/black tea", "Any other tea", "Juice", "Grapes/raisins", "Shellfish", "Coffee", "Chicken patties and nuggets", NA,
      "Oral health behaviors", "Recent dentist visit", "Amount of toothpaste used (vs. smear)", "  Pea sized", "  Half load", "  Full load", 
      "Frequency of toothbrushing (vs. 1 time/day)", "  2 times/day", "  3 times/day", "  4+ times/day", "Current use of fluoride supplements"))
  

   fluoride_plot<- forestplot(tabletext,
               fluoride, new_page=TRUE,
               is.summary=c(TRUE, rep(FALSE, 14), TRUE, rep(FALSE, 7), TRUE, rep(FALSE,8), TRUE, rep(FALSE, 10)), # change bold, etc
               clip=c(-20,50),
               xlog=FALSE,
               boxsize=0.2,
               txt_gp = fpTxtGp(cex=0.5, xlab=gpar(cex=0.5), ticks = gpar(cex=.5),),
               xlab="Average percent change (95% CI) in plasma fluoride",
               xticks=c(-20,-10 ,0, 10, 20, 30, 40, 50),
              vertices=TRUE)
    
   png(file = 'fluoride_plot.png')
   fluoride_plot<- forestplot(tabletext,
                              fluoride, new_page=TRUE,
                              is.summary=c(TRUE, rep(FALSE, 14), TRUE, rep(FALSE, 7), TRUE, rep(FALSE,8), TRUE, rep(FALSE, 10)), # change bold, etc
                              clip=c(-20,50),
                              xlog=FALSE,
                              boxsize=0.2,
                              txt_gp = fpTxtGp(cex=0.5, xlab=gpar(cex=0.5), ticks = gpar(cex=.5),),
                              xlab="Average percent change (95% CI) in plasma fluoride",
                              xticks=c(-20,-10 ,0, 10, 20, 30, 40, 50),
                              vertices=TRUE)
   dev.off() 