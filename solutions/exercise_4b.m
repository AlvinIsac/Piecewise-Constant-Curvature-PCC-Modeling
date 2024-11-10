
%% Exercise 4.a


%% Clean workspace
clear
clc

load('ex4_b_data');

%% Load tip position and orientation
x = data.x;
nz = data.nz;

%% (TO FILL) Compute arc parameters (should match the ones in exercise 2.a-c)
theta = acos((nz'*[0;0;1]));
phi = atan( data.x(2) / data.x(1) );
Rz = @(a) [cos(a), -sin(a), 0; sin(a), cos(a), 0; 0, 0, 1];
T_rot = @(R)[[R;[0,0,0]],[0;0;0;1]];
x_rot = T_rot(Rz(-phi))*[x;1];
x_rot(4) = [];
r = x_rot(1)/(1-cos(theta));

%% Display the values
k = 1/r;
l = theta/k;
disp([k, l, phi])
