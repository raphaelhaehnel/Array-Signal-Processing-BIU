% Exercice 5: Delay-and-Sum Beamformer for Narrowband Signals

% The number of sensors
N_sensors = 10;

% Sensor spacing
d = 0.05;

% Carrier frequency
f0 = 2.333e3;

% Light velocity
c0 = 342;

% Wavelengh
lambda = c0 / f0;

% Sampling frequency
fs = 3 * f0;

% Signal length in samples
N = 2^10;

[y,h] = NB_signal( fs, f0, N);
y = y';

% Time axis
t = (0:N-1)/fs;

% Different directions-of-arrival
theta_in = 0:5:90;

% Coordinates of the sensors
z = 0:d:d*(N_sensors-1);

% Generate a meshgrid to compute the delay as a function of (theta, z)
[THETA_IN, Z] = meshgrid(theta_in, z);
delay = Z.*cosd(THETA_IN) / c0;

figure();
grid on;

% Plot the delays for each angle (only for visualization)
plot(z, delay, ".-");
ylabel("delay");
xlabel("z");
title("Delay of the input for multiple directions of arrival");

% Generate all the delayed signals
y_in = zeros(N_sensors, N, length(theta_in));
for j = 1:length(theta_in)
    for i = 1:N_sensors
        disp(i)
        y_in(i, :, j) = delayseq( y, delay(i, j), fs );
    end
end

% In the next section, we are building the signal back,
% for different directions-of-arrival and for two different steering angle:
% 0 (endfire) and 90 (broadside)

% Total power of the input signal
power_in = rms(N_sensors * y)^2;

% Endfire orientation
figure();
endfire_ratio = zeros(1, length(theta_in));
for j = 1:length(theta_in) 
    subplot(ceil(length(theta_in)/3), 3, j);
    hold on;
    grid on;

    % Delay and sum the signals from the different inputs
    dsb = zeros(1, N);

    for i = 1:N_sensors

        % Delay the input signal for an orientation of 0 degree
        dsb = dsb + delayseq( y_in(i, :, j)', - delay(i, 1), fs )';

    end

    plot(t, N_sensors * y, 'b');
    plot(t, dsb);
    title(theta_in(j));
    endfire_ratio(j) = rms(dsb)^2 / power_in;
end
sgtitle("DSB endfire")


% Broadside orientation
figure();
broadside_ratio = zeros(1, length(theta_in));
for j = 1:length(theta_in) 
    subplot(ceil(length(theta_in)/3), 3, j);
    hold on;
    grid on;

     % Delay and sum the signals from the different inputs
    dsb = zeros(1, N);

    for i = 1:N_sensors
        
        % Delay the input signal for an orientation of 90 degree (no delay)
        dsb = dsb + y_in(i, :, j);

    end

    plot(t, N_sensors * y, 'b');
    plot(t, dsb);
    title(theta_in(j));
    broadside_ratio(j) =  rms(dsb)^2 / power_in;
end
sgtitle("DSB broadside")


% Resolution in x axis
R = 300;

% theta-space
theta_max = pi/2;
theta = linspace(0, theta_max, R);

figure();
hold on;
grid on;

theta_T = pi/2;
% The beampattern in the angle space for an ULA with uniform weigths 
% and array steering is given by (we'll use it instead of the previous one)
B_theta = 1/N_sensors * sin(pi*d*N_sensors/lambda*(cos(theta)-cos(theta_T)))./sin(pi*d/lambda*(cos(theta)-cos(theta_T)));

plot(theta_in, mag2db(broadside_ratio));
plot(rad2deg(theta), mag2db(abs(B_theta)));
legend("Simulated beampattern", "Analytic beampattern");
ylim([-60, 0]);
title("Broadside OIR");


figure();
hold on;
grid on;

theta_T = 0;
% The beampattern in the angle space for an ULA with uniform weigths 
% and array steering is given by (we'll use it instead of the previous one)
B_theta = 1/N_sensors * sin(pi*d*N_sensors/lambda*(cos(theta)-cos(theta_T)))./sin(pi*d/lambda*(cos(theta)-cos(theta_T)));

plot(theta_in, mag2db(endfire_ratio));
plot(rad2deg(theta), mag2db(abs(B_theta)));
legend("Simulated beampattern", "Analytic beampattern");
ylim([-60, 0]);
title("Endfire OIR");
