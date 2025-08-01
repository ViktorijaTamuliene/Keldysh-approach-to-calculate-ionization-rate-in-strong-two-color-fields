% Paint_SaddlePoint2.m
%plot dependednces of \alpha and \beta on g_1 at different g_2 values

clear all
close all



g1=0.01:0.01:20;

one=1+0*g1;
figure(1)

g2=0.1;

alpha=sqrt(-1/2/g2*(g1+g2-sqrt((g1+g2).^2+4*g2)));
beta=sqrt(1/2/g2*(g1+g2+sqrt((g1+g2).^2+4*g2)));

gamma=1./sqrt(g1); % Keldysh parameter

plot(g1,beta,'b-','LineWidth',4)
hold on
plot(g1,alpha,'r-','LineWidth',4)
plot(g1,gamma,'k--','LineWidth',2)


legend({'\beta','\alpha','\gamma_{Keldysh}'},'Location','northwest')
%title('g_2=0.1')


text(18,18,'(a)','Fontsize',20)

xlim([0 20])
ylim([0 20])
xlabel('g_1','Fontsize',15)
ylabel('\alpha, \beta','Fontsize',15)
set(gca,'Fontsize',15)
hold off
print('pngs/Fig_saddle2_a.png','-dpng','-r600')

figure(2)

g2=1;

alpha=sqrt(-1/2/g2*(g1+g2-sqrt((g1+g2).^2+4*g2)));
beta=sqrt(1/2/g2*(g1+g2+sqrt((g1+g2).^2+4*g2)));



plot(g1,beta,'b-','LineWidth',4)
hold on
plot(g1,alpha,'r-','LineWidth',4)
plot(g1,gamma,'k--','LineWidth',2)


legend({'\beta','\alpha','\gamma_{Keldysh}'},'Location','northwest')
%title('g_2=1')


text(18,8,'(b)','Fontsize',20)

xlim([0 20])
ylim([0 10])
xlabel('g_1','Fontsize',15)
ylabel('\alpha, \beta','Fontsize',15)
set(gca,'Fontsize',15)
hold off
print('pngs/Fig_saddle2_b.png','-dpng','-r600')




figure(3)

g2=10;
alpha=sqrt(-1/2/g2*(g1+g2-sqrt((g1+g2).^2+4*g2)));
beta=sqrt(1/2/g2*(g1+g2+sqrt((g1+g2).^2+4*g2)));



plot(g1,beta,'b-','LineWidth',4)
hold on
plot(g1,alpha,'r-','LineWidth',4)
g2=500;
alpha=sqrt(-1/2/g2*(g1+g2-sqrt((g1+g2).^2+4*g2)));
beta=sqrt(1/2/g2*(g1+g2+sqrt((g1+g2).^2+4*g2)));
plot(g1,beta,'b--','LineWidth',2)
hold on
plot(g1,alpha,'r--','LineWidth',2)

legend({'\beta','\alpha','\beta (g_2>>1)','\alpha (g_2>>1)'},'Location','northwest')
%title('g_2=10')


text(18,4,'(c)','Fontsize',20)

xlim([0 20])
ylim([0 5])
xlabel('g_1','Fontsize',15)
ylabel('\alpha, \beta','Fontsize',15)
set(gca,'Fontsize',15)
hold off
print(['pngs/Fig_saddle2_c.png'],'-dpng','-r600')


