% % Rate-balance plots
% % 
% % 1) Linear system with no feedback, forward rate depends on [S]
% % 
Astar = 0:0.001:1 ;
S = 0.5:0.5:20 ;
kplus = 2 ;
kminus = 5 ;

BR = kminus*Astar ;
figure
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

for i=1:length(S)
  FR = kplus*S(i)*(1-Astar) ;
  [minpos,dex] = min(abs(FR - BR)) ;
  A_SS(i) = Astar(dex) ;
  plot(Astar,FR,'b','LineWidth',2)
end
axis([0 1 0 max(FR)])

figure
plot(S,A_SS,'bo-','LineWidth',2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')

% % Rate-balance plots
% % 
% % 2) Ultrasensitive feedback, variable [S]
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


% % Rate-balance plots, question 2 of assigment 3
% % 
% % 3) Linear feedback of forward reaction, constant [S] and variable Kmb, partially
% saturated backward reaction
% % 

Astar = 0:0.01:1 ;
S = 0;
kplus = 2 ;
kf = 30 ;
Kmb = 0:0.1:5 ;
kminus = 5 ;

FR = (kplus.*S + kf.*Astar).*(1 - Astar);
figure
handle1 = gcf ;
hold on 
plot(Astar,FR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(Kmb)
  BR = kminus.*(Astar./(Astar+Kmb(i))) ;
  figure(handle1)
  plot(Astar,BR,'b','LineWidth',2)
  
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(FR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  figure(handle2)
  plot(Kmb(i),Astar(crossings),'bo')
  
end
figure(handle1)
axis([0 1 0 max(FR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

figure(handle2)
set(gca,'TickDir','Out')
xlabel('Kmb')
ylabel('Steady-state [A*]/[A]')

% % Rate-balance plots, question 2 of assigment 4
% % 
% % 4) Linear feedback of forward reaction, constant Kmb and variable [S], partially
% saturated backward reaction
% % 

Astar = 0:0.01:1 ;
S = 0:5;
kplus = 2 ;
kf = 30 ;
Kmb = 1 ;
kminus = 5 ;
BR = kminus.*(Astar./(Astar+Kmb)) ;
figure
handle1 = gcf ;
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(S)
  FR = (kplus.*S(i) + kf.*Astar).*(1 - Astar);
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
xlabel('[S]')
ylabel('Steady-state [A*]/[A]')

