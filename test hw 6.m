%Defining variables
y= [0.073 0.44 0.81 1.19 1.56 1.93 2.3 2.67 3.04]; % vertical coordinate (m)
u= [57.12 75.78 83.77 89.58 94.16 97.99 100.81 102.13 102.62]; % streamwise velocity (m/s)
k=0.4; % Von Karman constant
v=0.01; % Kinematic viscosity of water (cm^2/s^-1)


%defining the model of the function 
ft=@(ustar,u) ((1/k)*log((y*ustar)/v)*ustar);
[beta,R,JCOVB,MSE] = nlinfit(u, y, ft, [1]);

%Plotting logarithmic line
figure(1)
plot(u,y,'x')
hold on
plot(u,ft(beta,u),'r')
hold off
