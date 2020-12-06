function [bit_errors] = Monte_carlo(n,p,Repetitions)
% Send codewords over channels multiple times for Monte Carlo estimates
N = 2^n;
f = zeros(1,N); % we fix all vectors to zero
bit_errors = zeros(1,N);
% Monte Carlo evaluation of error probability
for i=1:Repetitions
  % Transmit all-zero codeword through BSC(p)
  y = zeros(1,N)+p;
  y(rand(1,N)<p)=1-p;
  % Decode received vector using all-zero frozen vector
  [u_,~] = polar_decode(y,f);
  bit_errors = bit_errors + u_; % since every non-zero estimate gives error
end
bit_errors = bit_errors/Repetitions;

