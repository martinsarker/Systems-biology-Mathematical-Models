%Bifurcation
G0 = 3;
ATP0 = 4;
k1 = 0.02;
kp=6;
Km=13;
Vin=0.1:0.01:1.6;
dt = 0.1;
tlast = 2000;
iterations = round(tlast/dt);
time = dt*(0:iterations-1)';
Gmax = [];
ATPmax = [];


for j = 1:length(Vin)
Gall = zeros(iterations,1);
ATPall = zeros(iterations,1);
G=G0;
ATP=ATP0;

for i = 1:iterations
    Gall(i) = G;
    ATPall(i)=ATP;
    dGdt = Vin(j) - k1*G*ATP;
    dATPdt = 2*k1*G*ATP - (kp*ATP)/(ATP + Km) ; 
    G = G + dGdt*dt; 
    ATP = ATP + dATPdt*dt;
end


Gmax(j) = max(Gall((length(Gall)/2):length(Gall)));
Gmin(j) = min(Gall((length(Gall)/2):length(Gall)));
ATPmax(j)=  max(ATPall((length(ATPall)/2):length(ATPall)));
ATPmin(j)=min(ATPall((length(ATPall)/2):length(ATPall)));


end
figure
hold on
plot(Vin,Gmax,'g')
plot(Vin,Gmin,'r')
xlabel('Transport of glucose into the cell')
ylabel('Minimal and maximal concentration of glucose')

figure
hold on
plot(Vin,ATPmax,'g')
plot(Vin,ATPmin,'r')
xlabel('Transport of glucose into the cell')
ylabel('Minimal and maximal concentration of ATP')