function [ ys ] = polyeval(as,xs)
% Evaluate Vandermonde Polynomial

ys = as(1);
for i = 1:length(as)-1
   ys = ys + as(i+1)*xs.^i; 
end

end

