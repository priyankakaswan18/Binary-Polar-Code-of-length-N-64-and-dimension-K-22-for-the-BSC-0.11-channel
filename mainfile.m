% Parameters
p=0.11; % BSC probability
n=6;
N=2^n; % length of codewords
K=22; % number of information bits

% Frozen bits from Monte-Carlo Method
[bit_errors_unordered] = Monte_carlo(n,p,5000);
bit_errors=permute_input(bit_errors_unordered);
f1 = choose_frozen_bits(bit_errors,K);


% Frozen bits from bhattacharyya parameters
Z=2*sqrt(p*(1-p));
[bhatta_p_unordered]=compute_bhattacharyya_parameters(1,Z,n);
[bhatta_p]=permute_input(bhatta_p_unordered);
f2=choose_frozen_bits(bhatta_p,K);

choice=f1;
for i=1:length(choice)
    if(choice(i)>0.4)
        disp(i);
    end
end

disp('difference between choices of frozen bits by both methods');
disp(f1-f2)

% B=(f2==1/2); %set of information bits (not frozen)
% 
% u = f2;
% u(B) = rand(1,K)<0.5;  % creating dimension K=22 size input message vector 
%                        % on information bits
% x = polar_transformation(u); % polar code





