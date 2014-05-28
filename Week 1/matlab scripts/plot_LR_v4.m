colors = repmat('krgbmc',1,300);
Rtot=20;
L=0:0.01:200;
KDs=10:20:90;
figure
hold on
for i = 1:length(KDs)
    KD = KDs(i);
    LR = Rtot*L./(L + KD);
    plot(L,LR,colors(i));
    LR_all(i,:) = LR;
    figurelegend{i} = ['Kd = ', int2str(KD), ' mM'];
end
xlabel('[L][µM]');
ylabel('[LR][µM]');
legend(figurelegend, 'Location','SouthEast')