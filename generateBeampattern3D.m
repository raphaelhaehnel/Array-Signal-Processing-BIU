% A uniform linear array (ULA) with N sensors, uniform weights w=1/N and 
% sensor spacing from 0.001*lambda to 1*lambda is considered

function generateBeampattern3D(N)
    % N - Number of sensors
    % spaces - Array of 4 boolean value, for choosing what to display
    % plot_type - "polar" or "plot"

    % Wavelengh
    lambda = 10e-9;
    
    % Weights
    w = 1/N;
    
    % Resolution in x axis
    R = 500;
    
    % Sensor spacing
    d = linspace(0.001 * lambda, lambda, R);
    
    % theta-space
    theta_max = pi;
    theta = linspace(0, theta_max, R);
    
    [X, Y] = meshgrid(d, theta);

    % Magnitudes of the beampattern in the different spaces
    B_theta = exp(1j.*(N-1)./2.*(2.*pi./lambda.*X.*cos(Y))) ./ N .* sin(N/2 .* (2.*pi./lambda.*X.*cos(Y))) ./ sin((2.*pi./lambda.*X.*cos(Y))./2);
    
    figure();
    sgtitle("Beampattern of ULA with N=" + N + " sensors");

    % Magnitude of the beampattern ine the theta-space
    imagesc(d, theta, mag2db(abs(B_theta)));
    xlabel("d-spacing");
    ylabel("\theta");
    zlim([-20, 0])
    set(get(gca,'ylabel'), 'rotation', 0);
    colorbar;



        
end

