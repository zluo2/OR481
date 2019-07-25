function [A,b] = elimination(A,b)
%The elimination step of Gaussian elimination
%   A is an nxn matrix
%   b is an nx1 vector
n = size(A,1);

for c = 1:(n-1)
   for r = (c+1):n
      m = A(r,c)/A(c,c); 
      for k = c+1:n
         A(r,k) = A(r,k) - m*A(c,k); 
      end
      b(r) = b(r) - m*b(c);
      A(r,c)=0;
   end
end


end

