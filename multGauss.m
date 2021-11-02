
function y= multGauss(x, matrix); % creating the function
rownum=size(matrix,1); % the rows in the matrix
colnum=size(matrix,2); % the columns in the matrix (should always be 3 - amp, wid, and loc)

%Creating an if statement to give us an error is there is more than 3 columns
if colnum == 3; % if the columns in the matrix are  than 3 then 
    disp('The input matrix has 3 columns'); %print this or
else
    error('The input matrix does NOT have 3 columns'); % if the columns in the matrix are less 
end

%calculating y for each row using variables amp, wid, and loc
 for j=1:rownum; %j will be counting the number of rows starting at row 1 and ending with the number of rows
     amplitude=matrix(j,1); %amplitude from each row which is in column 1
     width=matrix(j,2); %width from each row which is in column 2 
     location=matrix(j,3); %location from each row which is in columns 3
     ynumber(j,:)=(amplitude)*gaussmf(x,[width location]); %calculating y for each row within the matrix
 end

%calculating the sum of all y answers
y=sum(ynumber); 
end 
