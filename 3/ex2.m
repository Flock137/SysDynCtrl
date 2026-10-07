clear; clc; close all;

%% 1. Define System Matrices
A = [0,  0,  1,    0;
     0,  0,  0,    1;
    -30, 10, -1.6, 1.6;
     5, -5,  0.8, -0.8];

B = [0, 0;
     0, 0;
     2, 0;
     0, 1];

C = [1, 0, 0, 0;
     0, 0, 1, 0];

D = [0, 0;
     0, 0];

%% 2. Create State-Space Model
sys = ss(A, B, C, D);

%% 3. Define Simulation Parameters
t = 0:0.01:10;       % Time vector from 0 to 10s with 0.01s step
x0 = [0; 0; 0; 0];   % Initial conditions (x(0)=0, x_dot(0)=0)

%% 4. Define Inputs for Each Case
% The inputs must be a matrix where Column 1 is F1 and Column 2 is F2

% Case 1: F1 = 0, F2 = 1
u1 = zeros(length(t), 2);
u1(:, 1) = 0;       % F1
u1(:, 2) = 1;       % F2

% Case 2: F1 = 1, F2 = 1
u2 = zeros(length(t), 2);
u2(:, 1) = 1;       % F1
u2(:, 2) = 1;       % F2

% Case 3: F1 = sin(2t), F2 = 1
u3 = zeros(length(t), 2);
u3(:, 1) = sin(2*t); % F1
u3(:, 2) = 1;        % F2

%% 5. Plot
cases = {u1, 'Case 1: F1=0, F2=1'; 
         u2, 'Case 2: F1=1, F2=1'; 
         u3, 'Case 3: F1=sin(2t), F2=1'};

for i = 1:size(cases, 1)
    u = cases{i, 1};
    title_str = cases{i, 2};
    
    % Run simulation using lsim
    % y = outputs, t_out = time, x = states
    [y, t_out, x] = lsim(sys, u, t, x0);
    
    % --- Plotting ---
    figure('Name', title_str, 'Position', [100, 100, 800, 600]);
    
    % Plot Inputs
    subplot(3,1,1);
    plot(t, u(:,1), 'r', 'LineWidth', 1.5); hold on;
    plot(t, u(:,2), 'b', 'LineWidth', 1.5);
    title(['Inputs: ' title_str]);
    legend('F_1', 'F_2');
    ylabel('Force');
    grid on;
    
    % Plot States (x1, x2, x3, x4)
    subplot(3,1,2);
    plot(t_out, x(:,1), 'LineWidth', 1.5); hold on;
    plot(t_out, x(:,2), 'LineWidth', 1.5);
    plot(t_out, x(:,3), 'LineWidth', 1.5);
    plot(t_out, x(:,4), 'LineWidth', 1.5);
    title('States');
    legend('x_1', 'x_2', 'x_3', 'x_4');
    ylabel('State Values');
    grid on;
    
    % Plot Outputs (y1, y2)
    subplot(3,1,3);
    plot(t_out, y(:,1), 'LineWidth', 1.5); hold on;
    plot(t_out, y(:,2), 'LineWidth', 1.5);
    title('Outputs (Positions)');
    legend('y_1 = x_1', 'y_2 = x_2');
    xlabel('Time (s)');
    ylabel('Position');
    grid on;
end