% % Rate-balance plots
% % 
% % 3) Linear feedback, partially saturated backward reaction
% % 

Astar = 0:0.01:1 ;
S = 0:0.02:0.5 ;
kplus = 2 ;
kfs = 30 ;
Kmf = 0.5 ;
kminus = 5 ;
h = 4 ; % exponent

BR = kminus*Astar ;
figure
handle1 = gcf ;
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(S)
  FR = (kplus*S(i)+kfs*(Astar.^h./(Astar.^h+Kmf^h))).*(1-Astar) ;
  figure(handle1)
  plot(Astar,FR,'b','LineWidth',2)
  
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(FR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  figure(handle2)
  plot(S(i),Astar(crossings),'bo')
  
end
figure(handle1)
axis([0 1 0 max(FR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

figure(handle2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')