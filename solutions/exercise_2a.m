
%% Exercise 2
% Draw a 3-D arc

%% Clean workspace
clear
clc
hold off

%% Desired radius and angle 
r = 0.3; % [m]
theta = deg2rad(80); % [rad]
phi =  deg2rad(20); % [rad]

%% (TO FILL) 
% Create a function or an anonymous func computing the trasformation matrix T
p = @(r,theta) [r*(1-cos(theta)); 0; r*sin(theta)];
Ry = @(a) [cos(a), 0, sin(a); 0, 1, 0; -sin(a), 0, cos(a)];
Rz = @(a) [cos(a), -sin(a), 0; sin(a), cos(a), 0; 0, 0, 1];

T_inplane = @(R,p)[[R;[0,0,0]],[p;1]]
T_rot = @(R)[[R;[0,0,0]],[0;0;0;1]]

% Compute the points on the arc by varying the angle
x = []; % points of the sampled arc in the format x1,y1,z1;x2,y2,z2;...
for t = 0:deg2rad(1):theta % sampling steps of 1 degree
    T = T_rot(Rz(phi)) * T_inplane(Ry(t),p(r,t));
    x = [x; T(1:3,end)'];     
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (TO FILL) 
% Compute the orientation of the frame at the end of the arc. Then, retrieve nx, ny, nz i.e. the axes of the frame
T = T_rot(Rz(phi)) * T_inplane(Ry(theta),p(r,theta));
nx = T(1:3,1);
ny = T(1:3,2);
nz = T(1:3,3);

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