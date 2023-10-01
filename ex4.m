% Exercice 4: Beampattern of MVDR Beamformer

close all; clc; clear all;

% The number of sensors
N = 10;

% Wavelengh
lambda = 10e-9;

% Sensor spacing
d = lambda/2;

% Resolution in x axis
R = 400;

% u-space
u_max = 1;
u = linspace(-u_max, u_max, R)';
[u_mat, n_mat] = meshgrid(u, 0:N-1);

% Array manifold vector
v = exp(1j.*n_mat.*(2*pi*d/lambda).*u_mat);

% Steering direction
u0 = 0;

% Interferers
u1 = 0.27;
u2 = 0.004;

v0 = exp(1j*2*pi*d/lambda*(0:N-1)'*u0);
v1 = exp(1j*2*pi*d/lambda*(0:N-1)'*u1);
v2 = exp(1j*2*pi*d/lambda*(0:N-1)'*u2);

% Interference-to-noise ratio (INR)
inr = 70;

% Definition of the covariance
sigma_1 = sqrt(db2mag(inr));
sigma_w = 1;

% Noise covariance matrix
S = sigma_w^2*eye(N) + sigma_1^2*(v1*v1');

% Weight of the MVDR beamformer
w0 = (S^(-1) * v0) / (v0' * S^(-1) * v0);

% Powerpattern
B = v' * w0;

figure();
plot(u, mag2db(abs(B)));
xline(0.3,'--r','u1 = 0.3', 'LabelOrientation', 'horizontal', 'LineWidth', 1);
title("MVDR beamformer for u1 = 0.3");
xlabel("u");
ylabel("B_u");
ylim([-40, 0]);
grid on;


% Noise covariance matrix
S = sigma_w^2*eye(N) + sigma_1^2*(v2*v2');

% Weight of the MVDR beamformer
w0 = (S^(-1) * v0) / (v0' * S^(-1) * v0);

% Powerpattern
B = v' * w0;

figure();
plot(u, mag2db(abs(B)));
xline(0.004,'--r','u1 = 0.004', 'LabelOrientation', 'horizontal', 'LineWidth', 1);
title("MVDR beamformer for u1 = 0.004");
xlabel("u");
ylabel("B_u");
ylim([max(mag2db(abs(B)))-40, max(mag2db(abs(B)))]);
grid on;


