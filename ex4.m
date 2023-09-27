% Exercice 4: Beampattern of MVDR Beamformer

% The number of sensors
N = 10;

% Wavelengh
lambda = 10e-9;

% Sensor spacing
d = lambda/2;

% Steering vector
theta_t = pi/2;

% Resolution in x axis
R = 1000;

% u-space
u_max = 1;
u = linspace(-u_max, u_max, R);
[U, n] = meshgrid(u, 0:N-1);

% Array manifold vector
v_s = exp(1j.*n.*(2*pi*d/lambda).*U);

% Interferer
u_I = [0.3 0.004];

inr = 70;

sigma_1 = sqrt(db2mag(inr));
sigma_w = 1;

for k = 1 : length(u_I)

    % Initialize the weights and the beampattern
    w_o = zeros(N, R);
    B = zeros(N, 1);

    figure();
    hold on;
    grid on;

    for l = 1 : length(v_s)

        % Direction of the interferer
        v_1 = exp(1j.*n(:,1).*(2*pi*d/lambda).*u_I(k));
        S_n = sigma_w^2*eye(N) + sigma_1^2*(v_1*v_1');
    
        % Weight of the MVDR beamformer
        w_o(:, l) = v_s(:, l)'*inv(S_n) / (v_s(:, l)' * inv(S_n) * v_s(:, l));
        
        % Powerpattern
        B(l) = w_o(:, l)'*v_s(:, l);

    end

    plot(u, mag2db(abs(B)));
    title("Beampattern for u_1 = " + u_I(k));
    xlabel("u");
    ylabel("B_u");
    ylim([-40, 0])
end


