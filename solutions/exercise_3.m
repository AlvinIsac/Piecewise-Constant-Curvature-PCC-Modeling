
%% Exercise 3
% Multi-segment arm

%% Clean workspace
clear
clc
hold off

%% Desired radius and angle 
r = [0.3,0.5,0.4]; % [m]
theta = deg2rad([80, 30, 70]); % [rad]
phi =  deg2rad([30, 90, 270]); % [rad]

%% (TO FILL) 
% Create a function or an anonymous func computing the trasformation matrix
p = @(k,s) [(1/k)*(1-cos(k*s)); 0; (1/k)*sin(k*s)];
Ry = @(k,s) [cos(k*s), 0, sin(k*s); 0, 1, 0; -sin(k*s), 0, cos(k*s)];
Rz = @(a) [cos(a), -sin(a), 0; sin(a), cos(a), 0; 0, 0, 1];

T_inplane = @(R,p)[[R;[0,0,0]],[p;1]]
T_rot = @(R)[[R;[0,0,0]],[0;0;0;1]]

% Compute the points on the arc by using the arc parameters
points = struct([]); 
axes = struct([]);
T_prev = eye(4,4); 
for i = 1:3
    x = [];
    k = 1/r(i);
    l = theta(i)*r(i);
    step = l/100;
    for s = 0:step:l 
        T = T_prev * T_rot(Rz(phi(i))) * T_inplane(Ry(k,s),p(k,s));
        x = [x; T(1:3,end)'];     
    end
    T_prev = T_prev * T_rot(Rz(phi(i))) * T_inplane(Ry(k,l),p(k,l)) * T_rot(Rz(-phi(i)));
    axes{i}.nx = T_prev(1:3,1);
    axes{i}.ny = T_prev(1:3,2);
    axes{i}.nz = T_prev(1:3,3);
    points{i} = x;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Drawing section
scaling_factor = 0.1; % Affects the size of the frames

% Draw base frame
draw_frame([1,0,0],[0,1,0],[0,0,1],[0,0,0],scaling_factor)
hold on
% Draw arc
draw_arc(points{1},'c')
draw_arc(points{2},'m')
draw_arc(points{3},'y')
% Draw the frame the end of the arc
draw_frame(axes{1}.nx,axes{1}.ny,axes{1}.nz,points{1}(end,:),scaling_factor)
draw_frame(axes{2}.nx,axes{2}.ny,axes{2}.nz,points{2}(end,:),scaling_factor)
draw_frame(axes{3}.nx,axes{3}.ny,axes{3}.nz,points{3}(end,:),scaling_factor)
axis equal
