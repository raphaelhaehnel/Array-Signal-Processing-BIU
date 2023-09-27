% A uniform linear array (ULA) with N sensors, uniform weights w=1/N and 
% sensor spacing d=lambda/2 is considered

function [] = generateBeampatternULA(N, spaces, plot_type)
    % N - Number of sensors
    % spaces - Array of 4 boolean value, for choosing what to display
    % plot_type - "polar" or "plot"
    % theta_T - Steering angle


    % Wavelengh
    lambda = 10e-9;

    % Sensor spacing
    d = lambda/2;

    % Resolution in x axis
    R = 1000;
    
    % phi-space
    phi_max = 2*pi*d/lambda;
    phi = linspace(-phi_max, phi_max, R);
    
    % k_z-space
    k_z_max = 2*pi/lambda;
    k_z = linspace(-k_z_max, k_z_max, R);
    
    % u-space
    u_max = 1;
    u = linspace(-u_max, u_max, R);
    
    % theta-space
    theta_max = pi;
    theta = linspace(0, theta_max, R);

    % Magnitudes of the beampattern in the different spaces
    B_phi = exp(1j*(N-1)/2*phi) / N .* sin(N/2 * phi) ./ sin(phi/2);
    B_k = exp(1j*(N-1)/2*(-d*k_z)) / N .* sin(N/2 * (-d*k_z)) ./ sin((-d*k_z)/2);
    B_u = exp(1j*(N-1)/2*(2*pi/lambda*d*u)) / N .* sin(N/2 * (2*pi/lambda*d*u)) ./ sin((2*pi/lambda*d*u)/2);
    B_theta = exp(1j*(N-1)/2*(2*pi/lambda*d*cos(theta))) / N .* sin(N/2 * (2*pi/lambda*d*cos(theta))) ./ sin((2*pi/lambda*d*cos(theta))/2);

    figure();
    sgtitle("Beampattern of ULA with N=" + N + " sensors");
    
    number_plots = sum(spaces, "all");
    i = 1;

    if spaces(1)
        % Magnitude of the beampattern in the phi-space
        subplot(number_plots, 1, i);
        i = i + 1;

        if plot_type == "plot"
            plot(phi, mag2db(abs(B_phi)));
            xlabel("\Phi");
            ylabel("B_{\Phi}");
            ylim([-40, 0])
            set(get(gca,'ylabel'), 'rotation', 0);
        end

        if plot_type == "polar"
            polardb(phi, mag2db(abs(B_phi)), -40, '-r');
        end
        
    end

    if spaces(2)
        % Magnitude of the beampattern ine the k_z-space
        subplot(number_plots, 1, i);
        i = i + 1;
        

        if plot_type == "plot"
            plot(k_z, mag2db(abs(B_k)));
            xlabel("k_z");
            ylabel("B_{k_z}");
            ylim([-40, 0])
            set(get(gca,'ylabel'), 'rotation', 0);
        end

        if plot_type == "polar"
            polardb(k_z, mag2db(abs(B_k)), -40, '-r');
        end
        
    end

    if spaces(3)
        % Magnitude of the beampattern ine the u-space
        subplot(number_plots, 1, i);
        i = i + 1;
        if plot_type == "plot"
            plot(u, mag2db(abs(B_u)));
            xlabel("u");
            ylabel("B_u");
            ylim([-40, 0])
            set(get(gca,'ylabel'), 'rotation', 0);
        end

        if plot_type == "polar"
            polardb(u, mag2db(abs(B_u)), -40, '-r');
        end
        
    end

    if spaces(4)    
        % Magnitude of the beampattern ine the theta-space
        subplot(number_plots, 1, i);
        i = i + 1;
        
        if plot_type == "plot"
            plot(theta, mag2db(abs(B_theta)));
            xlabel("\theta");
            ylabel("B_{\theta}");
            ylim([-40, 0])
            set(get(gca,'ylabel'), 'rotation', 0);
        end

        if plot_type == "polar"
            polardb(theta, mag2db(abs(B_theta)), -40, '-r');
        end
        
    end

end
