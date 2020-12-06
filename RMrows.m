m=6;
r=2;
G=1;
for i=1:6
    G=[G zeros(size(G));G G];
end

for j=1:64
    if(sum(G(j,:))>=2^(m-r))
        disp(j);
    end
end

