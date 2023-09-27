% Exercice 2: Non-uniform Weighting

DISPLAY_ALL = [true, true, true, true];
DISPLAY_THETA = [false, false, false, true];
DISPLAY_PHI = [true, false, false, false];
DISPLAY_U = [false, false, true, false];

POLAR = "polar";
PLOT = "plot";
theta_T = pi/2;
steering_angles = [0, 30, 60, 90];

% The number of sensors
N = 11;

% Weights
n = linspace(-(N-1)/2, (N-1)/2, N)';
w1 = 1/N * ones(N, 1);
w2 = sin(pi/(2*N))*cos(pi*n/N);


% Displays the powerpattern in the u-space
[u, B1] = getBeampatternWeighted(N, w1);
[~, B2] = getBeampatternWeighted(N, w2);

figure();
hold on;
grid on;
plot(u, mag2db(abs(B1)));
plot(u, mag2db(abs(B2)));
xlabel("u");
ylabel("B_u");
ylim([-40, 0])
set(get(gca,'ylabel'), 'rotation', 0);
legend("w_{I}(n)", "w_{II}(n)");

% TODO explain what is the effect of non-uniform weighting
