% Calculate_w0_SH.m

% Calculate ionization rate
% dependence on intensity at different g2 values
% One-color limit, SH at 800 nm

% Fill the dat directory with dat files.
% Plot the results with Paint_w0_1color.m

function Calculate_w0_SH
clear all
close all

K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
K.c=3*10^8;
K.Eh=4.3597*10^-18;
K.a0=5.2917*10^-11;
K.me=9.1093*10-31;

Ua_Ar=15.6*K.qe;% Potential, Argon

lambda1=800*10^-9;
P.w1=2*pi*K.c/lambda1;
P.I0=Ua_Ar;
g1a=[0.01:0.005:0.1, 0.1:0.05:1, 1:0.1:10];
na=(0:1:800);
EEE_aa=zeros(length(g1a),length(na));
EEE_ama=zeros(length(g1a),length(na));
EEE_bb=zeros(length(g1a),length(na));
EEE_bmb=zeros(length(g1a),length(na));

EEE_ab=zeros(length(g1a),length(na));
EEE_mab=zeros(length(g1a),length(na));
EEE_amb=zeros(length(g1a),length(na));
EEE_mamb=zeros(length(g1a),length(na));

for ig=1:length(g1a)
g2=4*g1a(ig);
disp(['g2: ',num2str(g2),', ', num2str(ig/length(g1a)*100),'% done']);
g1=0.0000000001;

inn=20*g2;
if inn<10
    inn=10;
end
for in=1:inn
n=na(in);

EEE_aa(ig,in)=w0aa(K,P,g1,g2,n);
EEE_ama(ig,in)=w0ama(K,P,g1,g2,n);
EEE_bb(ig,in)=w0bb(K,P,g1,g2,n);
EEE_bmb(ig,in)=w0bmb(K,P,g1,g2,n);

EEE_ab(ig,in)=w0ab(K,P,g1,g2,n);
EEE_mab(ig,in)=w0mab(K,P,g1,g2,n);
EEE_amb(ig,in)=w0amb(K,P,g1,g2,n);
EEE_mamb(ig,in)=w0mamb(K,P,g1,g2,n);


end
%aa=sum(EEE_aa(ig,:))
%ab=sum(EEE_ab(ig,:)+EEE_amb(ig,:)+EEE_mab(ig,:)+EEE_mamb(ig,:))
end
save('dat/g2_800.dat','g1a','-ascii');
save('dat/waa_g2_800.dat','EEE_aa','-ascii');
save('dat/wama_g2_800.dat','EEE_ama','-ascii');
save('dat/wbb_g2_800.dat','EEE_bb','-ascii');
save('dat/wbmb_g2_800.dat','EEE_bmb','-ascii');

save('dat/wab_g2_800.dat','EEE_ab','-ascii');
save('dat/wmab_g2_800.dat','EEE_mab','-ascii');
save('dat/wamb_g2_800.dat','EEE_amb','-ascii');
save('dat/wmamb_g2_800.dat','EEE_mamb','-ascii');
end