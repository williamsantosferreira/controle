function [xref,yref,thetaref,vref,wref] = path_reta()

v0 = 0.2; %velocidade linear desejada em cada ponto.
w0 = 0; %velocidade angular desejada em cada ponto.

%line start position
x = 1;
y = 1;


%distance and time
dist = 10; %in meters
time = dist/v0; %in seconds
ts = 0.01; %sample time in seconds

points = round(time/ts);

for k = 2:points  % 1 a tempo de simula��o/ tempo de integra��o   
    v(k) = v0;
    w(k) = 0;

    theta(k) = ts*w(k);   
    x(k) = x(k-1) + ts*v(k)*cos(theta(k));
    y(k) = y(k-1);
end
xref = x;
yref = y;
thetaref = theta;
vref = v;
wref = w;

end