
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

% Compute the points on the arc by using the arc parameters
points = struct([]); 
axes = struct([]);
T_prev = % to fill 
for i = 1:3
    x = [];
    k = % to fill
    l = % to fill
    step = l/100;
    for s = 0:step:l 
        T = % to fill
        x = % to fill
    end
    T_prev = % to fill
    axes{i}.nx = % to fill
    axes{i}.ny = % to fill
    axes{i}.nz = % to fill
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
