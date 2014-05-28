Vin=0.36;
K1=0.02;
Km=13;
Kp=6;
fix1=0;
fix2=10;
fixint=0.01;
fixx=fix1:fixint:fix2;
fixy1=Kp./(2*K1*(fixx+Km));
fixy2=Vin./(K1*fixx);
[dummin, index] = min(abs(fixy2-fixy1));

figure
hold on
plot(fixx,fixy1,'r')
plot(fixx,fixy2,'b')

ATP=fixx(index);
G1=fixy1(index);
G2=fixy2(index);
G=mean([G1,G2]);

dfdATP=2*K1*G-(Kp*Km)/(ATP+Km)^2;
dfdG=2*K1*ATP;
dgdATP=-K1*G;
dgdG=-K1*ATP;

jmatrix=[dfdATP dfdG; dgdATP dgdG];
Km
eigenvalue=eig(jmatrix)



