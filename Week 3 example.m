x=0:.1:20;
y1=0.5*gaussmf(x,[3 7]);
plot(x,y1)
hold 
y2=1.5*guassmf(x[1 12]);
plot(x, y2, 'r')
y3=y1+y2
plot(x,y3,'g')