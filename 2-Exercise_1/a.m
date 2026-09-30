%% Part (a)
clear; clc;
syms x(t) t

% --- ODE 1 ---
ode1 = diff(x, t, 2) + 4*diff(x, t) + 4*x == exp(-t);
% Solve general solution
x1_general = dsolve(ode1);
% Get derivative
Dx1 = diff(x1_general, t);
% Apply Initial Conditions: x(0)=1 and x'(0)=1  
eqns1 = [subs(x1_general, t, 0) == 1, subs(Dx1, t, 0) == 1];
% Solve for constants C1, C2
S1 = solve(eqns1, [sym('C1'), sym('C2')]);
% Substitute constants back into general solution
x1_sol = subs(x1_general, [sym('C1'), sym('C2')], [S1.C1, S1.C2]);
disp('Solution 1:'); pretty(x1_sol)


% --- ODE 2 ---
ode2 = diff(x, t, 2) + 4*x == t;
x2_general = dsolve(ode2);
Dx2 = diff(x2_general, t);
eqns2 = [subs(x2_general, t, 0) == 0, subs(Dx2, t, 0) == 1];
S2 = solve(eqns2, [sym('C1'), sym('C2')]);
x2_sol = subs(x2_general, [sym('C1'), sym('C2')], [S2.C1, S2.C2]);
disp('Solution 2:'); pretty(x2_sol)


% --- ODE 3 ---
ode3 = diff(x, t, 2) + x == sin(t);
x3_general = dsolve(ode3);
Dx3 = diff(x3_general, t);
eqns3 = [subs(x3_general, t, 0) == 1, subs(Dx3, t, 0) == 0];
S3 = solve(eqns3, [sym('C1'), sym('C2')]);
x3_sol = subs(x3_general, [sym('C1'), sym('C2')], [S3.C1, S3.C2]);
disp('Solution 3:'); pretty(x3_sol)


% --- ODE 4 ---
ode4 = diff(x, t, 2) + 4*diff(x, t) + 3*x == 2*exp(-3*t);
x4_general = dsolve(ode4);
Dx4 = diff(x4_general, t);
eqns4 = [subs(x4_general, t, 0) == 0, subs(Dx4, t, 0) == -1];
S4 = solve(eqns4, [sym('C1'), sym('C2')]);
x4_sol = subs(x4_general, [sym('C1'), sym('C2')], [S4.C1, S4.C2]);
disp('Solution 4:'); pretty(x4_sol)