function xhat = backsub(A,b)
% Back substition step of Gaussian elimination
%   A is an nxn matrix
%   b is an nx1 vector (assume elimination step done)
%   xhat is the approximate solution to A*x = b
n = size(A,1);
xhat = zeros(n,1);
for i = n:-1:1
   for j = (i+1):n
      b(i) = b(i) - A(i,j)*xhat(j); 
   end
   xhat(i) = b(i)/A(i,i);
end


end

