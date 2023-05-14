tic;%時間計測
N=20;%UAVの台数
m=50;%誤り確率
average_th_AP1=zeros(1,m+1);
average_th_AP2=zeros(1,m+1);
average_th=zeros(1,m+1);%スループット配列定義
count_max=0;
count_min=0;
max_th=0;
min_th=0;

for l=0:m%誤り確率の変動

    if l==0
        e=0.0000000000000001;
    else
        e=l*0.01;
    end

    p_AP1=direct_stationary(N,1,8,1,1,2,e); 
    p_AP2=direct_stationary(N,1,2,1,1,8,e);

    for i=0:N
        
        if i == 0
            continue
        elseif i==1
            average_gyaku_r_AP1=0.0278;
        elseif i==2
            average_gyaku_r_AP1=0.0556;
        elseif i==3
            average_gyaku_r_AP1=0.0833;
        elseif i==4
            average_gyaku_r_AP1=0.1111;
        elseif i==5
            average_gyaku_r_AP1=0.1389;
        elseif i==6
            average_gyaku_r_AP1=0.1667;
        elseif i==7
            average_gyaku_r_AP1=0.1944;
        elseif i==8
            average_gyaku_r_AP1=0.2222;
        elseif i==9
            average_gyaku_r_AP1=0.2500;
        elseif i==10
            average_gyaku_r_AP1=0.2778;
        elseif i==11
            average_gyaku_r_AP1=0.3056;
        elseif i==12
            average_gyaku_r_AP1=0.3334;
        elseif i==13
            average_gyaku_r_AP1=0.3611;
        elseif i==14
            average_gyaku_r_AP1=0.3889;
        elseif i==15
            average_gyaku_r_AP1=0.4167;
        elseif i==16
            average_gyaku_r_AP1=0.4445;
        elseif i==17
            average_gyaku_r_AP1=0.4722;
        elseif i==18
            average_gyaku_r_AP1=0.5000;
        elseif i==19
            average_gyaku_r_AP1=0.5278;
        elseif i==20
            average_gyaku_r_AP1=0.5556;
        end

        if i==0
            i=0.00000000000000000000001;
        end
        average_th_AP1(l+1)=average_th_AP1(l+1)+i/average_gyaku_r_AP1*p_AP1(i+1)/i;
    end
    
        for i=0:N
        

        if N-i == 0
            %i=N-0.00000000000001;
            continue
        elseif N-i==1
            average_gyaku_r_AP2=0.1667;
        elseif N-i==2
            average_gyaku_r_AP2=0.3334;
        elseif N-i==3
            average_gyaku_r_AP2=0.4999;
        elseif N-i==4
            average_gyaku_r_AP2=0.6669;
        elseif N-i==5
            average_gyaku_r_AP2=0.8334;
        elseif N-i==6
            average_gyaku_r_AP2=1.0000;
        elseif N-i==7
            average_gyaku_r_AP2=1.1667;
        elseif N-i==8
            average_gyaku_r_AP2=1.3332;
        elseif N-i==9
            average_gyaku_r_AP2=1.5001;
        elseif N-i==10
            average_gyaku_r_AP2=1.6667;
        elseif N-i==11
            average_gyaku_r_AP2=1.8333;
        elseif N-i==12
            average_gyaku_r_AP2=2.0000;
        elseif N-i==13
            average_gyaku_r_AP2=2.1666;
        elseif N-i==14
            average_gyaku_r_AP2=2.3333;
        elseif N-i==15
            average_gyaku_r_AP2=2.4999;
        elseif N-i==16
            average_gyaku_r_AP2=2.6666;
        elseif N-i==17
            average_gyaku_r_AP2=2.8332;
        elseif N-i==18
            average_gyaku_r_AP2=2.9999;
        elseif N-i==19
            average_gyaku_r_AP2=3.1669;
        elseif N-i==20
            average_gyaku_r_AP2=3.3335; 
          end


            average_th_AP2(l+1)=average_th_AP2(l+1)+(N-i)/average_gyaku_r_AP2*p_AP2(N-i+1)/(N-i);
            
            if average_th_AP2(l+1)==0
                average_th_AP2(l+1)=0.000000000000001;
            end

        end


            average_th(l+1)=(average_th_AP1(l+1)+average_th_AP2(l+1))/2;

    if l==0
        max_th=average_th(l+1);
        min_th=average_th(l+1);
    elseif max_th<average_th(l+1)
        max_th=average_th(l+1);
        count_max=e;
    elseif min_th>average_th(l+1)
        min_th=average_th(l+1);
        count_min=e;
    end
end

plot(0:m,average_th,'square','MarkerEdgeColor','m','MarkerFaceColor','m')
hold on
plot(0:m,average_th_AP1,'o','MarkerEdgeColor','r','MarkerFaceColor','r')
plot(0:m,average_th_AP2,'^','MarkerEdgeColor','b','MarkerFaceColor','b')
xticks([0 10 20 30 40 50 60 70 80 90 100])
xticklabels({'0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'})
set(gca,'FontSize',15);
xlabel('Selection Error Probability ε','FontSize',20)
ylabel('Average Throughput \theta_{ave} [Mbps]','FontSize',20)
hold off

toc;
