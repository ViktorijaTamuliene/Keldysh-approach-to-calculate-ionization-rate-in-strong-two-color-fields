% Paint_WaveShapes.m
% Draws the wave shapes at g_2=g_1 and g_2=g_1/4

clear all
close all


figure("Position",[100,100,360,800])

om = 1; %angular frequency in arb. units

t=(0:0.01:1)*2*pi; % time in 1/om units
Ez1 = cos(om*t); % FH pump
Ex1 = cos(2*om*t); % SH pump,  g_2=g_1

Ez2 = cos(om*t); % FH pump
Ex2 = 0.5*cos(2*om*t); % SH pump, g_2=g_1/4

plot3(Ez1,Ex1,t,'b-','LineWidth',2)
hold on
plot3(Ez2,Ex2,t,'-','Color',[1,0.65,0],'LineWidth',2)
xlabel('E_z (arb. u.)','FontSize',20)
ylabel('E_x (arb. u.)','FontSize',20)
zlabel('t (units of 1/\omega)','FontSize',20)
set(gca,'FontSize',15)
set(gca,'BoxStyle','full')
set(gca,'LineWidth',1.5)
view(40,15)
xlim([-1,1])
ylim([-1,1])
zlim([0,1]*2*pi)
box on
text(1,1,7,'(b)','FontSize',20)
set(gcf,'Color','w')

print('pngs/Fig_w0_2color_b.png','-dpng','-r600')