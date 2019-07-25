function [ as ] = polyinterp(xs,ys)
%Vandermone interpolation

%%% Build the Vandermonde matrix
V = ones(size(xs));
for i = 1:length(xs)-1
    V = [V xs.^i];
end
as = V\ys;


end

