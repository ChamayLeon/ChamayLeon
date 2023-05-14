K=100000000;
N=20;
total_gyaku_r=0;
for k=1:K
                for j=1:N
                    distance(j)=rand*60;
                    if distance(j) <= 30
                        r=11;
                    elseif distance(j) <= 40
                        r=5.5;
                    elseif distance(j) <= 50
                        r=2;
                    elseif distance(j) <= 60
                        r=1;

                    total_gyaku_r=total_gyaku_r+1/r;
                    end
                end
end
average_gyaku_r=total_gyaku_r/K
average_th=N/average_gyaku_r;
