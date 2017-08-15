function data_norm = standardisation(data);

mu = mean(data);
sigma = std(data);

data_norm = (data .- mu)./sigma;

end

