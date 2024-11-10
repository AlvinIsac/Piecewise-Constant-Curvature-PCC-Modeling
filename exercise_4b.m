
%% Exercise 4.a


%% Clean workspace
clear
clc

load('ex4_b_data');

%% Load tip position and orientation
x = data.x;
nz = data.nz;

%% (TO FILL) Compute arc parameters (should match the ones in exercise 2.a-c)
theta = % to fill
phi = % to fill
r = % to fill

%% Display the values
k = 1/r;
l = theta/k;
disp([k, l, phi])
