% Paint_SaddleContour.m
% Paints saddle point integration contour

clear all
close all


x1=-0.9:0.01:0.9;
y1=0.1+0*x1;

x2=x1;
y2=-0.1+0*x2;

angle3a=atan(-0.1/-0.1)+pi/2;
angle3b=atan(-0.1/0.1)-pi/2;

angle3=angle3b:0.01:angle3a;

x3=0.15*cos(angle3)+1;
y3=0.15*sin(angle3);

x5=0.15*cos(angle3)-2.5;
y5=0.15*sin(angle3);

angle4a=atan(0.1/0.1);
angle4b=2*pi-angle4a;

angle4=angle4a:0.01:angle4b;

x4=0.15*cos(angle4)-1;
y4=0.15*sin(angle4);

x6=0.15*cos(angle4)+2.5;
y6=0.15*sin(angle4);

anglespla=-pi;
anglesplb=0;
anglespl=anglespla:0.01:anglesplb;
xspl=0.15*cos(anglespl);
yspl=0.15*sin(anglespl)+1.5;

anglesma=pi;
anglesmb=2*pi;
anglesm=anglesma:0.01:anglesmb;
xsm=0.15*cos(anglesm);
ysm=-0.15*sin(anglesm)-1.5;

x1spl=(-2.5:0.01:-0.15);
x2spl=(0.15:0.01:2.5);
y1spl=0*x1spl+1.5;
y2spl=0*x2spl+1.5;

x1sm=(-2.5:0.01:-0.15);
x2sm=(0.15:0.01:2.5);
y1sm=0*x1sm-1.5;
y2sm=0*x2sm-1.5;

anglesplab=-pi/2;
anglesplbb=pi/2;
anglesplb2=anglesplab:0.01:anglesplbb;
xsplb=-0.15*cos(anglesplb2)+2.5;
ysplb=0.15*sin(anglesplb2)+0;

xsplbm=0.15*cos(anglesplb2)-2.5;
ysplbm=0.15*sin(anglesplb2)+0;

x1splb=[2.5,2.5];
y1splb=[1.5,0.15];
x2splb=[2.5,2.5];
y2splb=[-1.5,-0.15];

x3splb=-[2.5,2.5];
y3splb=[1.5,0.15];
x4splb=-[2.5,2.5];
y4splb=[-1.5,-0.15];

plot(x1,y1,'g-','Linewidth',2)
hold on
plot(x2,y2,'g-','Linewidth',2)
plot(x3,y3,'g-','Linewidth',2)
plot(x4,y4,'g-','Linewidth',2)
%plot(x5,y5,'b-','Linewidth',2)
%plot(x6,y6,'b-','Linewidth',2)

plot(xspl,yspl,'b-','Linewidth',2)
plot(xsm,ysm,'b-','Linewidth',2)

plot(x1spl,y1spl,'b-','Linewidth',2)
plot(x2spl,y2spl,'b-','Linewidth',2)

plot(x1sm,y1sm,'b-','Linewidth',2)
plot(x2sm,y2sm,'b-','Linewidth',2)

%plot(xc1,yc1,'b-','Linewidth',2)
%plot(xc2,yc2,'b-','Linewidth',2)

%plot(xc3,yc3,'b-','Linewidth',2)
%plot(xc4,yc4,'b-','Linewidth',2)


plot(xsplb,ysplb,'b-','Linewidth',2)
plot(xsplbm,ysplbm,'b-','Linewidth',2)

plot(x1splb,y1splb,'b-','Linewidth',2)
plot(x2splb,y2splb,'b-','Linewidth',2)

plot(x3splb,y3splb,'b-','Linewidth',2)
plot(x4splb,y4splb,'b-','Linewidth',2)

plot([-4 4],[0 0],'k--','Linewidth',1)
plot([0 0],[-3 3],'k--','Linewidth',1)

plot(1,0,'kx','Linewidth',2)
plot(-1,0,'kx','Linewidth',2)

plot([-1,1],[0,0],'k-','LineWidth',1.5)

text(4.05,0,'Re(u)','Fontsize',12)
text(0.1,2.5,'Im(u)','Fontsize',12)

text(3.0,1.8,'\rightarrow+\infty','Fontsize',12)
text(-4,1.8,'-\infty\leftarrow','Fontsize',12)

text(0.1,1.8,'u_{s-,+}','Fontsize',12)
text(0.1,-1.8,'u_{s-,-}','Fontsize',12)

text(-3.3,0.3,'u_{s+,-}','Fontsize',12)
text(2.6,0.3,'u_{s+,+}','Fontsize',12)


text(-0.5,0.5,'I','Fontsize',12,'Color','g')
text(-2.3,1.8,'II','Fontsize',12,'Color','b')

quiver(1,1.5,1.5,0,'Linewidth',2,'Color','b','MaxHeadSize',0.5,'AutoScaleFactor',1)
quiver(-1,-1.5,-1.5,0,'Linewidth',2,'Color','b','MaxHeadSize',0.5,'AutoScaleFactor',1)

quiver(-0.9,0.1,1.5,0,'Linewidth',2,'Color','g','MaxHeadSize',0.5,'AutoScaleFactor',1)
quiver(0.9,-0.1,-1.5,0,'Linewidth',2,'Color','g','MaxHeadSize',0.5,'AutoScaleFactor',1)

xlim([-5 5])
ylim([-3 3])

pbaspect([5 3 1])
set(gcf,'Color','w')

axis off
print('pngs/Fig_contour.png','-dpng','-r600')