function p = direct_stationary(pop_size, beta, a, b, c, d, epsilon)
    
    p_tilde = zeros(1,pop_size+1);
    p = zeros(1,pop_size+1);
    
    summing = 1;
    
    p_tilde(1,1) = 1;
    
    for k = 2:pop_size+1
        t_plus = transition_plus_with_mutation(pop_size, beta, a, b, c, d, epsilon, k-2);
        t_minus = transition_minus_with_mutation(pop_size, beta, a, b, c, d, epsilon, k-1);
        p_tilde(1,k) = p_tilde(1,k-1)*t_plus/t_minus;
        if epsilon == 0
            if k == pop_size+1
                p_tilde(1,k) = 0.0000000000000000000000001;
            end
        end
        summing = summing+p_tilde(1,k);
    end
        
    for k = 1:pop_size+1
        p(1,k) = p_tilde(1,k)/summing;
    end

    
end