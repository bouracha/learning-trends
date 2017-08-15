function standardised_quantum = quantum_standardisation(i, n, data);

quantum = data(i-n:i);

mu = mean(quantum);
sigma = std(quantum);

if (sigma == 0)
    sigma = 1;
    standardised_quantum = (quantum .- mu)./sigma;
    %=== This corresponds to all values being identical ===
    %=== Obviously a very rare case, probably n = 2 =======
else
    standardised_quantum = (quantum .- mu)./sigma;
end

end

