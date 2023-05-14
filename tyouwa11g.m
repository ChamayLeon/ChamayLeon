K=100000000;
N=20;
total_gyaku_r=0;
for k=1:K
                for j=1:N
                    distance(j)=rand*60;
                    if distance(j) <= 5
                        r=54;
                    elseif distance(j) <= 7
                        r=48;
                    elseif distance(j) <= 9
                        r=36;
                    elseif distance(j) <= 20
                        r=24;
                    elseif distance(j) <= 25
                        r=18;
                    elseif distance(j) <= 40
                        r=12;
                    elseif distance(j) <= 50
                        r=9;
                    else
                        r=6;

                    total_gyaku_r=total_gyaku_r+1/r;
                    end
                end
end
average_gyaku_r=total_gyaku_r/K
average_th=N/average_gyaku_r;
