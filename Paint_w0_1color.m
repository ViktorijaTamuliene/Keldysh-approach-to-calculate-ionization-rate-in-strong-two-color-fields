% Paint_w0_1color.m
% Load data from dat directory and draw a graphs for ionization rate
% dependence on intensity.
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

I=Ua_Ar/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2



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


figure('Position',[100,100,600,800])

plot(I,EEE_g1_400_aa/10^15,'r-','Linewidth',2)
hold on

%plot(g1_400,EEE_g1_400_aa+EEE_g1_400_ama+EEE_g1_400_bb+EEE_g1_400_bmb,'r-','Linewidth',2)
plot(I,EEE_g1_400_aa/10^15+EEE_g1_400_ama/10^15,'ro','Linewidth',2)
hold off
ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('Intensity (W/cm^2)','Fontsize',15);

set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

legend({'w_{0\alpha,\alpha} (FH)','w_{0\alpha,\alpha}+w_{0\alpha,-\alpha} (FH)'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)

print('pngs/Fig_w0a.png','-dpng','-r600')



figure('Position',[100,100,600,800])

plot(I,EEE_g1_400_aa/10^15,'r-','Linewidth',2)
hold on

%plot(g1_400,EEE_g1_400_aa+EEE_g1_400_ama+EEE_g1_400_bb+EEE_g1_400_bmb,'r-','Linewidth',2)
plot(I,EEE_g2_800_aa/10^15+EEE_g2_800_ama/10^15+EEE_g2_800_bb/10^15+EEE_g2_800_bmb/10^15,'bo','Linewidth',2)
hold off
ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('Intensity (W/cm^2)','Fontsize',15);

set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

legend({'w_{0\alpha,\alpha} (FH)','w_{0\alpha,\alpha}+w_{0\alpha,-\alpha}+w_{0\beta,\beta}+w_{0\beta,-\beta} (SH)'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)

print('pngs/Fig_w0.png','-dpng','-r600')



figure('Position',[100,100,600,600])


hold on

plot(I,EEE_g1_400_ama/10^15,'r-','Linewidth',2)
plot(I,(EEE_g2_800_ab/10^15+EEE_g2_800_amb/10^15+EEE_g2_800_mab/10^15+EEE_g2_800_mamb/10^15),'bo','Linewidth',2)
hold off
ylabel('Part of ionization rate (fs^{-1})','Fontsize',15)
xlabel('Intensity (W/cm^2)','Fontsize',15);
ylim([-0.2,0.2])

legend({'w_{0\alpha,-\alpha} (FH)','w_{0\alpha,\beta}+w_{0\alpha,-\beta}+w_{0-\alpha,\beta}+w_{0-\alpha,-\beta} (SH)'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)

print('pngs/Fig_w0_ab.png','-dpng','-r600')


