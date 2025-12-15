function aa=w0aa(K,P,g1,g2,n)

% function to calculate w_{\alpha,\alpha}

alpha=abs(imag(sqrt(1./(2*g2).*(g1+g2-sqrt((g1+g2).^2+4*g2)))));
beta=abs(sqrt(1./(2*g2).*(g1+g2+sqrt((g1+g2).^2+4*g2))));
I0s=2*P.I0*(1/2+g1/4+g2/16);

ns=fix(I0s/(K.h*P.w1)+1);
n1=ns+n;


d0=2*P.I0/K.Eh*(K.Eh/K.h);


c1=sqrt(2*P.I0/K.h*P.w1)*2/alpha^2/(1+alpha^2)/((g1+g2)^2+4*g2);
c2=(1+alpha^2)^(1/4)/sqrt(alpha)/sqrt(1+g2/g1*(1+alpha^2))*sqrt(1+g2/g1*(1+2*alpha^2));

c3=exp(-2*n1*asinh(alpha)+g1/2/P.w1*d0*alpha*sqrt(1+alpha^2)+g2/8/P.w1*d0*alpha*sqrt(1+alpha^2)*(1+2*alpha^2)+2*(n1-I0s/K.h/P.w1)/c2^2);

c4=dawson_m(sqrt(2*(n1-I0s/K.h/P.w1))/c2);


aa=c1*c2*c3*c4;
end