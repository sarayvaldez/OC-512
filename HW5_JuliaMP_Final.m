%%%%%%%
%Week 5 homework assignment
%Julia Marks Peterson
%%%%%%%

%Create a for loop that loads all 12 files
clc
clear all
var = dir('or_precip_1983_*.asc');

for n = 1:12
    data_n(:,:,n) = arcgridread(var(n).name); %go through each name in 
    %structure and open new matrix in the z space
end

totalprecip=sum(data_n,3); %sum in the z dimension

cellsize = 0.02083333333
xmin=-124.73958333333
xmax=xmin+(cellsize*406);
ymin = 41.73958333333
ymax=ymin+(cellsize*228);


xaxis = xmin:cellsize:xmax;
yaxis = ymin:cellsize:ymax;

% Make a figure with color bar and contour lines 
figure(1)
contour = contour(xaxis,yaxis,totalprecip,[0:1000:7000],'k');
hold on
[x,y] = meshgrid(xaxis,yaxis);
fig = surf(x,y,totalprecip); shading interp
view(0,270);
c = colorbar;
c.Label.String = 'Precipitation (mm)';
xlabel('Longitude');
ylabel('Latitude');
title('Total Annual Precipitation of 1983');

hold off

print -dpng -r300 totalprecip1983.png
