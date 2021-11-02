function [sumGauss] = multGauss(parameters,x)
%multGauss: a function for summing multiple Gaussian curves
%   parameters should be a matrix with three columns containing the
%   amplitude, the width, and the location of the individual Gaussian
%   profiles. x should be a range of values over which to plot.
if size(parameters,2) == 3
    for n = 1:size(parameters,1)
        m(n) = parameters(n,1)*gaussmf(x, [parameters(n,2) parameters(n,3)]);
    end
    sumGauss = sum(m,'all');
else
    error('Input must be a matrix with three columns')
end
end