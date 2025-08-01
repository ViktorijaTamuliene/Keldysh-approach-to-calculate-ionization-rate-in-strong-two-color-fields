% Paint_w0n_1color.m
% Load data from dat directory and draw a graphs for ionization rate
% dependence on summation number n.
% One-color limits.

% Run Calculate_w0_FH.m  and Calculate_w0_SH.m in order to fill dat directory 
% with necessary data.

clear all
close all


g1_400=load('dat/g1_400.dat');
EEE_g1_400_aa_n=load('dat/waa_g1_400.dat');
EEE_g1_400_ama_n=load('dat/wama_g1_400.dat');
EEE_g1_400_bb_n=load('dat/wbb_g1_400.dat');
EEE_g1_400_bmb_n=load('dat/wbmb_g1_400.dat');
EEE_g1_400_aa=zeros(length(EEE_g1_400_aa_n(:,1)),1);
EEE_g1_400_ama=zeros(length(EEE_g1_400_ama_n(:,1)),1);
EEE_g1_400_bb=zeros(length(EEE_g1_400_bb_n(:,1)),1);
EEE_g1_400_bmb=zeros(length(EEE_g1_400_bmb_n(:,1)),1);


EEE_g2_800_aa_n=load('dat/waa_g2_800.dat');
EEE_g2_800_ama_n=load('dat/wama_g2_800.dat');
EEE_g2_800_bb_n=load('dat/wbb_g2_800.dat');
EEE_g2_800_bmb_n=load('dat/wbmb_g2_800.dat');
EEE_g2_800_aa=zeros(length(EEE_g2_800_aa_n(:,1)),1);
EEE_g2_800_ama=zeros(length(EEE_g2_800_ama_n(:,1)),1);
EEE_g2_800_bb=zeros(length(EEE_g2_800_bb_n(:,1)),1);
EEE_g2_800_bmb=zeros(length(EEE_g2_800_bmb_n(:,1)),1);


EEE_g2_800_ab_n=load('dat/wab_g2_800.dat');
EEE_g2_800_mab_n=load('dat/wmab_g2_800.dat');
EEE_g2_800_amb_n=load('dat/wamb_g2_800.dat');
EEE_g2_800_mamb_n=load('dat/wmamb_g2_800.dat');

EEE_g2_800_ab=zeros(length(EEE_g2_800_ab_n(:,1)),1);
EEE_g2_800_mab=zeros(length(EEE_g2_800_mab_n(:,1)),1);
EEE_g2_800_amb=zeros(length(EEE_g2_800_amb_n(:,1)),1);
EEE_g2_800_mamb=zeros(length(EEE_g2_800_mamb_n(:,1)),1);


K.eps0=8.85*10^-12;
K.me=9.109383*(10.0^-31);
K.qe=1.6*10^-19;
Ua_Ar=15.6*K.qe;
K.c=3*10^8;
lambda1=800*10^-9;

w1=2*pi*K.c/lambda1;


g1=g1_400;

[~,n_5]=min(abs(g1-5));

%400 - n_s=18
%800 - n_s=36


I=Ua_Ar/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2
disp(['Intensity: ',num2str(I(n_5)*10^-15),' 10^15 W/cm^2']);



for ig=1:length(EEE_g1_400_aa_n(:,end))

EEE_g1_400_aa(ig)=sum(EEE_g1_400_aa_n(ig,:));
EEE_g1_400_ama(ig)=sum(EEE_g1_400_ama_n(ig,:));
EEE_g1_400_bb(ig)=sum(EEE_g1_400_bb_n(ig,:));
EEE_g1_400_bmb(ig)=sum(EEE_g1_400_bmb_n(ig,:));

EEE_g2_800_aa(ig)=sum(EEE_g2_800_aa_n(ig,:));
EEE_g2_800_ama(ig)=sum(EEE_g2_800_ama_n(ig,:));
EEE_g2_800_bb(ig)=sum(EEE_g2_800_bb_n(ig,:));
EEE_g2_800_bmb(ig)=sum(EEE_g2_800_bmb_n(ig,:));

EEE_g2_800_ab(ig)=sum(EEE_g2_800_ab_n(ig,:));
EEE_g2_800_mab(ig)=sum(EEE_g2_800_mab_n(ig,:));
EEE_g2_800_amb(ig)=sum(EEE_g2_800_amb_n(ig,:));
EEE_g2_800_mamb(ig)=sum(EEE_g2_800_mamb_n(ig,:));
end


figure('Position',[100,100,800,800])

subplot(2,1,1)
[~,nn]=size(EEE_g1_400_aa_n);
ns=18;
nna=(0:1:nn-1)+ns;

plot(nna,EEE_g1_400_aa_n(n_5,:)/10^15+0*EEE_g1_400_ama_n(n_5,:)/10^15,'r-','Linewidth',2)

ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('n','Fontsize',15);

%set(gca, 'XScale', 'log')
%set(gca, 'YScale', 'log')

%legend({'w_{n0\alpha,\alpha} (FH, I=0.65 10^{15} W/cm^2)'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)
xlim([10 100])
hold on

% print('Fig_w0_n_FH.png','-dpng','-r600')
% 
% figure('Position',[100,100,800,600])
[~,nn]=size(EEE_g2_800_aa_n);
ns=36;
nna=(0:1:nn-1)+ns;

plot(nna,EEE_g2_800_aa_n(n_5,:)/10^15+EEE_g2_800_ama_n(n_5,:)/10^15+EEE_g2_800_bb_n(n_5,:)/10^15+EEE_g2_800_bmb_n(n_5,:)/10^15,'b-','Linewidth',2)



ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('n','Fontsize',15);

%set(gca, 'XScale', 'log')
%set(gca, 'YScale', 'log')

legend({'w_{n0\alpha,\alpha} (FH)','w_{n0\alpha,\alpha}+w_{n0\alpha,-\alpha}+w_{n0\beta,\beta}+w_{n0\beta,-\beta} (SH)'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)
xlim([10 100])
ylim([0 1]*0.3)
text(90,0.2,'(a)','Fontsize',20)

subplot(2,2,3)

plot(nna,EEE_g2_800_aa_n(n_5,:)/10^15,'b-','Linewidth',2)
hold on
plot(nna,EEE_g2_800_ama_n(n_5,:)/10^15,'m-','Linewidth',2)

legend({'w_{n0\alpha,\alpha} (SH)','w_{n0\alpha,-\alpha} (SH)'},'Fontsize',15,'Location','northwest')

ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('n','Fontsize',15);

set(gca,'Fontsize',15)
xlim([30 100])
ylim([-0.5 0.7]*0.25)
text(90,0.1,'(b)','Fontsize',20)

subplot(2,2,4)

plot(nna,EEE_g2_800_bb_n(n_5,:)/10^15,'g-','Linewidth',2)
hold on
plot(nna,EEE_g2_800_bmb_n(n_5,:)/10^15,'r-','Linewidth',2)

legend({'w_{n0\beta,\beta} (SH)','w_{n0\beta,-\beta} (SH)'},'Fontsize',15,'Location','northwest')

%ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('n','Fontsize',15);

set(gca,'Fontsize',15)
xlim([30 100])
ylim([-0.5 0.7]*0.25)
text(90,0.1,'(c)','Fontsize',20)

print('pngs/Fig_w0_n_FH_SH.png','-dpng','-r600')


