
%% Exercise 4.a


%% Clean workspace
clear
clc

%% Load tip position and orientation
load('ex4_a_data');
x = data.x;
nz = data.nz;

%% (TO FILL) Compute arc parameters (should match the one in exercise 1.a)
theta = % to fill
r = % to fill

%% Display the values
k = 1/r;
l = theta/k;
disp([1/r, l])