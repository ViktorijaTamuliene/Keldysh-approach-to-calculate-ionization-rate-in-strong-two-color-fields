function aa=w0amb(K,P,g1,g2,n)

% function to calculate w_{\alpha,-\beta}

alpha=abs(imag(sqrt(1./(2*g2).*(g1+g2-sqrt((g1+g2).^2+4*g2)))));
beta=abs(sqrt(1./(2*g2).*(g1+g2+sqrt((g1+g2).^2+4*g2))));
I0s=2*P.I0*(1/2+g1/4+g2/16);

ns=fix(I0s/(K.h*P.w1)+1);
n1=ns+n;

%d0=2*P.I0*K.Eh*K.h/K.me/K.qe^4;
d0=2*P.I0/K.Eh*(K.Eh/K.h);
d1=sqrt(d0);

c1=(1/2/pi)*sqrt(2*P.I0/K.h*P.w1)/alpha/beta/sqrt(1+alpha^2)/sqrt(beta^2-1)/((g1+g2)^2+4*g2)*(-1)^n1*sqrt(2*(n1-I0s/K.h/P.w1));
c2=1;

x=(-1:0.001:1);
phi=(0:0.01:1)*2*pi;
c3x=0*x;
for ix=1:length(x)
c3x(ix)=trapz(phi,exp(-n1*asinh(alpha)+g1/4/P.w1*d0*alpha*sqrt(1+alpha^2)+g2/16/P.w1*d0*alpha*sqrt(1+alpha^2)*(1+2*alpha^2)...
    -n1*acosh(beta)-g1/4/P.w1*d0*beta*sqrt(-1+beta^2)+g2/16/P.w1*d0*beta*sqrt(-1+beta^2)*(-1+2*beta^2) ...
    +(n1-I0s/K.h/P.w1)*alpha/sqrt(1+alpha^2)*(x(ix)+sqrt(g2/g1)*sqrt(1-x(ix)^2)*cos(phi)*sqrt(1+alpha^2)).^2/...
    (1+g2/g1*(1+2*alpha^2)) ...
    +(n1-I0s/K.h/P.w1)*beta/sqrt(beta^2-1)*(x(ix)^2-g2/g1*(1-x(ix)^2)*cos(phi).^2*(beta^2-1))/...
    (1+g2/g1*(1-2*beta^2)) ...
    +d1*sqrt(g1/P.w1)*x(ix)*sqrt(2*(n1-I0s/K.h/P.w1))*sqrt(beta^2-1)) ...
    .*cos(n1*pi/2-2*(n1-I0s/K.h/P.w1)*beta*sqrt(g2/g1)*x(ix)*sqrt(1-x(ix)^2)*cos(phi)/(1+g2/g1*(1-2*beta^2)) ...
    -d1*sqrt(g1/P.w1)*sqrt(2*(n1-I0s/K.h/P.w1))*sqrt(1+alpha^2) ...
    -d1*sqrt(g2/P.w1)/2*sqrt(2*(n1-I0s/K.h/P.w1))*sqrt(1-x(ix)^2)*cos(phi)*(alpha^2+beta^2)));

end

c3=trapz(x,c3x);
aa=c1*c2*c3;
end













