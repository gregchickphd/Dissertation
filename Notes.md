Policy change happened in Jan 2015 with 65 universities, 5 power conferences (Big 12, SEC, PAC 12, ACC, Big 10)

Division 1 
  -Football Bowl Subdivision (FBS) - 135 schools
  -Football Championship Subdivision (FCS) - 126 schools
  -Division I-non football
Division 2

Variables for covariate balance:
  -Public/private
  -% Pell
  -% over 25
  -Median rent for a 1-bedroom apartment within the zipcode of university - US Department of House and Urban Development's Office of Policy Development and Research
  -% in-state
  
Used inverse propensity weighting
  -Logistic regression to calculate conditional probability that institution received treatment (COA change) given 2011-2012 values
  -Dropped universities with a propensity score outside the common support criteria
  -Used propensity scores to create weights

Pretreatment period: 2011-2012 through 2014-2015
Post-treatment period: 2015-2016 to present

Data from IPEDS:
  -Miscellaneous expenses
  
Used Prais-Winsten technique to adjust standard errors for autocorrelation and panel heteroskedasticity
Inflation adjusted all $ figures to latest year
Variables were log transformed

Practical design experiments
  -Find out if/when non-autonomous schools implemented COA stipends
  -Instead of COA as outcome, grades? Average amount borrowed? Cohort default? 
