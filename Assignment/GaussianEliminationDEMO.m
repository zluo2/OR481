clear;clc;

A = rand(3,3)

xtrue = [1;1;1]

b = A*xtrue

[Ahat,bhat] = elimination(A,b)

xhat = backsub(Ahat,bhat)

RFE = norm(xhat-xtrue)/norm(xtrue)
RBE = norm(A*xhat - b)/norm(b)

EMF = RFE/RBE