clear,clc
%%  
global m
global n
j=1; 
j1=1;
omega=1e-8;                                                             
yita=0.85;                                         
epsilon=2.22e-16;             
h=32;    
Loop=200;
Rloopk=zeros(Loop,h);
Rloopnf=zeros(Loop,h);        
Rloopng=zeros(Loop,h);
Rloopt=zeros(Loop,h);
   for d=1:50
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
        U0=eye(n);
        U=repmat(U0,m,1);
        while 1
            xx=ones(n+1,1)+1;
            fun = @(x)x(n+1);
            nonlcon=@(x)circlecon(x,G,U,m,n);
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
            sk=x1-xk;
            %%矩阵U的更新
            U1=[];
            for i=1:m
                yk=G1(i,1:n)-G(i,1:n);
                alphaBB1=norm(sk)^2/(yk*sk);
                alphaBB2=norm(sk)/norm(yk);
                U0=zeros(n);
                for s=1:n
                    a=(sk(s)*yk(s)+omega*U(s,s))/(sk(s)^2+omega);
                    if a<1/alphaBB1
                        U0(s,s)=1/alphaBB1;
                    elseif a>1/alphaBB2
                        U0(s,s)=1/alphaBB2;
                    else
                        U0(s,s)=a;
                    end
                    if  U0(s,s)==0
                        U0(s,s)=1;
                    elseif  U0(s,s)<0
                        U0(s,s)=-U0(s,s);
                    end
                end
                U1=[U1;U0];
            end
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
            U=U1;
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
%          plot(F(1,1),F(2,1),'.k',F1(1,1),F1(2,1),'r*','MarkerSize',4);
%          plot([F(1,1),F1(1,1)],[F(2,1),F1(2,1)],'k');
%          %axis([0 1 0 40])
%          xlabel({'$F_1(x)$'},'Interpreter','latex')
%          ylabel({'$F_2(x)$'},'Interpreter','latex')
%          title('PNR','fontname','Times New Roman','Color','k','FontSize',13)
%          pause(0.1);
%          hold on;  
    end
    j=j+1;
    j1=j1+m;
end