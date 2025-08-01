% Paint_SaddlePoint1.m
% plot function \psi(u_s^2) for different g_1 and g_2 values.


clear all
close all


func=@(g1,g2,us2)(1+g1*us2+g2*us2.*(1-us2));


us2=-20:0.1:20;


figure(1)
g2=0.1;


hold on


g1=0.1;
plot(us2,func(g1,g2,us2),'b','Linewidth',2)
g1=1;
plot(us2,func(g1,g2,us2),'g','Linewidth',2)
g1=10;
plot(us2,func(g1,g2,us2),'m','Linewidth',2)

plot([0 0],[-10 10]*2,'--k','Linewidth',1.5)
plot([1 1],[-10 10]*2,'--b','Linewidth',1.5)
hleg=legend({'g_1=0.1','g_1=1','g_1=10','u_s^2=0','u_s^2=1'},'Location','northwest')
%title('g_2=0.1')

plot(us2,0*us2,'-k','Linewidth',2)
hleg.String(end) = [];

text(15,15,'(a)','Fontsize',20)

xlim([-20 20])
ylim([-20 20])
xlabel('u_s^2','Fontsize',15)
ylabel('\psi(u_s^2)','Fontsize',15)
set(gca,'Fontsize',15)
print('pngs/Fig_saddle_a.png','-dpng','-r600')

figure(2)
g2=1;

hold on


g1=0.1;
plot(us2,func(g1,g2,us2),'b','Linewidth',2)
g1=1;
plot(us2,func(g1,g2,us2),'g','Linewidth',2)
g1=10;
plot(us2,func(g1,g2,us2),'m','Linewidth',2)

plot([0 0],[-10 10]*2,'--k','Linewidth',1.5)
plot([1 1],[-10 10]*2,'--b','Linewidth',1.5)
hleg=legend({'g_1=0.1','g_1=1','g_1=10','u_s^2=0','u_s^2=1'},'Location','northwest')
%title('g_2=1')

plot(us2,0*us2,'-k','Linewidth',2)
hleg.String(end) = [];
text(15,15,'(b)','Fontsize',20)

xlim([-20 20])
ylim([-20 20])
xlabel('u_s^2','Fontsize',15)
ylabel('\psi(u_s^2)','Fontsize',15)
set(gca,'Fontsize',15)
print('pngs/Fig_saddle_b.png','-dpng','-r600')


figure(3)
g2=10;


hold on

g1=0.1;
plot(us2,func(g1,g2,us2),'b','Linewidth',2)
g1=1;
plot(us2,func(g1,g2,us2),'g','Linewidth',2)
g1=10;
plot(us2,func(g1,g2,us2),'m','Linewidth',2)


plot([0 0],[-10 10]*2,'--k','Linewidth',1.5)
plot([1 1],[-10 10]*2,'--b','Linewidth',1.5)
hleg=legend({'g_1=0.1','g_1=1','g_1=10','u_s^2=0','u_s^2=1'},'Location','northwest')
%title('g_2=10')

plot(us2,0*us2,'-k','Linewidth',2)

hleg.String(end) = [];
text(15,15,'(c)','Fontsize',20)

xlim([-20 20])
ylim([-20 20])
xlabel('u_s^2','Fontsize',15)
ylabel('\psi(u_s^2)','Fontsize',15)
set(gca,'Fontsize',15)

print('pngs/Fig_saddle_c.png','-dpng','-r600')

