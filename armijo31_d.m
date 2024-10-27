%%  向量优化的Armijo线搜索
function  [alphak,nf,ng]=armijo31_d(xk,dk,sitak,nf,ng,Ck,r,m,d)
delta=1e-4;
alphak=1;
alphakmin=1e-15;
rho=0.5;
while 1
    F2=f(xk+alphak*dk,d).*r;
    nf=nf+1;
    if alphak<=alphakmin
        alphak=alphakmin;
        break
    end
    a=0;
    for i=1:m
        if F2(i)-Ck(i)-delta*alphak*sitak>0
            break
        else
            a=a+1;
        end
    end
    if a==m
        break
    end
    alphak=rho*alphak;
end
end

