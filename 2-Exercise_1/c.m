%% Part (c): Plot y(x,t) for t = 0,1,2,3
figure('Name', 'Part (c)');

% Define x vector from 0 to 2
x = 0:0.01:2;

% Define the t values to loop over
t_vals = [0, 1, 2, 3];
colors = lines(length(t_vals)); % Get distinct colors for plotting

hold on;
for i = 1:length(t_vals)
    t_current = t_vals(i);
    % Calculate y(x,t)
    y = exp(-2*x) .* cos(t_current + x);
    
    % Plot each line
    plot(x, y, 'Color', colors(i,:), 'LineWidth', 1.5, ...
         'DisplayName', sprintf('t = %d', t_current));
end
hold off;

% Formatting
xlabel('x');
ylabel('y(x,t)');
title('Plot of y(x,t) = e^{-2x} cos(t+x) for various t');
legend('Location', 'best');
grid on;