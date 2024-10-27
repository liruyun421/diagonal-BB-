function f=f(x,d)
global m
global n
if d==1 %% BK1鍑芥暟绗竴涓?-5-10
    f1=x(1)^2+x(2)^2;
    f2=(x(1)-5)^2+(x(2)-5)^2;
    f=[f1;f2];
    
elseif d==2%% DGO1鍑芥暟绗竴涓?-10-13 1缁?
    f1=sin(x);
    f2=sin(x+0.7);
    f=[f1;f2];
    
elseif d==3%% FF1鍑芥暟 -1-1 m=n=2               
    f1=1-exp(-(x(1)-1)^2-(x(2)+1)^2);
    f2=1-exp(-(x(1)+1)^2-(x(2)-1)^2);
    f=[f1;f2];
    
    
elseif d==4%%  JOS1鍑芥暟0-1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];
    
elseif d==5%%  JOS1鍑芥暟0-1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];
    
elseif d==6%%  JOS1鍑芥暟0-1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
    
elseif d==7%%  MLF2鍑芥暟-10-10
    f1=-(5-((x(1)^2+x(2)-11)^2+(x(1)+x(2)^2-7)^2)/200);
    f2=-(5-((4*x(1)^2+2*x(2)-11)^2+(2*x(1)+4*x(2)^2-7)^2)/200);
    f=[f1;f2];
    
elseif d==8%%  T1鍑芥暟-1-1
    f1=0.5*x(1)^2+x(2)^2-10*x(1)-100;
    f2=x(1)^2+0.5*x(2)^2-10*x(2)-100;
    f=[f1;f2];
    
elseif d==9%%  T2鍑芥暟-2-2
    f1=sin(x(2));
    f2=1-exp(-(x(1)-1/sqrt(2))^2-(x(2)-1/sqrt(2))^2);
    f=[f1;f2];
    
elseif d==10%%  T4鍑芥暟-10-10   10缁?
    F1=0;
    for i=1:n-1
        a=x(i)^2;
        F1=F1+a;
    end
    f1=F1+2;
    F2=0;
    for i=1:n
        b=x(i);
        F2=F2+b;
    end
    f2=F2-2;
    f=[f1;f2];
 
elseif d==11 %%  T6鍑芥暟(*) -10-10 m=n=2
    f1=-log(x(1))-log(x(2));
    f2=x(1)^2+x(2);
    f=[f1;f2];
   
elseif d==12%%  T8鍑芥暟   6 0-10 3wei
    f1=0;
    for i=1:n
        a=x(i)^3;
        f1=f1+a;
    end
    F2=0;
    for i=1:n-1
        b=(x(i)-4)^2;
        F2=F2+b;
    end
    f2=F2+x(n)^2;
    F3=0;
    for i=2:n
        c=5*x(i)^2;
        F3=F3+c;
    end
    f3=-log(x(1))+F3;
    f=[f1;f2;f3];
    

elseif d==13%%  SP1鍑芥暟-100-100
    f1=(x(1)-1)^2+(x(1)-x(2))^2;
    f2=(x(2)-3)^2+(x(1)-x(2))^2;
    f=[f1;f2];
    
elseif d==14%% SSFYY2鍑芥暟-100-100
    f1=10+x^2-10*cos(x*pi/2);
    f2=(x-4)^2;
    f=[f1;f2];
    
elseif d==15%%  SK1鍑芥暟-100-100
    f1=-(-x^4-3*x^3+10*x^2+10*x+10);
    f2=-(-0.5*x^4+2*x^3+10*x^2-10*x+5);
    f=[f1;f2];
    
elseif d==16%% SK2-10-10
    f1=(x(1)-2)^2+(x(2)+3)^2+(x(3)-5)^2+(x(4)-4)^2-5;
    b=x(1)^2+x(2)^2+x(3)^2+x(4)^2;
    f2=-((sin(x(1))+sin(x(2))+sin(x(3))+sin(x(4)))/(1+b/100));
    f=[f1;f2];

elseif d==17%%  MOP2鍑芥-4-4     凹
    f1=0;
    for i=1:n
        a=(x(i)-1/sqrt(n))^2;
        f1=f1+a;
    end
    f1=1-exp(-f1);
    f2=0;
    for i=1:n
        b=(x(i)+1/sqrt(n))^2;
        f2=f2+b;
    end
    f2=1-exp(-f2);
    f=[f1;f2];
        
elseif d==18%%  MOP3鍑芥暟-PI-PI
    A1=0.5*sin(1)-2*cos(1)+sin(2)-1.5*cos(2);
    A2=1.5*sin(1)-cos(1)+2*sin(2)-0.5*cos(2);
    B1=0.5*sin(x(1))-2*cos(x(1))+sin(x(2))-1.5*cos(x(2));
    B2=1.5*sin(x(1))-cos(x(1))+2*sin(x(2))-0.5*cos(x(2));
    f1=-(-1-(A1-B1)^2-(A2-B2)^2);
    f2=-(-(x(1)+3)^2-(x(2)+1)^2);
    f=[f1;f2];
    
elseif d==19%%  MOP5鍑芥暟   7 -30-30  2wei
    f1=0.5*(x(1)^2+x(2)^2)+sin(x(1)^2+x(2)^2);
    f2=(3*x(1)-2*x(2)+4)^2/8+(x(1)-x(2)+1)^2/27+15;
    f3=1/(x(1)^2+x(2)^2+1)-1.1*exp(-x(1)^2-x(2)^2);
    f=[f1;f2;f3];    
    
elseif d==20 %%  MOP7鍑芥暟   8 -400-400 2wei
    f1=(x(1)-2)^2/2+(x(2)+1)^2/13+3;
    f2=(x(1)+x(2)-3)^2/36+(-x(1)+x(2)+2)^2/8-17;
    f3=(x(1)+2*x(2)-1)^2/175+(-x(1)+2*x(2))^2/17-13;
    f=[f1;f2;f3];
    
elseif d==21%%  KW2鍑芥暟-3-3
    a1=3*(1-x(1))^2;b1=-x(1)^2-(x(2)+1)^2;c1=10*(x(1)/5-x(1)^3-x(2)^5);
    d1=-x(1)^2-x(2)^2;e1=-(x(1)+2)^2-x(2)^2;f1=0.5*(2*x(1)+x(2));
    f1=-(a1*exp(b1)-c1*exp(d1)-3*exp(e1)+f1);
    a2=3*(1+x(2))^2;b2=-x(2)^2-(1-x(1))^2;c2=10*(-x(2)/5+x(2)^3+x(1)^5);
    d2=-x(2)^2-x(1)^2;e2=-(2-x(2))^2-x(1)^2;
    f2=-(a2*exp(b2)-c2*exp(d2)-3*exp(e2));
    f=[f1;f2];
        
elseif d==22 %TRIDIA -1-1 m=n=4    6  Toi9
    f1=(2*x(1)-1)^2+x(2)^2;
    f2=2*(2*x(1)-x(2))^2-x(1)^2+2*x(2)^2;
    f3=3*(2*x(2)-x(3))^2-2*x(2)^2+3*x(3)^2;
    f4=4*(2*x(3)-x(4))^2-3*x(3)^2;
    f=[f1;f2;f3;f4];
    
elseif d==23  %TRIDIA -1-1 m=n=20   5     Toi9
    f=[];
    f1=(2*x(1)-1)^2+x(2)^2;
    f=[f;f1];
    for i=2:m-1
        ff=i*(2*x(i-1)-x(i))^2-(i-1)*x(i-1)^2+i*x(i)^2;
        f=[f;ff];
    end
    fm=m*(2*x(m-1)-x(m))^2-(m-1)*x(m-1)^2;
    f=[f;fm];
    
 elseif d==24  %TRIDIA -1-1 m=n=20   5     Toi9
    f=[];
    f1=(2*x(1)-1)^2+x(2)^2;
    f=[f;f1];
    for i=2:m-1
        ff=i*(2*x(i-1)-x(i))^2-(i-1)*x(i-1)^2+i*x(i)^2;
        f=[f;ff];
    end
    fm=m*(2*x(m-1)-x(m))^2-(m-1)*x(m-1)^2;
    f=[f;fm];   
    
    
    elseif d==25 %-2-2 Rosenbrock   9 toi10
    f=[];
    for i=1:m
        fi=100*(x(i+1)-x(i)^2)^2+(x(i+1)-1)^2;
        f=[f;fi];
    end
  
    
elseif d==26%%  Hil1鍑芥暟0-1
    a=(2*pi/360)*(45+40*sin(2*pi*x(1))+25*sin(2*pi*x(2)));
    b=1+0.5*cos(2*pi*x(1));
    f1=b*cos(a);
    a=(2*pi/360)*(45+40*sin(2*pi*x(1))+25*sin(2*pi*x(2)));
    b=1+0.5*cos(2*pi*x(1));
    f2=b*sin(a);
    f=[f1;f2];
    
elseif d==27 %%  PNR鍑芥暟-2-2
    c=10;d=0.25;
    f1=x(1)^4+x(2)^4+x(1)^2+x(2)^2+c*x(1)*x(2)+d*x(1)+20;
    k=1;
    l=0;
    f2=(x(1)-k)^2+(x(2)-l)^2;
    f=[f1;f2];
    
elseif d==28%% MMR1 (0.1-1,0-1)
    f1=1+x(1)^2;
    f2=(2-0.8*exp(-((x(2)-0.6)/0.4)^2)-exp(-((x(2)-0.2)/0.04)^2))/(1+x(1)^2);
    f=[f1;f2];
    
    
elseif d==29 %ap1 -100-100
    f1=1/4*((x(1)-1)^4+2*(x(2)-4)^4);
    f2=exp((x(1)+x(2))/2)+x(1)^2+x(2)^2;
    f3=1/6*(exp(-x(1))+2*exp(-x(2)));
    f=[f1;f2;f3];
    
elseif d==30 %ap2 -100-100
    f1=x^2-4;
    f2=(x-1)^2;
    f=[f1;f2];
    
elseif d==31  %ap3 -100-100
    f1=1/4*((x(1)-4)^4+2*(x(2)-2)^4);
    f2=(x(2)-x(1)^2)^2+(1-x(1))^2;
    f=[f1;f2];
       
elseif d==32 %lov5  -2-2  %两个函数相差一个负号
    p0=[0;0.15;0];
    p1=[0;-1.1;0];
    M=[-1,-0.03,0.011;-0.03,-1,0.07;0.011,0.07,-1.01];
    ff=sqrt(2*pi/0.35)*exp(([x(1);x(2)-0.15;x(3)]'*M*[x(1);x(2)-0.15;x(3)])/0.35^2)+sqrt(2*pi/3)*exp(([x(1);x(2)+1.1;0.5*x(3)]'*M*[x(1);x(2)+1.1;0.5*x(3)])/3^2);
    f1=sqrt(2)/2*x(1)+sqrt(2)/2*ff;
    M=[-1,-0.03,0.011;-0.03,-1,0.07;0.011,0.07,-1.01];
    ff=sqrt(2*pi/0.35)*exp(([x(1);x(2)-0.15;x(3)]'*M*[x(1);x(2)-0.15;x(3)])/0.35^2)+sqrt(2*pi/3)*exp(([x(1);x(2)+1.1;0.5*x(3)]'*M*[x(1);x(2)+1.1;0.5*x(3)])/3^2);
    f2=-sqrt(2)/2*x(1)+sqrt(2)/2*ff;
    f=[f1;f2];
    
    
elseif d==33  % LRS1    n=m=2    [-50,50]
    f1=x(1)^2+x(2)^2;
    f2=(x(1)+2)^2+x(2)^2;
    f=[f1;f2];
    
elseif d==34  %% IKK1   1 -50-50 2wei   三个目标
    f1=x(1)^2;
    f2=(x(1)-20)^2;
    f3=x(2)^2;
    f=[f1;f2;f3];
    
elseif d==35   %  MHHM1    2 0-1 1wei
    f1=(x-0.8)^2;
    f2=(x-0.85)^2;
    f3=(x-0.9)^2;
    f=[f1;f2;f3];
    
elseif d==36 %%  MHHM2   3 0-1 2wei
    f1=(x(1)-0.8)^2+(x(2)-0.6)^2;
    f2=(x(1)-0.85)^2+(x(2)-0.7)^2;
    f3=(x(1)-0.9)^2+(x(2)-0.6)^2;
    f=[f1;f2;f3];
    
elseif d==37%%  VFM1   4 -2-2  2wei
    f1=x(1)^2+(x(2)-1)^2;
    f2=x(1)^2+(x(2)+1)^2+1;
    f3=(x(1)-1)^2+x(2)^2+2;
    f=[f1;f2;f3];
    
elseif d==38%%  ZLT1   5 -1000-1000 3wei
    f1=(x(1)-1)^2+x(2)^2+x(3)^2;
    f2=(x(2)-1)^2+x(1)^2+x(3)^2;
    f3=(x(3)-1)^2+x(1)^2+x(2)^2;
    f=[f1;f2;f3];
    
elseif d==39%%  FDS   9  -2-2 10,50,100wei
    F1=0;
    for i=1:n
        a=i*(x(i)-i)^4;
        F1=a+F1;
    end
    f1=F1/n^2;
    F2=0;
    for i=1:n
        a=x(i)/n;
        F2=a+F2;
    end
    f2=exp(F2)+norm(x,2)^2;
    F3=0;
    for i=1:n
        a=i*(n-i+1)*exp(-x(i));
        F3=a+F3;
    end
    f3=F3/(n*(n+1));
    f=[f1;f2;f3];
    
elseif d==40%%  FDS  9  -2-2 10,50,100wei
    F1=0;
    for i=1:n
        a=i*(x(i)-i)^4;
        F1=a+F1;
    end
    f1=F1/n^2;
    F2=0;
    for i=1:n
        a=x(i)/n;
        F2=a+F2;
    end
    f2=exp(F2)+norm(x,2)^2;
    F3=0;
    for i=1:n
        a=i*(n-i+1)*exp(-x(i));
        F3=a+F3;
    end
    f3=F3/(n*(n+1));
    f=[f1;f2;f3];
    
elseif d==41  %%  FDS   9  -2-2 10,50,100wei
    F1=0;
    for i=1:n
        a=i*(x(i)-i)^4;
        F1=a+F1;
    end
    f1=F1/n^2;
    F2=0;
    for i=1:n
        a=x(i)/n;
        F2=a+F2;
    end
    f2=exp(F2)+norm(x,2)^2;
    F3=0;
    for i=1:n
        a=i*(n-i+1)*exp(-x(i));
        F3=a+F3;
    end
    f3=F3/(n*(n+1));
    f=[f1;f2;f3];
    
elseif d==42  % MGH4 -100-100
    f1=x(1)-10^6;
    f2=x(2)-2*10^(-6);
    f3=x(1)*x(2)-2;
    f=[f1;f2;f3];
    

elseif d==43 %MGH16  [-1,1]
    f=[];
    for l=1:m
        f1=(x(1)+l/5*x(2)-exp(l/5))^2+(x(3)+x(4)*sin(l/5)-cos(l/5))^2;
        f=[f;f1];
    end  
    
    elseif d==44  %MGH16  [-1,1]
    f=[];
    for l=1:m
        f1=(x(1)+l/5*x(2)-exp(l/5))^2+(x(3)+x(4)*sin(l/5)-cos(l/5))^2;
        f=[f;f1];
    end    
    
    elseif d==45  %MGH16  [-1,1]
    f=[];
    for l=1:m
        f1=(x(1)+l/5*x(2)-exp(l/5))^2+(x(3)+x(4)*sin(l/5)-cos(l/5))^2;
        f=[f;f1];
    end    
    
    
elseif d==46 %m=n=6 x0  -1-1   %mgh26   
    f=[];
    a=0;
    for i=1:n
        a=a+cos(x(i));
    end
    for l=1:n
        f1=(4-a+l*(1-cos(x(l)))-sin(x(l)))^2;
        f=[f;f1];
    end
    
 elseif d==47 %m=n=6 x0  -1-1   %mgh26   
    f=[];
    a=0;
    for i=1:n
        a=a+cos(x(i));
    end
    for l=1:n
        f1=(4-a+l*(1-cos(x(l)))-sin(x(l)))^2;
        f=[f;f1];
    end
    
    elseif d==48 %m=n=6 x0  -1-1   %mgh26   
    f=[];
    a=0;
    for i=1:n
        a=a+cos(x(i));
    end
    for l=1:n
        f1=(4-a+l*(1-cos(x(l)))-sin(x(l)))^2;
        f=[f;f1];
    end
    
elseif d==49 % MGH27 -1-1 %m=10,n=10   12 mgh271(50,100),mgh272
    ff=[];
    for i=1:m-1
        f1=x(i)+sum(x)-(n+1);
        ff=[ff;f1];
    end
    f2=prod(x)-1;
    f=[ff;f2];
    
elseif d==50 %sch1 [-10,10]
    if x<=1
        f1=-x;
    elseif x<=3
        f1=-2+x;
    elseif x<=4
        f1=4-x;
    else
        f1=-4+x;
    end
    f2=(x-5)^2;
    f=[f1;f2];    
end

