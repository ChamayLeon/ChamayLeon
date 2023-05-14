N=20;
m=50;
z=zeros(m+1,N+1);
for i=0:m
    if i==0
        e=0.000000000000000001;
    else
        e=i*0.01;
    end
    p=direct_stationary(N,1,12,1,1,2,e);
    for j=0:N
        z(i+1,j+1)=p(j+1);
    end
end

stem3(0:N,0:m,z,'.','LineStyle','none','Color','b')


%plot3(x,y,z)
%plot(0:N,p_0,'o')
%hold on
%plot(0:N,p_0_2,'+')
%plot(0:N,p_0_5,'^')
%plot(0:N,p_1,'*')
set(gca,'FontSize',20);
xlabel('Number of UAVs to Select AP1','FontSize',20)
ylabel('Connection Error Probability ε','FontSize',20)
zlabel('Steady State Probability \pi_{AP1}','FontSize',20)
yticks([0 10 20 30 40 50])
yticklabels({'0.0','0.1','0.2','0.3','0.4','0.5'})

%xticks([0 1 2 3 4 5])
%xticklabels({'0','1','2','3','4','5'})
%legend('ε=0','ε=0.2','ε=0.5','ε=1')
%hold off