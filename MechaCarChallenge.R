library(dplyr)
library(tidyverse)

# DELIVERABLE 1

# Read Data
MechaCar_data <- read.csv(file='MechaCar_mpg.csv', stringsAsFactors = F, check.names = F)

#Perform Linear Regression
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data = MechaCar_data)

#Summary pf p values and coefficients
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data = MechaCar_data))

# Draw plots for statistically significant variables
model1 <- lm(mpg~vehicle_length,data = MechaCar_data)
yvals <- model1$coefficients['vehicle_length']*MechaCar_data$vehicle_length+model1$coefficients['(Intercept)']
plt <-ggplot(MechaCar_data, aes(x=vehicle_length,y=mpg))
plt +geom_point()+geom_line(aes(y=yvals),color='red')

model2 <- lm(mpg~ground_clearance,data = MechaCar_data)
yvals <- model2$coefficients['ground_clearance']*MechaCar_data$ground_clearance+model2$coefficients['(Intercept)']
plt <-ggplot(MechaCar_data, aes(x=ground_clearance,y=mpg))
plt +geom_point()+geom_line(aes(y=yvals),color='red')

# DELIVERABLE 2

#Read Data
Suspension_data <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#Total Summary
total_summary <- Suspension_data %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Lot Summary
lot_summary <- Suspension_data %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# DELIVERABLE 3

# t-test for total 
t.test(x=Suspension_data$PSI, mu=1500)
# t-test for Lot1
lot1_psi = subset(Suspension_data, Manufacturing_Lot=='Lot1')
t.test(x=lot1_psi$PSI, mu= 1500)

# t-test for Lot2
lot2_psi = subset(Suspension_data, Manufacturing_Lot=='Lot2')
t.test(x=lot2_psi$PSI, mu= 1500)

# t-test for Lot3
lot3_psi = subset(Suspension_data, Manufacturing_Lot=='Lot3')
t.test(x=lot3_psi$PSI, mu= 1500)
