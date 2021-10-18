function y=multGauss(x1,amp1, wid1, loc1,x2,amp2,wid2,loc2,x3,amp3,wid3,loc3);
y1(x1)=amp1*gaussmf(x1,[wid1 loc1]);
y2(x2)=amp2*gaussmf(x2,[wid2 loc2]);
y3(x3)=amp3*gaussmf(x3,[wid3 loc3]);


y=y1+y2+y3;

[~, colnum]=size(y);
if colnum==3
    disp('The input matrix has 3 columns')
else
    disp(['The input matrix does NOT have 3 columns, it has' colnum 'columns'])
    
end
    
