

x=0:.1:20; %start number, increments, end number...
y1=20*gaussmf(x,[3 12]); % Amplitude*gaussmf(x,[one sigma aka width , centered number aka location)
plot(x,y1)

