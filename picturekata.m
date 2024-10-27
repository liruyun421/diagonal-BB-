clc
clear
S11=load('GAMMA.mat');BP11 = struct2cell(S11);data1 = cell2mat(BP11);
S12=load('DELTA.mat');BP12 = struct2cell(S12);data2 = cell2mat(BP12);

for ddd=1:2
   if ddd==1
        data1(find(isnan(data1)))=5000;
        iter=data1;
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
       %subplot(1,2,1) ;
        figure(1);
        plot(tx(1,:),ty(1,:),'-.*','Color',[0.85,0.33,0.10],'linewidth',1.5)
        hold on
        plot(tx(2,:),ty(2,:),'-.*','Color',[0.72,0.27,1],'linewidth',1.5)
        hold on
        plot(tx(3,:),ty(3,:),'-.*','Color',[0,0.870,0.8410],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'-.*','Color',[0.56,0.73,0.29],'linewidth',1.5)
        hold on
        axis([1 18 0.2 1])
        xlabel('\chi');
        ylabel('\rho(\chi)')
        title('\Gamma')
        legend('VMBB','ADSD','SD','Newton','location','southeast')

elseif ddd==2
    data2(find(isnan(data2)))=5000;
    iter=data2;
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
        %subplot(1,2,2) ;
        figure(2);
        plot(tx(1,:),ty(1,:),'-.*','Color',[0.85,0.33,0.10],'linewidth',1.5)
        hold on
        plot(tx(2,:),ty(2,:),'-.*','Color',[0.72,0.27,1],'linewidth',1.5)
        hold on
        plot(tx(3,:),ty(3,:),'-.*','Color',[0,0.870,0.8410],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'-.*','Color',[0.56,0.73,0.29],'linewidth',1.5)
        hold on
        axis([1 2.4 0.2 1])
        xlabel('\chi')
        ylabel('\rho(\chi)')
        title('\Delta')
        legend('VMBB','ADSD','SD','Newton','location','southeast')
   end
 end
