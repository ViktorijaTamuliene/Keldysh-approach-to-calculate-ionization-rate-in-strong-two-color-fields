% Calculate_w0_FH.m

% Calculate ionization rate
% dependence on intensity at different g1 values
% One-color limit, FH at 400 nm

% Fill the dat directory with dat files.
% Plot the results with Paint_w0_1color.m

function Calculate_w0_FH
clear all
close all

K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
K.c=3*10^8;
K.Eh=4.3597*10^-18;
K.a0=5.2917*10^-11;
K.me=9.1093*10-31;

Ua_Ar=15.6*K.qe;% Potential, Argon


lambda1=400*10^-9;
P.w1=2*pi*K.c/lambda1;
P.I0=Ua_Ar;
g1a=[0.01:0.005:0.1, 0.1:0.05:1, 1:0.1:10];
na=[0:1:400];
EEE_aa=zeros(length(g1a),length(na));
EEE_ama=zeros(length(g1a),length(na));
EEE_bb=zeros(length(g1a),length(na));
EEE_bmb=zeros(length(g1a),length(na));

EEE_ab=zeros(length(g1a),length(na));
EEE_mab=zeros(length(g1a),length(na));
EEE_amb=zeros(length(g1a),length(na));
EEE_mamb=zeros(length(g1a),length(na));

for ig=1:length(g1a)
g1=g1a(ig);

disp(['g1: ',num2str(g1),', ', num2str(ig/length(g1a)*100),'% done']);
g2=0.0000000001;
inn=40*g1;
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

%ama=sum(EEE_ama(ig,:))
%ab=sum(EEE_ab(ig,:)+EEE_amb(ig,:)+EEE_mab(ig,:)+EEE_mamb(ig,:))
end
save('dat/g1_400.dat','g1a','-ascii');
save('dat/waa_g1_400.dat','EEE_aa','-ascii');
save('dat/wama_g1_400.dat','EEE_ama','-ascii');
save('dat/wbb_g1_400.dat','EEE_bb','-ascii');
save('dat/wbmb_g1_400.dat','EEE_bmb','-ascii');

save('dat/wab_g1_400.dat','EEE_ab','-ascii');
save('dat/wmab_g1_400.dat','EEE_mab','-ascii');
save('dat/wamb_g1_400.dat','EEE_amb','-ascii');
save('dat/wmamb_g1_400.dat','EEE_mamb','-ascii');
end