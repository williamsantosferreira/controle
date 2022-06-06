function [xref,yref,thetaref,vref,wref] = path_square()

dist = 5; %distance of each side
v(1) = 0.2;
w(1) = 0;
Ts = 0.01;
%square start position 
x(1) = 1; 
y(1) = 1;
theta(1) = 0;
Tsim = dist/v(1) + dist/v(1) + dist/v(1) + dist/v(1); 

iterations= round((Tsim/Ts));

itr_1 = round((dist/v(1))/Ts);
itr_2 = round((dist/v(1))/Ts);
itr_3 = round((dist/v(1))/Ts);
itr_4 = round((dist/v(1))/Ts);

for k = 2:iterations
        w(k) = 0;
        v(k) = 0.2;
        if(k <itr_1)
            theta(k) = 0;
        elseif(k>=itr_1 && k<(itr_1 + itr_2))
            theta(k) = pi/2;
        elseif(k>=(itr_1 + itr_2) && k<(itr_1 + itr_2+itr_3))
            theta(k) = pi;
        elseif(k>=(itr_1+itr_2+itr_3))
            theta(k) = (3/2)*pi;
        end
        
    x(k) = x(k-1) + Ts*v(k)*cos(theta(k));
    y(k) = y(k-1) + Ts*v(k)*sin(theta(k));
end
xref = x;
yref = y;
thetaref = theta;
vref = v;
wref = w;

end
