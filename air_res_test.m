function xprime=air_res(t,x,p);
frctn=p(1);
mvelocity=p(2);
grav=p(3);

xprime=[-frctn*mvelocity*x(1); (-frctn*mvelocity*x(2))-grav; x(1); x(2);];