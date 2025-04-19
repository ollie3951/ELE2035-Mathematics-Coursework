% MATLAB script for ELE2035 coursework Question 1
clear
clc

% importing the given MATLAB workspace file. Ensure the workspace file is in the
% same folder as this script
load('coursework_data_x.mat');

% (a) finding mean, variance, and skewness of x.
mean_x = mean(x);
var_x = var(x);
skewness_x = skewness(x);
% skewness is 2.0579, indicating the probability distribution for x is
% positively skewed.
% The variance of x is high relative to the mean,
% indicating that x is very random as it is likely to take on values far
% from the mean???

% (b) P(0<=x<=1)
pb = (sum(x<=1)-sum(x<0))/length(x);
% counts how many samples have values that are less than or equal to 1, subtracts the
% number of samples with values less than zero, thus giving total number samples with
% values in interval [0, 1.0]. This number is then divided by total number of
% samples, giving the probability a sample value lies in this interval.

% (c) plotting PDF of x
binwidth = 0.1; % defining interval widths for the histogram
xRange = [-5:binwidth:20]; % defining points for histogram x-axis
N = hist(x, xRange); % counts the number of x samples with values in each bin
figure(Name='Q1(c)'); % generate a figure just showing the PDF of x over x
% plotting the probability of an x sample being in each bin over x to give 
% a good approximation of the PDF of x:
plot(xRange, N./(binwidth*length(x)), LineWidth=1.5);
% improving graph readability:
xlabel('x')
ylabel('PDF')
title('PDF of x Plotted Over x')

% (d) comparing PDF of x with PDF of equal mean exponentially distributed RV
binwidth = 0.1; % defining interval widths for the histogram
xRange = [-5:binwidth:20]; % defining points for histogram x-axis
N = hist(x, xRange); % counts the number of x samples with values in each bin

figure(Name='Q1(d)'); % generate a separate figure for comparing PDF of x to exponential distribution
hold on
plot(xRange, N./(binwidth*length(x)), LineWidth=1.5); % plot PDF of x again
% generate the PDF of an exponentially distributed RV with the same mean as x, evaluated at the same 
% points as the PDF of x:
expRV_pdf = exppdf(xRange, mean(x)); 
% plot the PDF of the exponentially distributed RV on the same axes as the PDF of x:
plot(xRange, expRV_pdf, LineWidth=2, LineStyle="--");
% improving readability of the plot
legend('PDF of x','PDF of exponentially distributed RV')
title('Comparing PDF of x with PDF of Exponentially Distributed RV of Equal Mean')
xlabel('x')
ylabel('PDF')

% from this, we can see that x follows an exponential distribution, with
% small variations likely due to randomness of the RV x, and which would likely become
% less significant if sample size is increased.

% (e) Checking correlation between x and y
load("coursework_data_y.mat"); % ensure file is in same folder as script
% creating a scatter plot of y over x:
figure(Name='Q1(e)'); % new figure to show the scatter plot
hold on
scatter(x, y); % creating scatter plot with x on x-axis and y on y-axis
% improving readability of the plot
xlabel('x');
ylabel('y');
title('Scatter Plot to Show Correlation Between y and x');
lsline; % adding a line of best fit
legend('Sample data', 'Best fit line', Location='southeast')
% finding covariance and correlation coefficent
covariance_xy = cov(x, y);
rho_xy = corrcoef(x, y);

% from both the scatter plot, and the correlation coefficient close to +1,
% we can see that x and y have a strong positive linear correlation.