% Paint_w0_2color.m

% load data from dat directory and draw a graph for ionization rate
% dependence on intensity at different g2/g1 ratio values

% Run Calculate_w0_2color.m in order to fill dat directory with data

% Inset: comparison with tunnel ionization rate from one-color Keldysh theory

% Two-color case



clear all
close all


str='2color_1';
g1=load(['dat/g1_',str,'.dat']);
K.eps0=8.85*10^-12;
K.me=9.109383*(10.0^-31);
K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
Ua_Ar=15.6*K.qe;
K.c=3*10^8;
lambda1=800*10^-9;

w1=2*pi*K.c/lambda1;
I=Ua_Ar/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2

g2=g1;
eps1=10^-5;
rodiklis=2*(2*Ua_Ar/K.h)/3./(sqrt(g1+g2+eps1))/w1;
f1_tunnel=sqrt(6*pi)/2*sqrt(Ua_Ar/K.h*w1.*sqrt(g1+g2+eps1)).*exp(-rodiklis.*(1-1/10./(g1+g2+eps1)))/10^15;


figure('Position',[100,100,600,800])

hold on
colors=['m-';'r-';'g-';'b-'];
g_ratio=[0.0001,1,0.5,0.25,0.125];
f=zeros(5,length(g1));

for i_ratio=0:4

str=['2color_',num2str(i_ratio)];
EEE_aa_n=load(['dat/waa_',str,'.dat']);
EEE_ama_n=load(['dat/wama_',str,'.dat']);
EEE_bb_n=load(['dat/wbb_',str,'.dat']);
EEE_bmb_n=load(['dat/wbmb_',str,'.dat']);
EEE_aa=zeros(length(EEE_aa_n(:,1)),1);
EEE_ama=zeros(length(EEE_ama_n(:,1)),1);
EEE_bb=zeros(length(EEE_bb_n(:,1)),1);
EEE_bmb=zeros(length(EEE_bmb_n(:,1)),1);


EEE_ab_n=load(['dat/wab_',str,'.dat']);
EEE_amb_n=load(['dat/wamb_',str,'.dat']);
EEE_mab_n=load(['dat/wmab_',str,'.dat']);
EEE_mamb_n=load(['dat/wmamb_',str,'.dat']);
EEE_ab=zeros(length(EEE_ab_n(:,1)),1);
EEE_amb=zeros(length(EEE_amb_n(:,1)),1);
EEE_mab=zeros(length(EEE_mab_n(:,1)),1);
EEE_mamb=zeros(length(EEE_mamb_n(:,1)),1);

for ig=1:length(EEE_aa_n(:,end))

EEE_aa(ig)=sum(EEE_aa_n(ig,:));
EEE_ama(ig)=sum(EEE_ama_n(ig,:));
EEE_bb(ig)=sum(EEE_bb_n(ig,:));
EEE_bmb(ig)=sum(EEE_bmb_n(ig,:));


EEE_ab(ig)=sum(EEE_ab_n(ig,:));
EEE_amb(ig)=sum(EEE_amb_n(ig,:));
EEE_mab(ig)=sum(EEE_mab_n(ig,:));
EEE_mamb(ig)=sum(EEE_mamb_n(ig,:));


end
if i_ratio>0
f(i_ratio,:)=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15;


f(i_ratio,:)=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15+EEE_ab/10^15+EEE_amb/10^15+EEE_mab/10^15+EEE_mamb/10^15;

plot(I*(1+g_ratio(i_ratio+1)),f(i_ratio,:),colors(i_ratio,1:2),'Linewidth',2)
else
 f0=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15;   
 
 
 f0=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15+EEE_ab/10^15+EEE_amb/10^15+EEE_mab/10^15+EEE_mamb/10^15;
end

end




plot([0.6,1,1,0.6,0.6]*max(I),[0.05,0.05,0.5,0.5,0.05],'k-')

hold off
ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('Intensity of FH+SH (W/cm^2)','Fontsize',15);

xlim([min(I),max(I)])
ylim([10^-20,1])
text(10^15, 10^1,'(a)','FontSize',20)
set(gcf,'Color','w')

set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

legend({'g_2=g_1','g_2=g_1/2','g_2=g_1/4','g_2=g_1/8'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)
box on

axes('Position',[.55 .2 .3 .2])
box on






plot(I*(1+1/1),f(1,:),'m-','Linewidth',2)
hold on
plot(I*(1+1/2),f(2,:),'r-','Linewidth',2)
plot(I*(1+1/4),f(3,:),'g-','Linewidth',2)
plot(I*(1+1/8),f(4,:),'b-','Linewidth',2)

plot(I*(1+0),f0,'k-','Linewidth',1.5)
plot(I(1:2:end)*(1+1),f1_tunnel(1:2:end),'ko','Linewidth',1)


hold off
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlim([max(I)*0.6,max(I)])
ylim([0.05,0.5])
set(gca,'Fontsize',12)



print('pngs/Fig_w0_2color_a.png','-dpng','-r600')


