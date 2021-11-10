%Defining variables
clc;
clear all;
y= [0.073 0.44 0.81 1.19 1.56 1.93 2.3 2.67 3.04]; % vertical coordinate (cm)
u= [57.12 75.78 83.77 89.58 94.16 97.99 100.81 102.13 102.62]; % streamwise velocity (cm/s)
k=0.4; % Von Karman constant (m/s)
v=0.01; % Kinematic viscosity of water (cm^2/s^-1)


%defining the model of the function 
ft=@(ustar,y) (ustar/k)*(log(y*ustar/v));
[BETA,R,JCOVB,MSE] = nlinfit(y, u, ft, [1]);

%Plotting logarithmic line
figure(1)
plot(y,u,'x')
hold on
plot(y,ft(BETA,y),'r')
hold off


%% 
rough_ft=@(C, y) C(1)*((1/k)*log(y/C(2)+8.5)
[beta,R,JCOVB,MSE] = nlinfit(y, u, rough_ft, [5 5]);
figure(2)
plot(y,u,'x')
hold on
plot(y,ft(beta,y),'r')
hold off