# Rocket-Motor-Linear-Regression-Analysis-
Shear strength of the bond vs Age of the propellant
This MATLAB script performs a simple linear regression analysis on a dataset. The dataset contains two variables: the age of the propellant (x, in weeks) and the shear strength of the bond (y, in psi). The goal of the analysis is to model the relationship between these two variables.

Here's a step-by-step description of what the script does:

Reads a CSV file named 'HW3BondS24.csv' into a table using the readtable() function. The file is located in a specific path on the user's computer.

Extracts the 'x' and 'y' columns from the table and stores them in the variables x and y, respectively.

Creates a scatter plot of the 'y' values against the 'x' values. The x-axis is labeled "Age of the propellant (x, in weeks)" and the y-axis is labeled "Shear strength of the bond (y, in psi)". The title of the plot is "Scatter plot of: Shear strength of the bond vs Age of the propellant".

Performs a simple linear regression of 'y' on 'x' using the \ operator. This operator solves the system of linear equations X * b = y for b, where X is a matrix with a column of ones and a column of 'x' values.

Extracts the estimated intercept (beta0_hat) and slope (beta1_hat) of the regression line from b.

Calculates the fitted values (y_hat) and the residuals of the regression.

Estimates the standard deviation of the residuals (sigma_hat), which is a measure of the variability of the residuals.

This script provides a basic analysis of the relationship between the age of the propellant and the shear strength of the bond. The scatter plot visualizes this relationship, and the linear regression quantifies it. The residuals and their standard deviation provide information about the fit of the regression line to the data.

![fig32 (1)](https://github.com/MichaelBoateng/Rocket-Motor-Linear-Regression-Analysis-/assets/47555566/079f227a-a6f5-40b1-8b62-4f222f761422)
