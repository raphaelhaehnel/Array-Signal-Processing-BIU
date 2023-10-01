% Exercice 4: Beampattern of MVDR Beamformer

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
u1 = linspace(0.001,0.5, R)';

v0 = exp(1j*2*pi*d/lambda*(0:N-1)'*u0);

% Interference-to-noise ratio (INR)
inr = 70;

% Definition of the covariance
sigma_1 = sqrt(db2mag(inr));
sigma_w = 1;

B_3D = zeros(R, R);

for i = 1:R
    v1 = exp(1j*2*pi*d/lambda*(0:N-1)'*u1(i));
    
    % Noise covariance matrix
    S = sigma_w^2*eye(N) + sigma_1^2*(v1*v1');
    
    % Weight of the MVDR beamformer
    w0 = (S^(-1) * v0) / (v0' * S^(-1) * v0);
    
    % Powerpattern
    B_3D(:, i) = v' * w0;


end

figure();
% Magnitude of the beampattern ine the u-space
imagesc(u1, u, mag2db(abs(B_3D)));
title("Beampattern for INR=70");
xlabel("u_1");
ylabel("u");
clim([-40, 10]);
set(get(gca,'ylabel'), 'rotation', 0);
colorbar;


% Interference-to-noise ratio (INR)
inr = 0;

% Definition of the covariance
sigma_1 = sqrt(db2mag(inr));
sigma_w = 1;

B_3D = zeros(R, R);

for i = 1:R
    v1 = exp(1j*2*pi*d/lambda*(0:N-1)'*u1(i));
    
    % Noise covariance matrix
    S = sigma_w^2*eye(N) + sigma_1^2*(v1*v1');
    
    % Weight of the MVDR beamformer
    w0 = (S^(-1) * v0) / (v0' * S^(-1) * v0);
    
    % Powerpattern
    B_3D(:, i) = v' * w0;


end

figure();
% Magnitude of the beampattern ine the u-space
imagesc(u1, u, mag2db(abs(B_3D)));
title("Beampattern for INR=0");
xlabel("u_1");
ylabel("u");
clim([-40, 10]);
set(get(gca,'ylabel'), 'rotation', 0);
colorbar;
