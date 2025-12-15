% Paint_w0_2color_atoms.m

% load data from dat directory and draw a graph for ionization rate
% dependence on intensity at g2/g1=1 ratio for H, He, Ar and Xe atoms

% Run Calculate_w0_2color_atoms.m in order to fill dat directory with data



% Two-color case



clear all
close all



K.eps0=8.85*10^-12;
K.me=9.109383*(10.0^-31);
K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
Ua_atoms=[13.6,24.6,15.6,11.14]*K.qe;% Potential, H, He, Ar and Xe atoms
K.c=3*10^8;
lambda1=800*10^-9;

w1=2*pi*K.c/lambda1;




figure('Position',[100,100,600,800])

hold on
colors=['m-';'r-';'g-';'b-'];
g_ratio=1;

str=['2color_atoms_',num2str(1)];
g1=load(['dat/g1_',str,'.dat']);
f=zeros(4,length(g1));

for i_atoms=[4,1,3,2]


str=['2color_atoms_',num2str(i_atoms)];
g1=load(['dat/g1_',str,'.dat']);

I=Ua_atoms(i_atoms)/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2

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

f(i_atoms,:)=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15;


f(i_atoms,:)=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15+EEE_ab/10^15+EEE_amb/10^15+EEE_mab/10^15+EEE_mamb/10^15;

plot(I*(1+g_ratio),f(i_atoms,:),colors(i_atoms,1:2),'Linewidth',2)


end




%plot([0.6,1,1,0.6,0.6]*max(I),[0.05,0.05,0.5,0.5,0.05],'k-')

hold off
ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('Intensity of FH+SH (W/cm^2)','Fontsize',15);

xlim([min(I)*1.2,max(I)])
ylim([10^-20,1])

set(gcf,'Color','w')

set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')



legend({'Xe','H','Ar','He'},'Fontsize',15,'Location','northwest')
set(gca,'Fontsize',15)
box on





print('pngs/Fig_w0_2color_atoms.png','-dpng','-r600')


% Indices:

% 1  -  H atom

% 2  -  He atom

% 3  -  Ar atom

% 4  -  Xe atom