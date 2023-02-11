# import dplyr library
library(dplyr)

################################################################################
### MechCar Multiple Regression to predict MPG
################################################################################

# import MechaCar data
MechaCar_mpg <- read.csv('MechaCar_mpg.csv')

# Run Linear Regression Model to predict mpg based on all other variables
lm_mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,MechaCar_mpg)
summary(lm_mpg)

################################################################################
### Summary Statistics on Regression Coils
################################################################################

# impport suspension data
susp_coil <- read.csv('Suspension_Coil.csv')

# Get mean, median, variance, and standard deviation of PSI in susp_coil
total_summary <- summarize(susp_coil,Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Get the same summary statistics grouped by Maunfacturing_Lot
lot_summary <- summarize(susp_coil,Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .by = Manufacturing_Lot )

################################################################################
### T-Tests on Suspension Coils
################################################################################

# run t-test on susp_coil with assumed 1500 psi population mean
t.test(susp_coil$PSI,mu=1500)

# filter susp_coil according to manufacturing lot
lot1 <- subset(susp_coil,Manufacturing_Lot == 'Lot1')
lot2 <- subset(susp_coil,Manufacturing_Lot == 'Lot2')
lot3 <- subset(susp_coil,Manufacturing_Lot == 'Lot3')

# run t-test on each manufacturing lot against assumed population mean of 1500
# Lot 1
t.test(lot1$PSI,mu=1500)

#Lot 2
t.test(lot2$PSI,mu=1500)

# Lot 3
t.test(lot3$PSI,mu=1500)
