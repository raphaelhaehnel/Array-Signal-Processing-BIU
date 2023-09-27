% A uniform linear array (ULA) with N sensors, uniform weights w=1/N and 
% sensor spacing d=lambda/2 is considered

function [] = generateBeampatternFailure(N, spaces, plot_type, failure)
    % N - Number of sensors
    % spaces - Array of 4 boolean value, for choosing what to display
    % plot_type - "polar" or "plot"
    % theta_T - Steering angle


    % Wavelengh
    lambda = 10e-9;
    
    % Weights
    w = 1/N * ones(N, 1);
    
    if nargin == 4
        for i=failure
            w(i+1) = 0;
        end
    end

    % Sensor spacing
    d = lambda/2;

    % Resolution in x axis
    R = 1000;
    
    % phi-space
    phi_max = 2*pi*d/lambda;
    phi = linspace(-phi_max, phi_max, R);
    
    [Phi, n] = meshgrid(phi, 0:N-1);

    % Array manifold vector
    v_theta = exp(1j.*n.*Phi);

    % Magnitudes of the beampattern in the different spaces
    B_phi_failure = w'*v_theta;

    figure();
    sgtitle("Beampattern of ULA with N=" + N + " sensors");

    % Magnitude of the beampattern in the phi-space
    if plot_type == "plot"

        hold on;

        plot(phi, mag2db(abs(B_phi_failure)));

        % Recompute the beampattern without failure
        w = 1/N * ones(N, 1);
        B_phi = w'*v_theta;

        plot(phi, mag2db(abs(B_phi)));

        xlabel("\Phi");
        ylabel("B_{\Phi}");
        ylim([-40, 0])
        set(get(gca,'ylabel'), 'rotation', 0);

        legend("Beampattern with sensor failure", "Beampattern without any failure");
        grid on;

    end

    if plot_type == "polar"
        polardb(phi, mag2db(abs(B_phi)), -40, '-r');
    end
    
    

end
