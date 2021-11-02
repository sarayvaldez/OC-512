%OC 515 Homework 5
%Saray Valdez Hernandez
clc 
clear all 
%% Reading in the files 
var=dir('*.asc'); %creating structure with all ascii files in the folder called var 
rownum=size(var,1); %the number of rows in structure var

%creating a for loop to read in data
 for j=1:rownum %in this case, j is from 1 to 12
     data=arcgridread(var(j).name); %arcgridread (name of stucture [var] (for variable [j]) . column name [name])
     storedata{j,:}=[data]; %putting all read files into a cell
 end

%% summing all of the cells together 
temp=storedata{1}; %starting point for the for loop
for j=2:rownum % 2 thorugh 12 because temp is the first value already defined in the line above
  annualprecip=temp+storedata{j}; %sum of all precip data
end
%% Creating lat and long for figure
lat=linspace(41.73958333333,41.73958333333+(0.02083333333*229),229); %linspace(startnumber, end number, interval)
long=linspace(-124.73958333333,-124.73958333333+(0.02083333333*407),407); %linspace(startnumber, end number, interval)
%% Creating a figure
figure(1)
contourf(long,lat,annualprecip,[0:200:1800]) %creating a flooded countour plot
view(0,270) %changing to view Oregon the right way (North up)
colormap("jet") %changing color map 
colorbar %adding a color bar
ylabel(colorbar, 'Precipitation (mm)') %labeling the color bar
title('Annual Precipiation in Oregon') %adding a title to the figure
xlabel('Longitude (Decimal Degrees)') %adding x axis label
ylabel('Latitude (Decimal Degrees)') %adding y axis lavbel
print -dpng -r300 annualprecip.png % print figure % saving figure
