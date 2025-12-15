function aa=w0bb(K,P,g1,g2,n)

% function to calculate w_{\beta,\beta}

alpha=abs(imag(sqrt(1./(2*g2).*(g1+g2-sqrt((g1+g2).^2+4*g2)))));
beta=abs(sqrt(1./(2*g2).*(g1+g2+sqrt((g1+g2).^2+4*g2))));
I0s=2*P.I0*(1/2+g1/4+g2/16);

ns=fix(I0s/(K.h*P.w1)+1);
n1=ns+n;

%d0=2*P.I0*K.Eh*K.h/K.me/K.qe^4;
d0=2*P.I0/K.Eh*(K.Eh/K.h);
d1=sqrt(d0);

c1=sqrt(2*P.I0/K.h*P.w1)/beta^2/(-1+beta^2)/((g1+g2)^2+4*g2)*sqrt(2*(n1-I0s/K.h/P.w1));
c2=exp(-2*n1*acosh(beta)-g1/2/P.w1*d0*beta*sqrt(-1+beta^2)+g2/8/P.w1*d0*beta*sqrt(-1+beta^2)*(-1+2*beta^2));

x=(-1:0.001:1);
c3x=exp(beta/sqrt(-1+beta^2)*(2*(n1-I0s/K.h/P.w1))*(x.^2-g2/g1*(-1+beta^2)*(1-x.^2)/2)/(1+g2/g1*(1-2*beta^2))   )...
    .*cosh(2*x*d1*sqrt(g1/P.w1)*sqrt(2*(n1-I0s/K.h/P.w1))*sqrt(-1+beta^2))...
    .*besseli(0,beta*sqrt(-1+beta^2)*g2/g1*(n1-I0s/K.h/P.w1)*(1-x.^2)/(1+g2/g1*(1-2*beta^2)));
c3=trapz(x,c3x);
aa=c1*c2*c3;
end













