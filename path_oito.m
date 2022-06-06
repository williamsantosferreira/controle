function [xref,yref,thetaref,vref,wref] = path_oito();

Ts = 0.1;  % sampling time
r = 1; 
Tsim = (2*2*pi*r)/Ts;

%initial positions
x(1) = 0;
y(1) = 0;
theta(1) = 0;

iterations = round(Tsim/Ts);

for k = 2:iterations
    v(k) = 0.2;
    if(k<=iterations/2)
        w(k) = 0.2;
    else
        w(k) = -0.2;
    end
        
    theta(k) = theta(k-1)+Ts*w(k);
    x(k) = x(k-1) + v(k)*cos(theta(k))*Ts;
    y(k) = y(k-1) + v(k)*sin(theta(k))*Ts;
     
end
xref = x;
yref = y;
thetaref = theta;
vref = v;
wref = w;
end