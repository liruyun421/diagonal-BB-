clear,clc
%%  
global m
global n
j=1; 
j1=1;                                                        
yita=0.85;                                         
epsilon=2.22e-16;             
h=32;    
Loop=200;
Rloopk=zeros(Loop,h);
Rloopnf=zeros(Loop,h);                                                   
Rloopng=zeros(Loop,h);
Rloopt=zeros(Loop,h);
   for d=49
      %非凸[2,4,10,11,12,14,23,24,25,26,28,31,32,35,36,39,40,41,42,43,44,45,47,51,57,77,78,79,80,81,82,87]  
    if d==5||d==9||d==10||d==31||d==35||d==50||d==54||d==55||d==56||d==57||d==58||d==60||d==61||d==72||d==73||d==74||d==75 ...
           ||d==77||d==78||d==86||d==87||d==88
        continue;
    end
    for iLoop=1:Loop
        %% 鍒濆鐐?
        tic;
        k=1;
        nf=1;
        ng=1;
        qk=1;
        S1=chushi1(d);
        BP1 = struct2cell(S1);
        Mymat1 = cell2mat(BP1);
        x0=Mymat1(1:n,iLoop);
        xk=x0;
        R=g(x0,d);
        ng=ng+1;
        r=[];
        for i=1:m
            r1=1/max(1,norm(R(i,1:n),inf));
            r=[r;r1];
        end
        r1=repmat(r,1,n);
        G=R.*r1;
        F=f(xk,d).*r;
        nf=nf+1;
        Ck=F;
        r2=zeros(n*m,n);
        for i=1:m
            r2(n*(i-1)+1:n*i,1:n)=r(i);
        end
        while 1       
            H1=hf(xk,d).*r2; 
            xx=ones(n+1,1)+1;
            fun = @(x)x(n+1);
            nonlcon=@(x)circlecon(x,G,H1,m,n);
            options = optimoptions('fmincon','Display','iter','Algorithm','sqp');%,'Algorithm','sqp'二次规划算法
            [dd,sitak,exitflag,output,lambda] = fmincon(fun,xx,[],[],[],[],[],[],nonlcon,options);
          %  lammda=lambda.ineqnonlin;  %表示非线性不等式  %lambda 获得各种约束的拉格朗日乘子
            dNG=dd(1:n); 
            %% 停止准则
            if abs(sitak)<=5*sqrt(epsilon)
                break
            end
            %% armijo 鎼滅储
            [alphak,nf,ng]=armijo31_d(xk,dNG,sitak,nf,ng,Ck,r,m,d);
            x1=xk+alphak*dNG;
            G1=g(x1,d).*r1;
            ng=ng+1;
            F1=f(x1,d).*r;
            nf=nf+1;
            %% qk,Ck的更新
            qk1=yita*qk+1;
            Ck1=(yita*qk/qk1)*Ck+(1/qk1)*F1;
            if  k>=2000
                k=nan;
                nf=nan;
                ng=nan;
                break
            end
            k=k+1;
            xk=x1;
            G=G1;
            qk=qk1;
            Ck=Ck1;
        end
        t=toc;
        FF1=f(xk,d)';
        Rloopk(iLoop,j)=k;
        Rloopnf(iLoop,j)=nf;
        Rloopng(iLoop,j)=ng;
        Rloopt(iLoop,j)=t;
        Rloopchu(iLoop,j1:j1+m-1)=FF1;
    end
    j=j+1;
    j1=j1+m;
end