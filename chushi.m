clc
clear
n=100;
Loop=200;
for iLoop=1:Loop
    a=2;
    xk=-a+2*a*rand(n,1);
 %    xk=-5+(10+5)*rand(n,1);
   % xk=rand(n,1);
%    xk(1)=0.1+(0.425-0.1)*rand(1);
%    xk(2:6)=-a+2*a*rand(1);
    Rloopchu(1:n,iLoop)=xk;
end