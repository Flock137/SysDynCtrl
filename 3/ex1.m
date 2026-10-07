clear; clc; close all;

tspan = [0 10];     % Time span from 0 to 10 seconds
y0 = [0; 0];        % Initial conditions: [x(0); x_dot(0)] = [0; 0]

% Call ode45, passing the function handle @sys_ode, time span, and initial conditions
[t, y] = ode45(@sys_ode, tspan, y0);

% y(:,1) contains the position x over time
% y(:,2) contains the velocity x_dot over time
x = y(:, 1);

figure('Name', 'Problem 1: Position vs Time');
plot(t, x, 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Position x');
title('Position x vs. Time (F(t) = sin(t), x(0)=0, x\_dot(0)=0)');
grid on;

function dydt = sys_ode(t, y)
    % y(1) = x (position)
    % y(2) = x_dot (velocity)
    
    % Define the input force F(t)
    F = sin(t);
    
    % Define the derivatives
    dx_dt = y(2);                               % derivative of position is velocity
    dv_dt = 0.5*F - 0.25*y(2) - 5*y(1);         % derivative of velocity (acceleration)
    
    % Return the column vector of derivatives
    dydt = [dx_dt; dv_dt];
end