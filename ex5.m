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
% N = 2^10; 
N = 2^8;

[y,h] = NB_signal( fs, f0, N);

delay = 0.01;

y_delay = frac_delay( y, delay, fs );
% x      : discrete input signal
% delay  : signal delay in seconds
% fs     : sampling frequency in Hz

hold on;

% Time axis
t = (0:N-1)/fs;

% Plot the source signal
plot(t, y);

% Plot the delayed source signal
plot(t, y_delay);
legend("original signal", "delayed signal");

% Different directions-of-arrival
theta_in = 0:5:90;

% Coordinates of the sensors
z = 0:d:d*(N_sensors-1);

[THETA_IN, Z] = meshgrid(theta_in, z);

delay = Z.*cosd(THETA_IN) / c0;

figure();
grid on;

% Plot the delays for each angle
plot(delay);

figure();
hold on;

% Generate all the delayed signals
y_in = zeros(N_sensors, N, length(theta_in));
for j = 1:length(theta_in)
    for i = 1:N_sensors
        disp(i)
        y_in(i, :, j) = frac_delay( y, delay(i, j), fs ); % Why don't use delayseq
        % plot(t, y_in(i, :, j));
    end
end

% Build the signal back, for different directions-of-arrival

power_in = rms(N_sensors * y)^2;

% Endfire orientation
figure();
endfire_ratio = zeros(1, length(theta_in));
for j = 1:length(theta_in) 
    subplot(ceil(length(theta_in)/3), 3, j);
    hold on;
    grid on;
    dsb = zeros(1, N);

    for i = 1:N_sensors
        disp(i)
        dsb = dsb + frac_delay( y_in(i, :, j), - delay(i, 1), fs );
    end

    plot(N_sensors * y, 'b');
    plot(dsb);
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
    dsb = zeros(1, N);

    for i = 1:N_sensors
        disp(i)
        dsb = dsb + y_in(i, :, j);
    end

    plot(N_sensors * y, 'b');
    plot(dsb);
    title(theta_in(j));
    broadside_ratio(j) =  rms(dsb)^2 / power_in;
end
sgtitle("DSB broadside")

figure();
plot(theta_in, mag2db(broadside_ratio));
title("Broadside OIR");

figure();
plot(theta_in, mag2db(endfire_ratio));
title("Endfire OIR");


