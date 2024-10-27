f4=[];
f5=[];
f6=[];
for i=1:2000
    x=-1+2*1*rand(1,2);
    f1=1-exp(-(x(1)-1)^2-(x(2)+1)^2);
    f2=1-exp(-(x(1)+1)^2-(x(2)-1)^2);
    f4=[f4,f1];
    f5=[f5,f2];
   % f6=[f6,f3];
end
scatter(f4,f5,1,'k');%,f6
xlabel({'$F_1(x)$'},'Interpreter','latex')
ylabel({'$F_2(x)$'},'Interpreter','latex')
%zlabel({'$F_3(x)$'},'Interpreter','latex')
title('FF1','fontname','Times New Roman','Color','k','FontSize',13)
grid on;
hold on;