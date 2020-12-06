function x = polar_transformation(u)

G=1;
for i=1:log2(length(u))
    G=[G zeros(size(G));G G];
end

x=u*G;
x=mod(x,2);


