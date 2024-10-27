function S1=chushi1(d)
global m
global n
if d==1  %(-5,10)
    S1 = load('BK1.mat');
    m=2;
    n=2;
elseif d==2  %(-10,13)
    m=2;
    S1 = load('DGO1.mat');
    n=1;
elseif d==3 %(-5,5)
    m=2;
    S1 = load('FF1.mat');
    n=2;    
elseif d==4  %(0,1)
    m=2;
    S1 = load('JOS1.mat');%检查
    n=50;
elseif d==5
    m=2;
    S1 = load('JOS1.mat');
    n=100;
elseif d==6
    m=2;
   S1 = load('JOS1.mat');
    n=200;
elseif d==7 %(-10,10)
    m=2;
    S1 = load('MLF2.mat');
    n=2;
elseif d==8 %(-1,1)
    m=2;
    S1 = load('TE1.mat');
    n=2;
elseif d==9  %(-2,2)
    m=2;
    S1 = load('TE2.mat');
    n=2;
elseif d==10 %(-10,10)  n可以变动
    m=2;
    S1 = load('TE4.mat');
    n=10;
elseif d==11 %(-10,10)
    m=2;
    S1 = load('TE6.mat');
    n=2;
elseif d==12  %(0,10)  n可以变动
    m=3;
    S1 = load('TE8.mat');
    n=10;  
elseif d==13  %(-100,100)
    m=2;
    S1 = load('SP1.mat');
    n=2;
elseif d==14 %(-100,100)
    m=2;
    S1 = load('SSFYY2.mat');
    n=1;
elseif d==15  %(-100,100)
    m=2;
    S1 = load('SK1.mat');
    n=1;
elseif d==16  %(-10,10)
    m=2;
    S1 = load('SK2.mat');
    n=4;
elseif d==17  %(-4,4) n可以变动
    m=2;
    S1 = load('MOP2.mat');
    n=2;
elseif d==18  %(-PI,PI)
    m=2;
    S1 = load('MOP3.mat');
    n=2; 
elseif d==19 %(-30.30)
    m=3;
    S1 = load('MOP5.mat');
    n=2;
elseif d==20   %(-400,400)
    m=3;
    S1 = load('MOP7.mat');
    n=2;
elseif d==21  %(-3,3)
    m=2;
    S1 = load('KW2.mat');
    n=2;
elseif d==22  %Toi9 (-1,1)  TRIDIA  m=n 可以变维度
    m=4;
    n=4;
    S1 = load('Toi9.mat');
elseif d==23 % Toi9  TRIDIA
    m=24;
    n=24;
    S1 = load('Toi9.mat');
 elseif d==24 % Toi9  TRIDIA
    m=30;
    n=30;
    S1 = load('Toi9.mat');  
elseif d==25   %(-2,2) m=n-1 可以变动  
    m=19;
    n=20;
    S1 = load('Toi10.mat'); 
elseif d==26  %(0,1)
    m=2;
    S1 = load('Hil1.mat');
    n=2;
elseif d==27 %(-2,2)
    m=2;
    S1 = load('PNR.mat');
    n=2;
elseif d==28  %x1(0.1-1)  x2(0-1)
    m=2;
    S1 = load('MMR1.mat');
    n=2;
elseif d==29  %(-100,100)
    m=3;
    S1 = load('AP1.mat');
    n=2;
elseif d==30  %(-100,100)
    m=2;
    S1 = load('AP2.mat');
    n=1;
elseif d==31  %(-100,100)
    m=2;
    S1 = load('AP3.mat');
    n=2;
elseif d==32  %(-2,2)
    m=2;
    S1 = load('Lov5.mat');
    n=3;

elseif d==33   %(-50,50)
    m=2;
    S1 = load('LRS1.mat');
    n=2;
elseif d==34  %(-50,50)
    m=3;
    S1 = load('IKK1.mat');
    n=2;
elseif d==35  %(0,1)
    m=3;
    S1 = load('MHHM1.mat');
    n=1;
elseif d==36   %(0,1)
    m=3;
    S1 = load('MHHM2.mat');
    n=2;
elseif d==37 %(-2,2)
    m=3;
    S1 = load('VFM1.mat');
    n=2;
elseif d==38  %(-1000,1000)
    m=3;
    S1 = load('ZLT1.mat');
    n=3;
elseif d==39  %(-2,2)
    m=3;
    S1 = load('FDS.mat');
    n=10;
elseif d==40
    m=3;
    S1 = load('FDS.mat');  
    n=20;
elseif d==41
    m=3;
    S1 = load('FDS.mat');
    n=30;
elseif d==42  %(-100,100)
    m=3;
    S1 = load('MGH4.mat');
    n=2;
elseif d==43  %(-1,1)
    m=50;
    n=4;
    S1 = load('MGH16.mat');
    elseif d==44  %(-1,1)  %适当放低
    m=100;
    n=4;
    S1 = load('MGH16.mat');
elseif d==45  %(-1,1)
    m=150;
    n=4;
    S1 = load('MGH16.mat');
elseif d==46  %(-1,1)  %维度适当放高
    m=10;
    n=10;
    S1 = load('MGH26.mat');
elseif d==47  %(-1,1)
    m=30;
    n=30;
    S1 = load('MGH26.mat');
  elseif d==48  %(-1,1)
    m=50;
    n=50;
    S1 = load('MGH26.mat');  
elseif d==49  %(-1,1)
    m=50;
    n=50;
    S1 = load('MGH27.mat');
elseif d==50 %(-10,10)
    m=2;
    n=1;
    S1=load('Sch1.mat')
end