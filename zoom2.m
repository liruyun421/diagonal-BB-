%% 第一个函数zoom
function [alphak,nf,ng]=zoom2(alpha1,alpha0,xk,dk,sigmaba,rhoba,nf,ng,i,r,r1,n,d)
% alpha0=0;alpha1=10;dk=rand(2,1);xk=[-1;-1];
% rhoba=0.25;sigmaba=0.75;
s=0;smax=20;
while (s<smax)
%     d1=g1(xk+alpha0*dk,d)'*dk+g1(xk+alpha1*dk,d)'*dk-3*(f1(xk+alpha0*dk,d)-f1(xk+alpha1*dk,d))/(alpha0-alpha1);
%     d2=sign((alpha1-alpha0)*(d1^2-(g1(xk+alpha0*dk,d)'*dk)*(g1(xk+alpha1*dk,d)'*dk)));
%     alphaj=alpha1-(alpha1+alpha0)*(g1(xk+alpha1*dk,d)'*dk+d2-d1)/(g1(xk+alpha1*dk,d)'*dk-g1(xk+alpha0*dk,d)'*dk+2*d2);
    alphaj=(alpha0+alpha1)/2;
       F6=r'.*f(xk+alphaj*dk,d);
       F5=r'.*f(xk+alpha1*dk,d);
       G5=g(xk+alphaj*dk,d).*r1;
       nf=nf+2;
       ng=ng+1;
       F1=r'.*f(xk,d);
       G1=g(xk,d).*r1;
    if F6(i)>F1(i)+alphaj*rhoba*max(G1*dk) || F6(i)>=F5(i)
        
        alpha0=alphaj;
    else
        if abs(G5(i,1:n)*dk)<=sigmaba*abs(max(G1*dk))
            
            alphak=alphaj;
            break
        end
        if (G5(i,1:n)*dk)*(alpha0-alpha1)>=0
         
         alpha0=alpha1;   
        end
        alpha1=alphaj;
    end
    s=s+1;
    if s==20
     alphak=alphaj;
    end
end
        