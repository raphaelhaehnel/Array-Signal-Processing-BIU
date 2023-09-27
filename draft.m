  % fs = 8e3; t = 0:1/fs:0.005; x = sin(2*pi*100*t).';
  % y = delayseq(x,0.001,fs);
  % plot(t,x,'r',t,y,'b'); legend('Original','Delayed');

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

fs = 16e3;
f0 = fs/3;
N = 2^10; 

t = 0:1/fs:N/fs;

y = exp(1j*2*pi*f0*t);

delay = 0.001;

y_delay = delayseq( y, delay, fs );

plot(t, y_delay);