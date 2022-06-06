%Odometria robô
close all;
clear;
clc;
%% Variables
x(1) = 0;
y(1) = 0;
theta(1) = pi/2;
v = 0;
w = 0;
L = 0.42;

Kx = 1;
Ky = 100;
Kt = 0;

dt = 0.01;
tol = 0.01;

v_max = 1;
w_max = 1;

[xref,yref,thetaref,vref,wref] = path_reta();
%[xref,yref,thetaref,vref,wref] = path_square();
%[xref,yref,thetaref,vref,wref] = path_circle();
%[xref,yref,thetaref,vref,wref] = path_oito();

%% Control
for i=2:length(xref)
   theta(i) = theta(i-1) + w*dt;
   x(i) = x(i-1) + v*cos(theta(i))*dt;
   y(i) = y(i-1) + v*sin(theta(i))*dt;
    
   M = [cos(theta(i)) sin(theta(i)) 0
        -sin(theta(i)) cos(theta(i)) 0
         0 0 1];
   e = M*[xref(i) - x(i);yref(i) - y(i);thetaref(i) - theta(i)];
   ex = e(1);
   ey = e(2);
   et = e(3);
   
   if(abs(ex) < tol)
       ex = 0;
   end
   if(abs(ey) < tol)
       ey = 0;
   end
   if(abs(et) < tol)
       et = 0;
   end
   v = vref(i)*cos(et) + Kx*ex;
   w = Kt*sin(et)+Ky*vref(i)*ey + wref(i);
   
   if(abs(v) > v_max)
       v = sign(v)*v_max;
   end
   if(abs(w) > w_max)
       w = sign(w)*w_max;
   end
   
end
plot(xref,yref,x,y);