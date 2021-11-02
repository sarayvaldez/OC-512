% %Homework 3 
% %Saray Valdez Hernandez
clc %clearing the command window
clear %clearing any previous variables
x=0:.1:20; % start number, step interval, end number
amp=[0.1 0.5 1 2]; % ampltitude matrix (enter values)
wid=[0.5 1 2 3]; % width matrix (enter values)
loc=[2 4 6 8]; % location matrix (enter values)

matrix=[amp;wid;loc]'; %combining amplitude, width, and location all into one matrix and transposing

y=multGauss(x, matrix); % calling the external function

plot(x,y) %plotting the sum of all y's calculated