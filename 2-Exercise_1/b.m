%% Part (b): Plot functions x1 and x2
figure('Name', 'Part (b)');

% Define time vector from 0 to 5 with small increments
t = 0:0.01:5;

% Calculate functions (use dot operators for element-wise math)
x1 = 0.8 * exp(-2*t/3) .* sin(2*t);
x2 = exp(-t/3) .* sin(3*t);

% Plot
plot(t, x1, 'b-', 'LineWidth', 1.5); hold on;
plot(t, x2, 'r--', 'LineWidth', 1.5);
hold off;

% Formatting
xlabel('t');
ylabel('x(t)');
title('Plot of x_1 and x_2');
legend('x_1 = 0.8e^{-2t/3} sin(2t)', 'x_2 = e^{-t/3} sin(3t)');
grid on;