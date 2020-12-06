function x = polar_transform(u) % for non-permuted inputs
  % Recurse down to length 1
    if (length(u)==1)
        x = u;
    else
        u1u2 = mod(u(1:2:end)+u(2:2:end),2); % XOR operation to create x1=u1*u2
        u2 = u(2:2:end); % create x2=u2
        % mapping odd/even indices (i.e., u1u2/u2) to first/second half
        x = [polar_transform(u1u2) polar_transform(u2)];
    end