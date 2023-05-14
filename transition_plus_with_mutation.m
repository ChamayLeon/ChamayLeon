function prob = transition_plus_with_mutation(pop_size, beta, a, b, c, d, epsilon, number_of_mutants)

    i = number_of_mutants;
    N = pop_size;
    w = 0.1;
    
    pi_A = (i-1)*a/(N-1)+(N-i)*b/(N-1);
    pi_B = (i)*c/(N-1)+(N-i-1)*d/(N-1);
    %fit_A = exp(beta*pi_A);
    %fit_B = exp(beta*pi_B);
    fit_A = (i-1)*a/(N-1)+(N-i)*b/(N-1);
    fit_B = (i)*c/(N-1)+(N-i-1)*d/(N-1);
    %fit_A = 1-w+w*pi_A;
    %fit_B = 1-w+w*pi_B;
    prob = (i*fit_A)/(i*fit_A+(N-i)*fit_B)*(N-i)/N*(1-epsilon)+(N-i)*fit_B/(i*fit_A+(N-i)*fit_B)*(N-i)/N*epsilon;
    
end