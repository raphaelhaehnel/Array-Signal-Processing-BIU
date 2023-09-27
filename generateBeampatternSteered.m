% A uniform linear array (ULA) with N sensors, uniform weights w=1/N and 
% sensor spacing d=lambda/2 is considered

function [] = generateBeampatternSteered(N, steering_angles)
    % N - Number of sensors
    % spaces - Array of 4 boolean value, for choosing what to display
    % plot_type - "polar" or "plot"
    % theta_T - Steering angle


    % Wavelengh
    lambda = 10e-9;
    
    % Weights
    w = 1/N;
    
    % Sensor spacing
    d = lambda/2;
    
    % Resolution in x axis
    R = 1000;
    
    % theta-space
    theta_max = pi;
    theta = linspace(0, theta_max, R);

    figure();
    sgtitle("Beampattern of ULA with N=" + N + " sensors");
    
    for i = 1:length(steering_angles)
        subplot(2, 2, i)

        theta_T_deg = steering_angles(i);
        theta_T = deg2rad(theta_T_deg);

        % The beampattern in the angle space for an ULA with uniform weigths 
        % and array steering is given by (we'll use it instead of the previous one)
        B_theta = 1/N * sin(pi*d*N/lambda*(cos(theta)-cos(theta_T)))./sin(pi*d/lambda*(cos(theta)-cos(theta_T)));

        polardb(theta, mag2db(abs(B_theta)), -40, '-r');
        title("steering angle \theta_T=" + theta_T_deg + "\degree");
    end
    

end
