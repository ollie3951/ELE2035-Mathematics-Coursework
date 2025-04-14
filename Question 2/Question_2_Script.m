% MATLAB script for ELE2035 coursework Question 2
clear
clc

% (a) generating 100 000 realisations of R
P = 10; % constant given in question
M = 2; % constant given in question
% creating empty 100000 element column vector to hold R values:
R_M2 = zeros([100000 1]);
for realisationNum = 1:100000 % repeat this loop 100 000 times
    % creating independent standard normal RVs hm1 and hm2
    hm1 = randn([M 1]);
    hm2 = randn([M 1]);
    % defining the vector h
    h = (1 / sqrt(2))*hm1+(sqrt(-1)/sqrt(2))*hm2;
    norm_h = norm(h); % find the norm/length of h
    % add the R value calculated for this iteration to the R array:
    R_M2(realisationNum, 1) = log2(1+P*(norm_h)^2);
end
clear realisationNum % remove indexing variable from workspace



% (b) finding the mean value of R
mean_R_M2 = mean(R_M2);




% (c) plotting the CDF of R
figure(Name='Q2(c)'); % individual plot to show CDF when M = 2
cdfplot(R_M2) % plot the CDF of R when M=5
% improving plot readability
xlabel('R (bits/s/Hz)')
ylabel('CDF')
title('CDF of Achievable Rate R Plotted Over R for M=2')


% (d) Finding system outage probabilty, P(R<1)
outage_probability_M2 = sum(R_M2<1)/length(R_M2);
% find the total number of R values less than 1, and divide by total number
% of R values to give the probability that R is less than 1

% outage probabilty is extremely small, between 0.4-0.5%, so the system is
% very unlikely to enter outage making it well designed since the
% achievable rate is very rarely less than 1


% (e) repeating with M = 50 value
P = 10; % constant given in question
M = 50; % constant given in question
% creating empty 100000 element column vector to hold R values:
R_M50 = zeros([100000 1]);
for realisationNum = 1:100000 % repeat this loop 100 000 times
    % creating independent standard normal RVs hm1 and hm2
    hm1 = randn([M 1]);
    hm2 = randn([M 1]);
    % defining the vector h
    h = (1 / sqrt(2))*hm1+(sqrt(-1)/sqrt(2))*hm2;
    norm_h = norm(h); % find the norm/length of h
    % add the R value calculated for this iteration to the R array:
    R_M50(realisationNum, 1) = log2(1+P*(norm_h)^2);
end
clear realisationNum % remove indexing variable from workspace
figure(Name='Q2(e)'); % individual plot to show CDF when M = 50
cdfplot(R_M50); % plot the CDF of R when M=50
% improving plot readability
xlabel('R (bits/s/Hz)'); ylabel('CDF'); title('CDF of Achievable Rate R Plotted Over R for M=50');

% comparison with M=2: both have a CDF characteristic of a normally
% distributied RV, so the instantaneous achievable rate seems to be normally distributed regardless of number of transmit antennae. However, the mean of R when M=50 is much larger indicating
% higher M (physically corresponding to more transmit antennae) makes a 
% a higher achievable rate more probable. This also makes it much less likely the system
% enters outage, since it is less probable R is less than 1. The CDF of
% M=50 is also much steeper, meaning there is less variability in the
% achievable rate making the system more predictable/reliable.


% finding the mean and outage probability for M = 50 for comparison
% with M=2:
mean_R_M50 = mean(R_M50);
outage_probability_M50 = sum(R_M50<1)/length(R_M50);
