% dawson_m.m
% Calculate Dawson function Phi(x)

function f= dawson_m(x)

t = (0:0.001:1)*x;
ft = exp(t.^2-x^2);
f = trapz(t,ft);