%Homework 3 
%Saray Valdez Hernandez

x1=1:1:30;
amp1=10;
wid1=3;
loc1=12;

x2=1:1:30;
amp2=7;
wid2=4;
loc2=21;

x3=1:1:30;
amp3=14;
wid3=2;
loc3=6;

y=multGauss(x1,amp1, wid1, loc1,x2,amp2,wid2,loc2,x3,amp3,wid3,loc3);

plot(x2,y)

