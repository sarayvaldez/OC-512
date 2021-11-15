clear all
close all
clc

x(1)=0; x0=x(1); % setting initial x value
y(1)=0; y0=y(1); %setting initial y value

mag_velocity=180; % setting the initial speed to 180 m/s
theta=40; %setting launch angle to 40 degrees
u(1)=mag_velocity*cosd(theta); u0=u(1); %setting initial u value
v(1)=mag_velocity*sind(theta); v0=v(1); %setting initial v calue

%setting parameters
friction_1=0;
gravity=9.8; %m/s^2

%create vectors of parameters
p=[friction_1 mag_velocity gravity];

%create vector of initial conditions
X0=[u0 v0 x0 y0 ];

%defining time domain over which to solve the problem
tspan=[0,20];

%solving the system of equations
[t,x]=ode45(@air_res_test,tspan,X0,[],p);






