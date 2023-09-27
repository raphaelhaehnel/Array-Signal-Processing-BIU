% Exercice 3: Half-Power Bandwidth

% ASP lab
%
% Exercise: Half-power Beamwidth
%
% Template
%
% H. Loellmann (June 2017)


Ndl_set = 1000:-0.001:1;          % values for N d/lambda
theta_deg =[2.5 5 10 20 30 45 90];  % steering angles in deg
theta_rad = theta_deg*pi/180;       % steering angles in rad

% Half-power bandwidth in the theta-space for endfire
c0 = 0.443;
Theta_H_end = 2*acos( 1 - c0./Ndl_set);  % rad
Theta_H_end_deg = Theta_H_end*180/pi;    % degrees

figure(2)
clf
loglog( Ndl_set, abs(Theta_H_end_deg),'-b')
set(gca,'Fontsize',12)
axis([ Ndl_set(end) Ndl_set(1) 0.04 150])
xlabel('{\itN d} / \lambda','Fontsize',12)
ylabel('3-dB BW in degrees','Fontsize',12)
text(12,35,'Endfire','Fontsize',12)
box on
grid on
hold on

% Half-power bandwidth (in deg) for scan limit

% insert your code here .....
Theta_limit = acos( 1 - 2*c0./Ndl_set);  % rad
Theta_limit_deg = Theta_limit*180/pi;    % degrees
loglog( Ndl_set, abs(Theta_limit_deg),'--r');
text(12,10,'OK','Fontsize',12)

% Half-power bandwidth for different angles
bw = zeros(1,length(theta_rad));

for k = 1 : length(theta_rad)
    % for l = 1 : length(Ndl_set)
    %     % insert your code here ....
    % 
    % end
   
    % insert your code here....
    theta_h = acos(cos(theta_rad(k)) - c0./Ndl_set) - acos(cos(theta_rad(k)) + c0./Ndl_set);
    Theta_h_deg = theta_h*180/pi;
    loglog( Ndl_set, abs(Theta_h_deg),'-r');
    
    % text(1040,rightpoint,[num2str(theta_deg(k)),'^o'],'fontsize',10);
end

