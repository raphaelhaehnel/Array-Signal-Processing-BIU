% Exercice 1: Beampattern of ULA

DISPLAY_ALL = [true, true, true, true];
DISPLAY_THETA = [false, false, false, true];
DISPLAY_PHI = [true, false, false, false];
POLAR = "polar";
PLOT = "plot";
theta_T = pi/2;
steering_angles = [0, 30, 60, 90];

% Plot the magnitude of tthe beampattern for N=10 and N=11
generateBeampatternULA(10, DISPLAY_ALL, PLOT);
generateBeampatternULA(11, DISPLAY_ALL, PLOT);
generateBeampatternULA(12, DISPLAY_ALL, PLOT);

% Displays the polar plot in the theta_space
generateBeampatternULA(10, DISPLAY_THETA, POLAR);
generateBeampatternULA(11, DISPLAY_THETA, POLAR);

generateBeampattern3D(10);

generateBeampatternSteered(10, steering_angles);

generateBeampatternFailure(10, DISPLAY_PHI, PLOT, [3, 5, 6]);



