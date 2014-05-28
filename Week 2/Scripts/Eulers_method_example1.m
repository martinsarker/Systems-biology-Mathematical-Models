k1 = 0.02;
kp=6;
Km=13;
Vin=0.3;
G0 = 3;
ATP0 = 4;
dt = 0.1;
tlast = 1000;
iterations = round(tlast/dt);
Gall = zeros(iterations,1);
ATPall = zeros(iterations,1);
G=G0;
ATP=ATP0;
peaks = [] %contains indices of peaks of [Glucose] used to compute the frrequence
for i = 1:iterations
    Gall(i) = G;
    ATPall(i)=ATP;
    dGdt = Vin - k1*G*ATP;
    dGdt_all(i) = dGdt; 
    dATPdt = 2*k1*G*ATP - (kp*ATP)/(ATP + Km) ; 
    G = G + dGdt*dt; 
    ATP = ATP + dATPdt*dt;
end
time = dt*(0:iterations-1)';
figure
hold on
plot(time,Gall,'r')
plot(time,ATPall,'b')
figure
plot(Gall,ATPall,'g')
Gmax = max(Gall)
ATPmax = max(ATPall)

%method for freq1 - wrong
%maximum = Gall((Gall-Gmax)<0.1);
%f4=length(maximum)

%method for freq2 - wrong
%peak=[]
%for i = 1:length(Gall)
%    if i<length(Gall)
%peak = [peak Gall((Gall(i+1)-Gall(i))<dt)]
%    end
%end
%peak

%method for freq3 - works great!!
for i = 2:length(dGdt_all)
        if (sign(dGdt_all(i)) ~= sign(dGdt_all(i-1)))
            peaks = [peaks, i];
        end
 end
    display(length(peaks)/2) %show the frequence

    
    clear all
    
%amplitudes - seems to work
%ampl_vector = [Vin k1 kp Km max(Gall)-min(Gall) max(ATPall)-min(ATPall)]
%ampl_matrix = [ampl_matrix; ampl_vector]

