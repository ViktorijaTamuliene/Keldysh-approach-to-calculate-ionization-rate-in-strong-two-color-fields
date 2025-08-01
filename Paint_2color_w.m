% Paint_2color_w.m

% load data from datw directory and draw a graph for ionization rate
% dependence on wavelength at different g2/g1 ratio as well as intensity values

% Run Calculate_w0_2color_w.m in order to fill datw directory with data

% Two-color case


clear all
close all



K.eps0=8.85*10^-12;
K.me=9.109383*(10.0^-31);
K.h=1.054571817*10^-34;
K.qe=1.6*10^-19;
Ua_Ar=15.6*K.qe;
K.c=3*10^8;
lambda1=800*10^-9;

w1=2*pi*K.c/lambda1;
g1=0.1;
I=Ua_Ar/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2
I_0=I;
disp(['I_0: ',num2str(I_0*10^-15),' *10^{15} W/cm^2']);

g1=1;
I=Ua_Ar/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2
I_1=I;
disp(['I_1: ',num2str(I_1*10^-15),' *10^{15} W/cm^2']);

g1=5;
I=Ua_Ar/2.*g1/K.qe^2*2*K.c*K.eps0*K.me*w1^2/10^4; %Intensity W/cm^2
I_2=I;
disp(['I_2: ',num2str(I_2*10^-15),' *10^{15} W/cm^2']);


figure('Position',[100,100,600,800])

hold on

for ig1=1:3

    for ig2=1:4

str0='datw';
str=['2color_',num2str(ig1),'_',num2str(ig2)];
if ig2==1
colorm='m-';
namem='g_2=g_1';
end
if ig2==2
colorm='r-';
namem='g_2=g_1/2';
end
if ig2==3
colorm='g-';
namem='g_2=g_1/4';
end
if ig2==4
colorm='b-';
namem='g_2=g_1/8';
end

w1a=load([str0,'/w1_',str,'.dat']);

K.c=3*10^8;
lambda1=800*10^-9;

w1=2*pi*K.c/lambda1;


EEE_aa_n=load([str0,'/waa_',str,'.dat']);
EEE_ama_n=load([str0,'/wama_',str,'.dat']);
EEE_bb_n=load([str0,'/wbb_',str,'.dat']);
EEE_bmb_n=load([str0,'/wbmb_',str,'.dat']);
EEE_aa=zeros(length(EEE_aa_n(:,1)),1);
EEE_ama=zeros(length(EEE_ama_n(:,1)),1);
EEE_bb=zeros(length(EEE_bb_n(:,1)),1);
EEE_bmb=zeros(length(EEE_bmb_n(:,1)),1);

for iw=1:length(EEE_aa_n(:,end))

EEE_aa(iw)=sum(EEE_aa_n(iw,:));
EEE_ama(iw)=sum(EEE_ama_n(iw,:));
EEE_bb(iw)=sum(EEE_bb_n(iw,:));
EEE_bmb(iw)=sum(EEE_bmb_n(iw,:));

end
%(EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15)

f=EEE_aa/10^15+EEE_ama/10^15+EEE_bb/10^15+EEE_bmb/10^15;
hp(ig2)=plot(2*pi*K.c./(w1.*w1a)*10^9,f,colorm,'Linewidth',2,'DisplayName',namem)

    end

    
        
    
end

legend([hp(1),hp(2),hp(3),hp(4)],'Fontsize',15,'Location','southwest')

hold off
ylabel('Ionization rate (fs^{-1})','Fontsize',15)
xlabel('\lambda_{FH} (nm)','Fontsize',15);

text(1200,0.1*10^-10,'I=1.3\times 10^{13} W/cm^2','Fontsize',15)
text(1200,10^-4,'I=1.3\times 10^{14} W/cm^2','Fontsize',15)
text(1200,10^-2,'I=6.6\times 10^{14} W/cm^2','Fontsize',15)
xlim([800/2,800*2])
ylim([10^-15 1])
%set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')


set(gca,'Fontsize',15)

box on

print('pngs/Fig_w0_2color_w_visi.png','-dpng','-r600')



