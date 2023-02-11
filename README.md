# MechaCar_Statistical_Analysis
## Description
Three analyses are performed:
1. Linear Regression to predict MPG
2. Summary Statistics on Suspension Coils
3. T-Tests on Suspension Coils

## Linear Regression to predict MPG
Linear regression is run on the [MechaCar_mpg.csv](MechaCar_mpg.csv) data. Specifically, multiple linear regression is run to predict `mpg` from `vehicle_length`, `vehicle_weight`, `spoiler_angle`, `ground_clearance` and `AWD`. The following are the results of the regression analysis:

```
Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11
```

1. The variables that provide a non-random amount of variance to `mpg` are `vehicle_length` and `ground_clearance`. This is due to their p-values, both of which are less than 0.000. Their coefficients are approximately 6.267 and 3.546 respectively. Additionally, `AWD` might look like it significantly affects the model with a coefficient of -3.411. However the p-value is 0.1852, which is too high. A closer look at the dataset reveals `AWD` to be binary qualitative data. 1 or 0 is used to encode true or false for AWD.

2. The slope of the model is *not* considered to be 0 because there is at least one coefficient that has a significantly low p-value.

3. Due to the r<sup>2</sup> value of ~0.7, the predictions of this model aren't completely awful, but are far from ideal. The predictions could be good enough to guide further research questions, but are not effective enough to predict precise values for `mpg`.

As can be seen the p-values are below 0.000 for the `vehicle_length` and `ground_clearance` coefficients. The r<sup>2</sup> value is 0.7149 suggesting that this is a reasonable regression to predict `mpg`. However, given the p-value below 0.000 for the intercept, this suggests that there are many factors upon which `mpg` is dependent that are not within this analysis.

## Summary Statistics on Suspension Coils
The following are the summary statistics for the suspension coil data:

![resources/total_summary.png](resources/total_summary.png)

Given the standard deviation we can see that 95% of the data range from ~1483 psi to ~1515 psi. However, when we examine the data when grouped by manufacturing lot, we find

![resources/lot_group_summary.png](resources/lot_group_summary.png)

Going from lots 1 to 3, we see a progression of a larger and larger variances and standard deviations. Given these statistics, we should turn to the manufacturing design specifications that the variance in psi should not exceed 100 psi. Manufacturing lots 1 and 2, having variance of ~0.98 and ~7.47 fall well within this specification. However, lot 3, with a variance of ~170.29 psi, do not. Further investigation is warranted into this manufacturing lot.

## T-Tests on Suspension Coils
We assume a population mean of 1500 psi for suspension coils and run a T-test for the mean of the data in [Suspension_Coil](Suspension_Coil.csv) against this assumed population mean. 

- H<sub>0</sub> : There is no difference in means between these data and the population mean.
- H<sub>a</sub> : There *is* a difference in means between these data and the population mean.

We find:

```
One Sample t-test

data:  susp_coil$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 
```

Given a p-value of ~0.06, we fail to reject H<sub>0</sub>.

### T-test on each lot
When we run a T-test on each lot of the Suspension Coil data, we find:

Lot 1:
```
One Sample t-test

data:  lot1$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 
```

Lot 2:
```
One Sample t-test

data:  lot2$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 
```

Lot 3:

```
One Sample t-test

data:  lot3$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14
```
There are p-values of 1, 0.6072, and 0.04168 for manufacturing lots 1, 2, and 3 respectively. We would fail to reject H<sub>0</sub> for lots 1 and 2. But we reject H<sub>0</sub> for lot 3. This makes sense given what we saw in the previous summary statistics of these data: lot 3 had a significant variance, and the true mean of the psi of the suspension coils in that lot are significantly different from the population mean of 1500 psi.

## Study Design: MechaCar vs. Competition
