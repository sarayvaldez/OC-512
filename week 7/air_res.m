function xprime=air_res(t,x,p);
frctn=p(1);
grav=p(2);

xprime=[-frctn*x(1)*(sqrt((x(1)^2)+(x(2)^2))); -frctn*x(2)*(sqrt((x(1)^2)+(x(2)^2)))-grav; x(1); x(2)];