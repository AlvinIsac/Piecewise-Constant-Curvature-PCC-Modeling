
%% Exercise 2.c
% Draw a 3-D arc using the arc parameters

%% Clean workspace
clear
clc
hold off

%% Desired radius and angle 
r = 0.3; % [m]
theta = deg2rad(80); % [rad]
phi =  deg2rad(20); % [rad]

%% (TO FILL) 
% Create a function or an anonymous func computing the trasformation matrix

% Compute the points on the arc by using the arc parameters
x = []; % points of the sampled arc in the format x1,y1,z1;x2,y2,z2;...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (TO FILL) 
% Compute the orientation of the frame at the end of the arc. Then, retrieve nx, ny, nz i.e. the axes of the frame
nx = % to fill
ny = % to fill
nz = % to fill

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Drawing section
scaling_factor = 0.05; % Affects the size of the frames

% Draw base frame
draw_frame([1,0,0],[0,1,0],[0,0,1],[0,0,0],scaling_factor)
hold on
% Draw arc
draw_arc(x,'c')
% Draw the frame the end of the arc
draw_frame(nx,ny,nz,x(end,:),scaling_factor)
axis equal
