The value of each element in the first row is the number of the column.
The value of each element in the first column is the number of the row.
The rest of the elements each has a value equal to the sum of the element above it and element to the left.
The function must return a sensible error if the user does not input exactly two arguments
The function should be well commented


function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin ~=2 
    error('Needs row and Column inputs')
end
A = zeros(n,m);
for i=1:n;
   for j = 1:m;
     if i==1
         A(i,j)=j
     elseif j == 1
    A(i,j)=i
     else
         A(i,j)=A(i-1,j)+A(i,j-1)
     end
   end
% Now the real challenge is to fill in the correct values of A

end
