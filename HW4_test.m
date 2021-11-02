%Homework 4 
%Saray Valdez Hernandez
%%
%Part 1- Importing Data
clc
clear all
fid=fopen('hw4_data.txt'); %openning the file
fgetl(fid); fgetl(fid);%junking the first two lines 
[data]=textscan(fid,'%d%d%d%d%d%d%f%f%f%f%f%d%f%f%f%f%f%f'); %d for integer and %f for non-integer
fclose(fid);
%%
%naming the variables from hw4_data.txt
yr=double(data{1});% year
MM=double(data{2});%month
dd=double(data{3});%day
hh=double(data{4});%hour
mm=double(data{5});%minute
%creating dummy variable for seconds
n=0;
second=n(ones(714,1));%second

wdir=data{6};%wind direction
wspd=data{7};%wind speed
gst=data{8};% Peak 5 or 8 second gust speed
wvht=data{9};%waveheight
dpd=data{10};%
adp=data{11};%
mwp=data{12};%
pres=data{13};%
atmp=data{14};%air temperature
wtmp=data{15};%
dewp=data{16};%
vis=data{17};%
tide=data{18};%
%%
%plotting air temperature over time
figure(1)
t=datetime(yr,MM,dd,hh,mm,second);
plot(t,atmp)

%%    
% Plotting wave height vs wind speed
figure(2)
sz=25; % size of plot
c='r'; % color of points
scatter(wspd,wvht,sz,c,'filled') %plotting them on a scatter
xlabel('Wind Speed (m/s)') %label x axis
ylabel('Wave Height (m)') %lavel y axis
ylim([0 10]) % not plotting the outliers

%% Part 2 Outputting data

%Getting the averages for each day
newdata=[yr MM dd wdir wspd gst wvht dpd adp mwp pres atmp wtmp dewp vis tide];
for n=1:30; %day range 1-30 in September
    i=find(dd==n); %find elements within the same day 
    singledays=newdata(i,:); %storing each day
    output(n,:)=mean(singledays,1);
end
%% 
%adding orginal headers 
title=["YY" "MM" "dd", "wdir", "wspd", "gst", "wvht", "dpd", "adp", "mwp", "pres", "atmp", "wtmp", "dewp", "vis", "tide"];
units=["yr", "mo","dy","degT","m/s", "m/s", "m","sec", "sec","degT","hPa","degC","degC","degC","nmi","ft"];

%% concatinating headers and averaged data
finaldata=[title;units;output];
home
HW4=fopen('hw4_daily_data.txt', 'w');
fprintf(HW4,'%10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s %10s\n', finaldata');
fclose(HW4);


