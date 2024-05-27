%QUESTION 1 & 2

data = readtable('C:\Users\mboat\OneDrive - Georgia Institute of Technology\Desktop\JULIA\HW3BondS24.csv');

x = data.x;
y = data.y;

% Scatter plot
scatter(x, y);
xlabel("Age of the propellant (x, in weeks)", 'FontSize', 16); 
ylabel("Shear strength of the bond (y, in psi)", 'FontSize', 16); 
title('Scatter plot of: Shear strength of the bond vs Age of the propellant', 'FontSize', 18); 
grid on;
hold on; 

% Perform simple linear regression
X = [ones(length(x), 1) x]; 
b = X \ y; 

beta0_hat = b(1);
beta1_hat = b(2);

y_hat = X * b;
residuals = y - y_hat;
sigma_hat = sqrt(sum(residuals.^2) / (length(y) - 2));

se_beta0_hat = sigma_hat * sqrt(1 / length(x) + mean(x)^2 / sum((x - mean(x)).^2));
se_beta1_hat = sigma_hat / sqrt(sum((x - mean(x)).^2));

fprintf('Estimated coefficients:\n');
fprintf('beta0_hat: %.4f\n', beta0_hat);
fprintf('beta1_hat: %.4f\n', beta1_hat);
fprintf('sigma_hat: %.4f\n', sigma_hat);
fprintf('Standard error of beta0_hat: %.4f\n', se_beta0_hat);
fprintf('Standard error of beta1_hat: %.4f\n', se_beta1_hat);

x_fit = linspace(min(x), max(x), 100);
y_fit = beta0_hat + beta1_hat * x_fit; 
plot(x_fit, y_fit, 'r-', 'LineWidth', 2); % Plot the line of best fit

hold off; 


%%
%QUESTION 3
data = readtable('C:\Users\mboat\OneDrive - Georgia Institute of Technology\Desktop\JULIA\HW3BondS24.csv');

x = data.x;
y = data.y;

X = [ones(length(x), 1) x]; % Design matrix
b = X \ y; % Linear regression coefficients

y_hat = X * b;
residuals = y - y_hat;

% Standard deviation of the residuals
sigma = std(residuals);

% Standard errors of the coefficients
cov_matrix = inv(X' * X) * sigma^2;
se_b1 = sqrt(cov_matrix(2, 2));

n = length(x);
alpha = 0.01;
t_crit = tinv(1 - alpha/2, n - 2); % Critical value for 99% confidence

margin_of_error = t_crit * se_b1;
beta1 = b(2);

conf_interval = [beta1 - margin_of_error, beta1 + margin_of_error];

fprintf('β1: %.4f\n', beta1);
fprintf('se(β1): %.4f\n', se_b1);
fprintf('99%% confidence interval for β1: [%.4f, %.4f]\n', conf_interval(1), conf_interval(2));


%%
%QUESTION 4
data = readtable('C:\Users\mboat\OneDrive - Georgia Institute of Technology\Desktop\JULIA\HW3BondS24.csv');

x = data.x;
y = data.y;

X = [ones(length(x), 1) x]; % Design matrix
b = X \ y; % Linear regression coefficients

y_hat = X * b;
residuals = y - y_hat;
sigma = std(residuals);
cov_matrix = inv(X' * X) * sigma^2;
se_b1 = sqrt(cov_matrix(2, 2));

beta1 = b(2);
t_statistic = beta1 / se_b1;

n = length(x);
alpha = 0.01;
t_crit = tinv(1 - alpha/2, n - 2); % Two-tailed test

fprintf('β1: %.4f\n', beta1);
fprintf('se(β1): %.4f\n', se_b1);
fprintf('t-statistic: %.4f\n', t_statistic);
fprintf('Critical t-value: ±%.4f\n', t_crit);

%%
%QUESTION 5
data = readtable('C:\Users\mboat\OneDrive - Georgia Institute of Technology\Desktop\JULIA\HW3BondS24.csv');
x = data.x;
y = data.y;

X = [ones(length(x), 1) x]; % Design matrix
b = X \ y; % Linear regression coefficients

y_hat = X * b;
residuals = y - y_hat;
sigma = std(residuals);
cov_matrix = inv(X' * X) * sigma^2;
se_b0 = sqrt(cov_matrix(1, 1));
se_b1 = sqrt(cov_matrix(2, 2));

t_beta0 = b(1) / se_b0;
t_beta1 = b(2) / se_b1;

n = length(x);
df = n - 2;

p_value_beta0 = 2 * (1 - tcdf(abs(t_beta0), df));
p_value_beta1 = 2 * (1 - tcdf(abs(t_beta1), df));

fprintf('β0: %.4f\n', b(1));
fprintf('se(β0): %.4f\n', se_b0);
fprintf('t-statistic for β0: %.4f\n', t_beta0);
fprintf('p-value for β0: %.4f\n', p_value_beta0);

fprintf('β1: %.4f\n', b(2));
fprintf('se(β1): %.4f\n', se_b1);
fprintf('t-statistic for β1: %.4f\n', t_beta1);
fprintf('p-value for β1: %.4f\n', p_value_beta1);
