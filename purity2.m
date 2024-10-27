%% solve1
clc
clear
h=50;
s=2;
s1=1;
j1=1;
TT1=zeros(200,h);
TT2=zeros(200,h);
T3=zeros(400,h);
Rloop=zeros(h,s);
Rloopps=zeros(h,s);
for d=1:50
    m=mubiao(d);
    S11=load('hanBB08.mat');BP11 = struct2cell(S11);F1= cell2mat(BP11);
    %front = 1;
    %FF1(front).f1 = [];
    T1=zeros(200,1);
    P1=[];
    individual1 = [];
    %确定非支配点和支配点?
    for i = 1:200
        individual1(i).n1 = 0; %支配i的个数
        individual1(i).p1 = [];%被i支配的集合
        for j = 1:200
            less1 = 0;  %判断i是否可以支配j
            equal1 = 0; %i是否等于j
            more1 = 0;  %i 是否被j支配
            for k = j1:j1+m-1 %每个目标中判断支配关系
                if F1(i,k) < F1(j,k)%F进来的函数值
                    less1 = less1+1;
                elseif F1(i,k) == F1(j,k)
                    equal1= equal1+1;
                else
                    more1 = more1 + 1;
                end
            end
            if less1 == 0 && equal1 ~= m
                individual1(i).n1 = individual1(i).n1 + 1;
            elseif more1 == 0 && equal1 ~= m
                individual1(i).p1 = [individual1(i).p1 j];
            end
        end
        if individual1(i).n1 == 0  %i最小
            %pop_eva(i,target+dimension+1) = 1;
            % FF1(front).f1 = [FF1(front).f1 i];
            T1(i)=1;
            %TT1(i,d)=i;
            P1=[P1;F1(i,j1:j1+m-1)]; % 不受支配点的集合
            %FH1(i,j1:j1+m-1)=F1(i,j1:j1+m-1);
        end
    end
    SS1=sum(T1); %compute PF_ps,s=1
    
    %% solve2
    S12=load('hanNEW.mat');BP12 = struct2cell(S12);F2=cell2mat(BP12);
    %front = 1;
    %FF2(front).f2 = [];
    P2=[];
    T2=zeros(200,1);
    individual2 = [];
    for i = 1:200
        individual2(i).n2 = 0;
        individual2(i).p2 = [];
        for j = 1:200
            less2 = 0;
            equal2 = 0;
            more2 = 0;
            for k = j1:j1+m-1
                if F2(i,k) < F2(j,k)
                    less2 = less2+1;
                elseif F2(i,k) == F2(j,k)
                    equal2 = equal2+1;
                else
                    more2 = more2 + 1;
                end
            end
            if less2 == 0 && equal2 ~= m
                individual2(i).n2 = individual2(i).n2 + 1;
            elseif more2 == 0 && equal2 ~= m
                individual2(i).p2 = [individual2(i).p2 j];
            end
        end
        if individual2(i).n2 == 0
            %pop_eva(i,target+dimension+1) = 1;
            %FF2(front).f2 = [FF2(front).f2 i];
            T2(i)=1;
            % TT2(i,d)=i;
            P2=[P2;F2(i,j1:j1+m-1)];%帕雷托前沿
            %FH2(i,j1:j1+m-1)=F2(i,j1:j1+m-1);
        end
    end
    SS2=sum(T2); %compute PF_ps,s=2
    
    %% compute PF_p
    HH=union(P1,P2,'rows');  %union用于计算两个输入数组的并集的函数
    hh=size(HH,1);
    F3(1:hh,j1:j1+m-1)=HH;
    front = 1;
    P3=[];
    TT3=zeros(hh,1);
    %FF2(front).f3 = [];
    individual3 = [];
    for i = 1:hh
        individual3(i).n3 = 0;
        individual3(i).p3 = [];
        for j = 1:hh
            less3 = 0;
            equal3 = 0;
            more3 = 0;
            for k =j1:j1+m-1
                if F3(i,k) < F3(j,k)
                    less3 = less3+1;
                elseif F3(i,k) == F3(j,k)
                    equal3 = equal3+1;
                else
                    more3 = more3 + 1;
                end
            end
            if less3 == 0 && equal3 ~= m
                individual3(i).n3 = individual3(i).n3 + 1;
            elseif more3 == 0 && equal3 ~= m
                individual3(i).p3 = [individual3(i).p3 j];
            end
        end
        if individual3(i).n3 == 0
            %pop_eva(i,target+dimension+1) = 1;
            % FF2(front).f2 = [FF(front).f2 i];
            T3(i,d)=1;
            TT3(i)=1;
            P3=[P3;F3(i,j1:j1+m-1)];
        end
    end
    SS3=sum(TT3);
    Z1=intersect(P1,P3,'rows'); %compute PF_ps与F_P的交，相同列数的矩阵，返回完全相等的行
    a=size(Z1,1);
    Z2=intersect(P2,P3,'rows'); %compute PF_ps与F_p的交
    b=size(Z2,1);
    tps1=a/SS3;
    tps2=b/SS3;
    Rloop(s1,1:s)=[tps1,tps2];
    tp1_=1/tps1;
    tp2_=1/tps2;
    Rloopps(s1,1:s)=[tp1_,tp2_];
    s1=s1+1;
    j1=j1+m;
end
Rloopps(find(isinf(Rloopps)))=100;
iter=Rloopps;
[m,n]=size(iter);
ndd=m;
for i=1:ndd
    mi=inf;
    for j=1:n
        if iter(i,j)~=0 && iter(i,j)<mi
            mi=iter(i,j);
        end
    end
    for j=1:n
        iter(i,j)=iter(i,j)/mi;
    end
end
iterinum=[];
for i=1:n
    a=unique(iter(:,i));
    na=length(a);
    iterinum=[iterinum,na];
end
tmax=max(iterinum);
tx=ones(n,tmax);
ty=ones(n,tmax);
for i=1:n
    a=unique(iter(:,i));
    na=length(a);
    e=zeros(1,na-1);
    for k=2:na
        for j=1:ndd
            if iter(j,i) <= a(k)
                e(k-1)=e(k-1)+1;
            end
        end
    end
    e=e./ndd;
    [me,ne]=size(e);
    tx(i,:)=max(a(2:na))*tx(i,:);
    ty(i,:)=max(e)*ty(i,:);
    tx(i,1:na-1)=a(2:na);
    ty(i,1:ne)=e;
end
plot(tx(1,:),ty(1,:),'-.','Color',[0.49,0.18,0.56],'LineWidth',1.5)
hold on
plot(tx(2,:),ty(2,:),'-.','Color',[0.93,0.69,0.13],'linewidth',1.5) %HONG
hold on
axis([1 6.5 0 1.1])
xlabel('\tau');
ylabel('\rho(\tau)');
title('Purity','fontname','Times New Roman','Color','k','FontSize',13);
legend('BB','NEWTON','location','southeast');

