% Homework 6    
%Saray Valdez Hernandez
clc;
clear all ;

%Question 1

%Defining variables
y= [0.073 0.44 0.81 1.19 1.56 1.93 2.3 2.67 3.04]; % vertical coordinate (cm)
u= [57.12 75.78 83.77 89.58 94.16 97.99 100.81 102.13 102.62]; % streamwise velocity (cm/s)
k=0.4; % Von Karman constant (cm/s)
v=0.01; % Kinematic viscosity of water (cm^2/s^-1)

%defining the 'smooth fit' model of the function 
ft=@(ustar,y) (ustar/k)*(log(y*ustar/v));
[BETA,R,JCOVB,MSE] = nlinfit(y, u, ft, [1]);

%Plotting the Original data and the smooth fit line 
figure(1)
plot(y,u,'x') %plotting original data
hold on
plot(y,ft(BETA,y),'r') %adding the smooth fit line to the original data
title('Smooth Wall Case') %adding a title 
xlabel('Distance from bed (cm)')% x-axis
ylabel('Velocity (cm/s)')% y-axis 
hold off

%Printing the shear velocity to the screen 
smoothshear=['The shear velocity in the smooth wall case is ', num2str(BETA(1)),' cm/s.'];
disp(smoothshear)


%% Question 2
%defining the 'rough fit' model of the function
rough_ft=@(C, y) C(1)*((1/k)*log(y/C(2))+8.5);
[beta,R,JCOVB,MSE] = nlinfit(y, u, rough_ft, [5 5]);

%Plotting the Original data and the rought fit line 
figure(2)
plot(y,u,'x')%plotting original data
hold on
plot(y,rough_ft(beta,y),'r') %adding the smooth fit line to the original data
title('Rough Wall Case') %adding a title 
xlabel('Distance from bed (cm)')% x-axis
ylabel('Velocity (cm/s)')% y-axis
hold off

%Printing the shear velocity to the screen 
roughshear=['The shear velocity in the rough wall case is ', num2str(beta(1)),' cm/s.'];
roughheight=['The roughness height in the rough wall case is ', num2str(beta(2)),' cm.'];
disp(roughshear)
disp(roughheight)
%% Plot with the original data, the smooth fit, and the rough fit
figure(3)
plot(y,u,'x')%plotting original data
hold on
plot(y,ft(BETA,y),'r')%adding the smooth fit line
hold on
plot(y,rough_ft(beta,y),'b')%adding the rough fit line
legend('data','smooth case', 'rough case', 'location', 'southeast')%adding a legend
xlabel('Distance from bed (cm)')% x-axis
ylabel('Velocity (cm/s)')% y-axis
hold off
