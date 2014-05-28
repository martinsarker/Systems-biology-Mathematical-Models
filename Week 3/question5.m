b = 1;
g = 1;
d = 0.2;
l0 = 4;
p = 4;
s =1;
Lext = 2.5;
L0 = 4;
L = 0:0.05:12;



nullcline_L = g*L./(b.*Lext);
nullcline_LacY = (d + p.*(L.^4./(L.^4+L0.^4)))/s;
figure
plot(L,nullcline_L, 'b')
hold on
plot(L,nullcline_LacY, 'r')

fixed_points = [];
dif = nullcline_L-nullcline_LacY;
for i = 2:length(L)
  if (sign(dif(i)) ~= sign(dif(i-1)))
      fixed_points = [fixed_points,i] ;
    end  
end
plot(L(fixed_points),nullcline_L(fixed_points),'bo')



    dfdL = -g;
    dfdLacY = b*Lext;
    dgdLacY = -s;
for i = 1:length(fixed_points)
    dgdL = ((4*L(fixed_points(i)).^3*p)./(L(fixed_points(i)).^4 + L0^4)) - ((4*L(fixed_points(i)).^7*p)./(L(fixed_points(i)).^4 + L0^4).^2)
    jmatrix = [dfdL dfdLacY; dgdL dgdLacY];
    i
    eigenvalue=eig(jmatrix)
end
    

