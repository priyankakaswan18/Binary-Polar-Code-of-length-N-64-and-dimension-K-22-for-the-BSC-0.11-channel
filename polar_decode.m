function [u,x] = polar_decode(y,f)
    % y = output of channels in output order 
    % f = apriori probabilities in input order, also gives frozen bits
    % x = final input to channel, in output order 
    % u = input message vector, in input order

    % repeat recursively down to length 1
    N = length(y);
    if (N==1)
        if (f==1/2) % denoting information bits, NOT frozen
            x = round(y); % estimating x fed into the channel
            u = x; % estimating input of 'effective' channel
        else
            x = f; % to help the decoding information bits
            u = round(y); % for monte carlo design
        end
    else
        %  map one stage back
        u1_estimate = c_node(y(1:2:end),y(2:2:end));
        % provide u1_estimate to top polar code
        [u1_,x1_] = polar_decode(u1_estimate,f(1:(N/2)));
        % Using u1est and x1hard, we can estimate u2
        u2_estimate = v_node(c_node(x1_,y(1:2:end)),y(2:2:end));
        % provide u2_estimate to bottom polar code
        [u2_,x2_] = polar_decode(u2_estimate,f((N/2+1):end));
        % go u decisions back up. Compute and alternate x1,x2
        u = [u1_ u2_];
        x = reshape([c_node(x1_,x2_); x2_],1,[]);
    end
return

function z=c_node(w1,w2) % Check-node density evolution operation
  z = w1.*(1-w2) + w2.*(1-w1);
return

function z=v_node(w1,w2) % Bit-node density evolution operation
  z = w1.*w2 ./ (w1.*w2 + (1-w1).*(1-w2));
return

