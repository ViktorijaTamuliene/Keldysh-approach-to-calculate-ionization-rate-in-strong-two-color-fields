% Calculate_wo_2color_w.m

% Calculate ionization rate
% dependence on wavelength at different g2/g1 ratio as well as sum intensity values

% Fill the dat directory with datw files.
% Plot the results with Paint_2color_w.m

% The calculation of w_{a,b} (a=\pm \alpha, b=\pm\beta) ionization rate was
% omitted. This part is time consuming and gives negligible impact.


function Calculate_w0_2color_w
clear all
close all

K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
K.c=3*10^8;
K.Eh=4.3597*10^-18;
K.a0=5.2917*10^-11;
K.me=9.1093*10-31;

Ua_Ar=15.6*K.qe;% Potential, Argon
g10a=[0.1,1,5];
% 1  -  g2=1*g1
% 2  -  g2=0.5*g1
% 3  -  g2=0.25*g1
% 4  -  g2=0.125*g1

ng2=[1,0.5,0.25,0.125];

for ig1=1:length(g10a)
    g10=g10a(ig1);

    for ig2=1:length(ng2)
        
lambda1=800*10^-9;
w10=2*pi*K.c/lambda1;
P.I0=Ua_Ar;
w1a=(0.5:0.0025:2);
na=(0:1:800);
EEE_aa=zeros(length(w1a),length(na));
EEE_ama=zeros(length(w1a),length(na));
EEE_bb=zeros(length(w1a),length(na));
EEE_bmb=zeros(length(w1a),length(na));

EEE_ab=zeros(length(w1a),length(na));
EEE_mab=zeros(length(w1a),length(na));
EEE_amb=zeros(length(w1a),length(na));
EEE_mamb=zeros(length(w1a),length(na));


for iw=1:length(w1a)
g1=1/ng2(ig2)/(1/ng2(ig2)+1)*g10/w1a(iw)^2; 
g2=g1*ng2(ig2);
disp(['g1: ',num2str(g10),', g2/g1: ', num2str(ng2(ig2)),', ',num2str(iw/length(w1a)*100),'% done']);

P.w1=w1a(iw)*w10;

inn=40*g1;
if inn<10
    inn=10;
end
for in=1:inn
n=na(in);

EEE_aa(iw,in)=w0aa(K,P,g1,g2,n);
EEE_ama(iw,in)=w0ama(K,P,g1,g2,n);
EEE_bb(iw,in)=w0bb(K,P,g1,g2,n);
EEE_bmb(iw,in)=w0bmb(K,P,g1,g2,n);

if isnan(EEE_ama(iw,in)) || isinf(EEE_ama(iw,in))
    EEE_ama(iw,in)=0;
end

if isnan(EEE_bb(iw,in)) || isinf(EEE_bb(iw,in))
    EEE_bb(iw,in)=0;
end

if isnan(EEE_bmb(iw,in)) || isinf(EEE_bmb(iw,in))
    EEE_bmb(iw,in)=0;
end




end
%aa=sum(EEE_aa(iw,:))
%ab=w0ab(K,P,g1,g2,0)
%ab=sum(EEE_ab(ig,:)+EEE_amb(ig,:)+EEE_mab(ig,:)+EEE_mamb(ig,:))
end
str=['2color_',num2str(ig1),'_',num2str(ig2)];

save(['datw/w1_',str,'.dat'],'w1a','-ascii');
save(['datw/waa_',str,'.dat'],'EEE_aa','-ascii');
save(['datw/wama_',str,'.dat'],'EEE_ama','-ascii');
save(['datw/wbb_',str,'.dat'],'EEE_bb','-ascii');
save(['datw/wbmb_',str,'.dat'],'EEE_bmb','-ascii');

    end
end
end
