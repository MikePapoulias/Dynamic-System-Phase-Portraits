warning off
clc

% phase portrait initialization
y1 = linspace(-10,10,20);
y2 = linspace(-10,10,20);
[x1,x2] = meshgrid(y1,y2);

u = zeros(size(x1));
v = zeros(size(x1));
t = 0; 

for i = 1:numel(x1)
    Yprime = odefun(t,[x1(i) x2(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end



% Prosomoiwsi_1 [x1=-5, x2=0]
figure("Name", sprintf("Prosomoiwsi_1(x1=-5, x2=0)"))
subplot(1,2,1);
quiver(x1,x2,u,v); 
xlabel('x_1')
ylabel('x_2')
axis tight equal;

hold on

options = odeset(Refine=100);
[t,x] = ode15s(@odefun,[0 5],[-5;0],options);
plot(x(:,1),x(:,2))
plot(x(1,1),x(1,2),'bo') % starting point
plot(x(end,1),x(end,2),'ks') % ending point

hold off

subplot(1,2,2);
plot(t,x)
xlabel('t (sec)')
ylabel('blue = x1(m),    red = x2(m/s)')
saveas(gcf, 'Prosomoiwsi_1(x1=-5, x2=0).fig')



% Prosomoiwsi_2 [x1=3, x2=0]
figure("Name", sprintf("Prosomoiwsi_2(x1=3, x2=0)"))
subplot(1,2,1);
quiver(x1,x2,u,v); 
xlabel('x_1')
ylabel('x_2')
axis tight equal;

hold on

options = odeset(Refine=100);
[t,x] = ode15s(@odefun,[0 5],[3;0],options);
plot(x(:,1),x(:,2))
plot(x(1,1),x(1,2),'bo') % starting point
plot(x(end,1),x(end,2),'ks') % ending point

hold off

subplot(1,2,2);
plot(t,x)
xlabel('t (sec)')
ylabel('blue = x1(m),    red = x2(m/s)')
saveas(gcf, 'Prosomoiwsi_2(x1=3, x2=0).fig')


% Prosomoiwsi_3 [x1=0, x2=-5]
figure("Name", sprintf("Prosomoiwsi_3(x1=0, x2=-5)"))
subplot(1,2,1);
quiver(x1,x2,u,v); 
xlabel('x_1')
ylabel('x_2')
axis tight equal;

hold on

options = odeset(Refine=100);
[t,x] = ode15s(@odefun,[0 5],[0;-5],options);
plot(x(:,1),x(:,2))
plot(x(1,1),x(1,2),'bo') % starting point
plot(x(end,1),x(end,2),'ks') % ending point

hold off

subplot(1,2,2);
plot(t,x)
xlabel('t (sec)')
ylabel('blue = x1(m),    red = x2(m/s)')
saveas(gcf, 'Prosomoiwsi_3(x1=0, x2=-5).fig')


% Prosomoiwsi_4 [x1=-6, x2=6]
figure("Name", sprintf("Prosomoiwsi_4(x1=-6, x2=6)"))
subplot(1,2,1);
quiver(x1,x2,u,v); 
xlabel('x_1')
ylabel('x_2')
axis tight equal;

hold on

options = odeset(Refine=100);
[t,x] = ode15s(@odefun,[0 5],[-6;6],options);
plot(x(:,1),x(:,2))
plot(x(1,1),x(1,2),'bo') % starting point
plot(x(end,1),x(end,2),'ks') % ending point

hold off

subplot(1,2,2);
plot(t,x)
xlabel('t (sec)')
ylabel('blue = x1(m),    red = x2(m/s)')
saveas(gcf, 'Prosomoiwsi_4(x1=-6, x2=6).fig')


% Prosomoiwsi_5 [x1=4, x2=6]
figure("Name", sprintf("Prosomoiwsi_5(x1=4, x2=6)"))
subplot(1,2,1);
quiver(x1,x2,u,v); 
xlabel('x_1')
ylabel('x_2')
axis tight equal;

hold on

options = odeset(Refine=100);
[t,x] = ode15s(@odefun,[0 5],[4;6],options);
plot(x(:,1),x(:,2))
plot(x(1,1),x(1,2),'bo') % starting point
plot(x(end,1),x(end,2),'ks') % ending point

hold off

subplot(1,2,2);
plot(t,x)
xlabel('t (sec)')
ylabel('blue = x1(m),    red = x2(m/s)')
saveas(gcf, 'Prosomoiwsi_5(x1=4, x2=6).fig')






% function odefun
function dx = odefun(t,x)
k = 5;
m = 1;
mi = 0.75;
g = 9.81;
w = sqrt(k/m);
% differential equation:
dx = [w*x(2);-(mi*g/w)*sign(w*x(2))-(k/w*m)*x(1)];
end