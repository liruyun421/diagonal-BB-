clc
clear
S11=load('BBNEW.mat');BP11 = struct2cell(S11);F1 = cell2mat(BP11);
F1(find(isinf(F1)))=100;
iter=F1;
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
%subplot(2,2,1) ;
figure(1);
plot(tx(1,:),ty(1,:),'-.','Color',[0.85,0.33,0.10],'LineWidth',2) 
hold on
plot(tx(2,:),ty(2,:),'-.','Color',[0.56,0.73,0.29],'linewidth',1.5) %HONG plot(tx(1,:),ty(1,:),'-.','Color',[0.93,0.69,0.13],'LineWidth',2) %HUANG
hold on
axis([1 6.5 0 1.1])
xlabel('\chi');
ylabel('\rho(\chi)');
title('Purity','fontname','Times New Roman','Color','k','FontSize',13);
legend('VMBB','Newton','location','southeast');

S11=load('BBADSD.mat');BP11 = struct2cell(S11);F1 = cell2mat(BP11);
F1(find(isinf(F1)))=100;
iter=F1;
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
%subplot(2,2,2);
figure(2)
plot(tx(1,:),ty(1,:),'-.','Color',[0.85,0.33,0.10],'LineWidth',2) %ZI
hold on
plot(tx(2,:),ty(2,:),'-.','Color',[0.72,0.27,1],'linewidth',1.5) %HONG plot(tx(1,:),ty(1,:),'-.','Color',[0.93,0.69,0.13],'LineWidth',2) %HUANG
hold on
axis([1 3 0 1.1])
xlabel('\chi');
ylabel('\rho(\chi)');
title('Purity','fontname','Times New Roman','Color','k','FontSize',13);
legend('VMBB','ADSD','location','southeast');

S11=load('BBSD.mat');BP11 = struct2cell(S11);F1 = cell2mat(BP11);
F1(find(isinf(F1)))=100;
iter=F1;
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
%subplot(2,2,3) ;
figure(3)
plot(tx(1,:),ty(1,:),'-.','Color',[0.85,0.33,0.10],'LineWidth',2) %ZI
hold on
plot(tx(2,:),ty(2,:),'-.','Color',[0,0.870,0.8410],'linewidth',1.5) %HONG plot(tx(1,:),ty(1,:),'-.','Color',[0.93,0.69,0.13],'LineWidth',2) %HUANG
hold on
axis([1 3 0 1.1])
xlabel('\chi');
ylabel('\rho(\chi)');
title('Purity','fontname','Times New Roman','Color','k','FontSize',13);
legend('VMBB','SD','location','southeast');



