%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 1:  Define constants 
b = 1;
g = 1;
d = 0.2;
p = 4;
s =1;
L0 = 4;
Lext = 2.5;
Linit = [8 3 3 2];
LacYinit = [3 1.3 1.2 1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 2:  Define parameters that will be varied 
L_all = [];
LacY_all = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 3:  Define time step, simulation time, initialize matrices 
dt    = 0.01 ; % s 
tlast = 20.000 ;  % s
iterations = fix(tlast/dt) ;
time = dt*(0:iterations-1) ;
%%%%%
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 4:  Run for different ICs, values of S 

for j = 1:length(Linit)
    for i = 1:iterations
      if (i == 1)
          L = Linit(j);
          LacY = LacYinit(j);
      end
      L_all(i) = L;
      LacY_all(i) = LacY;
      dLdt = b*Lext.*LacY - g.*L;
      dLacYdt = d + p.*(L.^4/(L^4+L0^4)) - s.*LacY;
      L = L + dt*dLdt ;
      LacY = LacY + dt*dLacYdt ;
   
    end 
    figure
    plot(time,L_all,'r')
    hold on
    plot(time,LacY_all,'b')
    ylab = ['Concentrations ... initial condition ', num2str(j)];
    xlabel('Time [s]')
    ylabel(ylab)
end
