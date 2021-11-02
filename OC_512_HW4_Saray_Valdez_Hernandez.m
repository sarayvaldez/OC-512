%Homework 4 
%Saray Valdez Hernandez
%% Part 1- Importing Data 
clc
clear all
fid=fopen('hw4_data.txt'); %openning the file
fgetl(fid); fgetl(fid);%junking the first two lines 
[data]=textscan(fid,'%d%d%d%d%d%d%f%f%f%f%f%d%f%f%f%f%f%f'); %d for integer and %f for non-integer
fclose(fid); %close the file
%%
%naming the variables from hw4_data.txt
yr=double(data{1});% year
MM=double(data{2});%month
dd=double(data{3});%day
hh=double(data{4});%hour
mm=double(data{5});%minute
%creating dummy variable for seconds
n=0;
second=n(ones(714,1));%seconds - a column of 714 rows all with the value zero

wdir=data{6};%wind direction (degT)
wspd=data{7};%wind speed (m/s)
gst=data{8};% Peak 5 or 8 second gust speed (m/s)
wvht=data{9};%waveheight (m)
dpd=data{10};%dominant wave period (seconds)
adp=data{11};%average wave period (seconds)
mwp=data{12};%direction from which the waves at the dominant period are coming (degT)
pres=data{13};%sea level pressure (hPa)
atmp=data{14};%air temperature (celsius)
wtmp=data{15};%surface sea temperature(celsius)
dewp=data{16};%dewpoint temperature (celsius)
vis=data{17};%station visibility (nautical miles)
tide=data{18};%water level above or below mean lower low water (ft)
%%
%plotting air temperature over time
figure(1)
t=datetime(yr,MM,dd,hh,mm,second);%time variable using date time(year, month, day, hour, minute, second)
plot(t,atmp)
xlabel('Date (Month, Day)') %label x axis
ylabel('Air Temperature (°C)') %label y axis
%%    
% Plotting wave height vs wind speed
figure(2)
sz=25; % size of plot
c='r'; % color of points
scatter(wspd,wvht,sz,c,'filled') %plotting them on a scatter
xlabel('Wind Speed (m/s)') %label x axis
ylabel('Wave Height (m)') %label y axis
ylim([0 10]) % not plotting the outliers

%% Part 2 Outputting data 

%Getting the averages for each day
newdata=[yr MM dd wdir wspd gst wvht dpd adp mwp pres atmp wtmp dewp vis tide];
for n=1:30; %day range 1-30 in September
    i=find(dd==n); %find elements for each day 
    singledays=newdata(i,:); %storing elements from each day
    output(n,:)=mean(singledays,1);%getting the mean values for each day 
end
%% 
%adding orginal headers back in 
title=["YY" "MM" "dd", "wdir", "wspd", "gst", "wvht", "dpd", "adp", "mwp", "pres", "atmp", "wtmp", "dewp", "vis", "tide"];
units=["yr", "mo","dy","degT","m/s", "m/s", "m","sec", "sec","degT","hPa","degC","degC","degC","nmi","ft"];

%concatinating headers and averaged data
finaldata=[title;units;output]; %puting headers and average data into one matrix
home
HW4=fopen('hw4_daily_data.txt', 'w'); %creating a new txt file 
fprintf(HW4,'%10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s\n', finaldata'); %telling matlab what to put into the new txt file
fclose(HW4); 


