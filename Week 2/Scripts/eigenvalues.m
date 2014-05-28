clear;
close all;
Vin=0.36;
K1=0.02;
Kp=6;

int = 1;
first = 10;
last = 21;
stop = round((last-first)/int) + 1;

A1 = 2*Vin/(Kp-2*Vin);
G1 = (Kp - 2*Vin)/(2*K1);
for i = 1:stop;
    Km(i) = first + (i-1)*int;
    A(i) = A1*Km(i);
    G(i) = G1/Km(i);
    J(1,1) = 2*K1*G(i) - (Kp*Km(i))/((A(i)+Km(i))^2);
    J(1,2) = 2*K1*A(i);
    J(2,1) = -K1*G(i);
    J(2,2) = -K1*A(i);
    J
    e1=eig(J);
    e(i,1) = e1(1);
    e(i,2) = e1(2);
    r(i) = real(e1(1));
end;
