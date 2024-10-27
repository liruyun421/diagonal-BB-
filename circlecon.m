function [c,ceq] = circlecon(x,G,U,m,n)
c=[]; %非线性不等式
 for i=1:m   
     BB=G(i,1:n)*x(1:n)+(1/2)*x(1:n)'*U((i-1)*n+1:i*n,1:n)*x(1:n)-x(n+1);
     c=[c;BB];
 end
ceq = []; %非线性等式组成的数组