clear,clc
h=50;
Rloop=zeros(h,16);
for i=1:5
    if i==1
        S11=load('kNEW.mat');BP11 = struct2cell(S11);Mymat11 = cell2mat(BP11);
        S12=load('kADSD.mat');BP12 = struct2cell(S12);Mymat12 = cell2mat(BP12);
        S13=load('kSD.mat');BP13 = struct2cell(S13);Mymat13 = cell2mat(BP13);
        S14=load('kBB08.mat');BP14 = struct2cell(S14);Mymat14 = cell2mat(BP14);
        k1=[];k2=[];k3=[];k4=[];k5=[];
        for d=1:h    
           % 解决问题的百分比
            p11=Mymat11(:,d);
            no=0;
            for i=1:200
                if isnan(p11(i))
                    no=no+1;
                end
            end
            ss=(200-no)/200;
            Rloop(d,1)=ss;
                       
           p11=sort(p11);
           s11=p11(49)+p11(50);
           ss=s11/2;
            Rloop(d,2)=ss;


            p11=Mymat12(:,d);
            no=0;
            for i=1:200
                if isnan(p11(i))
                    no=no+1;
                end
            end
            ss=(200-no)/200;
            Rloop(d,6)=ss;

            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,7)=ss;

            
            p11=Mymat13(:,d);
            no=0;
            for i=1:200
                if isnan(p11(i))
                    no=no+1;
                end
            end
            ss=(200-no)/200;
            Rloop(d,11)=ss;

            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,12)=ss;


            p11=Mymat14(:,d);
            no=0;
            for i=1:200
                if isnan(p11(i))
                    no=no+1;
                end
            end
            ss=(200-no)/200;
            Rloop(d,16)=ss;

            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,17)=ss;

            k1=[k1;Mymat11(:,d)];
            k2=[k2;Mymat12(:,d)];
            k3=[k3;Mymat13(:,d)];
            k4=[k4;Mymat14(:,d)];
        end
        k1(find(isnan(k1)))=5000;
        k2(find(isnan(k2)))=5000;
        k3(find(isnan(k3)))=5000;
        k4(find(isnan(k4)))=5000;
  
        nfsum=[k1 k2 k3 k4];
        iter=nfsum;
        [m,n]=size(iter); %n是方法
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
       % subplot(2,2,1) ;
        figure(1);
        plot(tx(1,:),ty(1,:),'-.','Color',[0.56,0.73,0.29],'linewidth',1.5)
        hold on
        plot(tx(2,:),ty(2,:),'-.','Color',[0.72,0.27,1],'linewidth',1.5)
        hold on
        plot(tx(3,:),ty(3,:),'-.','Color',[0,0.870,0.8410],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'-.*','MarkerIndices',1,'Color',[0.85,0.33,0.10],'linewidth',1.5)
        hold on

        axis([1 25 0 1]);
        xlabel('\chi');
        ylabel('\rho(\chi)');
        title('(I) Iterations','fontname','Times New Roman','Color','k','FontSize',13);
        legend('Newton','ADSD','SD','VMBB','Location','southeast');
   
    elseif i==2
        S11=load('nfNEW.mat');BP11 = struct2cell(S11);Mymat11 = cell2mat(BP11);
        S12=load('nfADSD.mat');BP12 = struct2cell(S12);Mymat12 = cell2mat(BP12);
        S13=load('nfSD.mat');BP13 = struct2cell(S13);Mymat13 = cell2mat(BP13);
        S14=load('nfBB08.mat');BP14 = struct2cell(S14);Mymat14 = cell2mat(BP14);
   
        k1=[];k2=[];k3=[];k4=[];k5=[];
      for d=1:h
            
            p11=Mymat11(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,3)=ss;

            p11=Mymat12(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,8)=ss;

            p11=Mymat13(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,13)=ss;

            p11=Mymat14(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,18)=ss;
  
            k1=[k1;Mymat11(:,d)];
            k2=[k2;Mymat12(:,d)];
            k3=[k3;Mymat13(:,d)];
            k4=[k4;Mymat14(:,d)];
      
      end
        k1(find(isnan(k1)))=5000;
        k2(find(isnan(k2)))=5000;
        k3(find(isnan(k3)))=5000;
        k4(find(isnan(k4)))=5000;
   
        nfsum=[k1 k2 k3 k4];
        iter=nfsum;
        [m,n]=size(iter); %n是方法
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
        figure(2);
        %subplot(2,2,2) ;
        plot(tx(1,:),ty(1,:),'-.','Color',[0.56,0.73,0.29],'linewidth',1.5)
        hold on
        plot(tx(2,:),ty(2,:),'-.','Color',[0.72,0.27,1],'linewidth',1.5)
        hold on
        plot(tx(3,:),ty(3,:),'-.','Color',[0,0.870,0.8410],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'-.*','MarkerIndices',1,'Color',[0.85,0.33,0.10],'linewidth',1.5)
        hold on
        
        axis([1 25 0 1]);
        xlabel('\chi');
        ylabel('\rho(\chi)');
        title('(II) Function evaluations','fontname','Times New Roman','Color','k','FontSize',13);
        legend('Newton','ADSD','SD','VMBB','Location','southeast');
   
    elseif i==3
        S11=load('ngNEW.mat');BP11 = struct2cell(S11);Mymat11 = cell2mat(BP11);
        S12=load('ngADSD.mat');BP12 = struct2cell(S12);Mymat12 = cell2mat(BP12);
        S13=load('ngSD.mat');BP13 = struct2cell(S13);Mymat13 = cell2mat(BP13);
        S14=load('ngBB08.mat');BP14 = struct2cell(S14);Mymat14 = cell2mat(BP14);
  
        k1=[];k2=[];k3=[];k4=[];k5=[];
        for d=1:h
            
            p11=Mymat11(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,4)=ss;

            p11=Mymat12(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,9)=ss;

            p11=Mymat13(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,14)=ss;

            p11=Mymat14(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,19)=ss;
            
            k1=[k1;Mymat11(:,d)];
            k2=[k2;Mymat12(:,d)];
            k3=[k3;Mymat13(:,d)];
            k4=[k4;Mymat14(:,d)];
       
        end
        k1(find(isnan(k1)))=5000;
        k2(find(isnan(k2)))=5000;
        k3(find(isnan(k3)))=5000;
        k4(find(isnan(k4)))=5000;
    
        nfsum=[k1 k2 k3 k4];
        iter=nfsum;
        [m,n]=size(iter); %n是方法
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
      % subplot(2,2,3) ;
        figure(3);
        plot(tx(1,:),ty(1,:),'-.','Color',[0.56,0.73,0.29],'linewidth',1.5)
        hold on
        plot(tx(2,:),ty(2,:),'-.','Color',[0.72,0.27,1],'linewidth',1.5)
        hold on
        plot(tx(3,:),ty(3,:),'-.','Color',[0,0.870,0.8410],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'-.*','MarkerIndices',1,'Color',[0.85,0.33,0.10],'linewidth',1.5)
        hold on

        axis([1 25 0 1]);
        xlabel('\chi');
        ylabel('\rho(\chi)');
        title('(III) Gradient evaluations','fontname','Times New Roman','Color','k','FontSize',13)
        legend('Newton','ADSD','SD','VMBB','Location','southeast');
      
    elseif i==5
        S11=load('tNEW.mat');BP11 = struct2cell(S11);Mymat11 = cell2mat(BP11);
        S12=load('tADSD.mat');BP12 = struct2cell(S12);Mymat12 = cell2mat(BP12);
        S13=load('tSD.mat');BP13 = struct2cell(S13);Mymat13 = cell2mat(BP13);
        S14=load('tBB08.mat');BP14 = struct2cell(S14);Mymat14 = cell2mat(BP14);
 
        k1=[];k2=[];k3=[];k4=[];k5=[]; 
        for d=1:h 
            p11=Mymat11(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,5)=ss;

            p11=Mymat12(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,10)=ss;

            p11=Mymat13(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,15)=ss;

            p11=Mymat14(:,d);
            p11=sort(p11);
            s11=p11(49)+p11(50);
            ss=s11/2;
            Rloop(d,20)=ss;
            
            k1=[k1;Mymat11(:,d)];
            k2=[k2;Mymat12(:,d)];
            k3=[k3;Mymat13(:,d)];
            k4=[k4;Mymat14(:,d)];
        end
        k1(find(isnan(k1)))=5000;
        k2(find(isnan(k2)))=5000;
        k3(find(isnan(k3)))=5000;
        k4(find(isnan(k4)))=5000;

        nfsum=[k1 k2 k3 k4];
        iter=nfsum;
        [m,n]=size(iter); %n是方法
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
       % subplot(2,2,4) ;'MarkerIndices',1
        figure(4);
       
        plot(tx(1,:),ty(1,:),'-.','Color',[0.56,0.73,0.29],'linewidth',1.5)
        hold on
        plot(tx(2,:),ty(2,:),'-.','Color',[0.72,0.27,1],'linewidth',1.5)
        hold on
        plot(tx(3,:),ty(3,:),'-.','Color',[0,0.870,0.8410],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'-.*','MarkerIndices',1,'Color',[0.85,0.33,0.10],'linewidth',1.5)
        hold on

        axis([1 25 0 1]);
        xlabel('\chi');
        ylabel('\rho(\chi)');
        title('(V) CPU time','fontname','Times New Roman','Color','k','FontSize',13)
        legend('Newton','ADSD','SD','VMBB','Location','southeast');
    end
end

