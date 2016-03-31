%% Constants
rho_SL = 1.225;   % kg/m^3
rho_SC = 0.78205; % kg/m^3
mu_SL = 1.8E-5;   % Nm/s^2
mu_SC = 1.65E-5;  % Nm/s^2
T_SL = 288.2;     % K
T_SC = 259.2;     % K
service_ceiling = 4450;

k = 1.4;          % Ratio of specific heats Air = 1.4
R = 287;
v_sound_SL = sqrt(k*R*T_SL);
v_sound_SC = sqrt(k*R*T_SC);

%% Cessna 177 Specs
b = 10.82; % m
S = 16.2; % m^2
c = 1.4972; % m
W_empty = 680; % kg
W_max = 1100;

V_cruise = 63.791; % m/s or 124 knots, 130 kmh
V_max  = 69.9644;  % m/s or 136 knots, 250 kmh

%% Reynolds Number
Re_max_SL = rho_SL*V_max*c/mu_SL;
Re_max_SC = rho_SC*V_max*c/mu_SC;
Re_cruise_SL = rho_SL*V_cruise*c/mu_SL;
Re_cruise_SC = rho_SC*V_cruise*c/mu_SC;

%% AIRFOIL DATA
%placeholders; testing github
CL_max = 1;
CL_min = 1;

%% V-n diagram
V_dive = 1.5*V_cruise;
V_stall_pos = sqrt(2*W_max/(CL_max*rho_SL*S));
V_stall_neg = sqrt(2*W_max/(CL_min*rho_SL*S));

e = 0.79;
CL_alpha = Cl_alpha/(1+Cl_alpha/(pi*AR*e));

V = linspace(0,200,1000);    % Velocity range from 0 to 200 m/s
pos_stall_curve_SL = rho_SL*CL_max/(2*W_max)*V.^2;
pos_stall_curve_SC = rho_SC*CL_max/(2*W_max)*V.^2;
neg_stall_curve_SL = rho_SL*CL_min/(2*W_max)^V.^2;
neg_stall_curve_SC = rho_SC*CL_min/(2*W_max)*V.^2;
n_limit = 4.4*ones(1,1000);
n_proof = 1.25*n_limit;
n_ultimate = 1.5*n_limit;
