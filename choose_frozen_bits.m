function f = choose_frozen_bits(cpq,K)
% cpq- channel quality measurement, higher the value, worse the channel

[~,order] = sort(cpq); % order of increasing channel quality measurement

% Find best frozen bits
f = zeros(1,length(cpq));
f(order(1:K)) = 1; % giving non-zero value indicating information bit 
                     % positions
                     
                     