function [bhatta_p] = compute_bhattacharyya_parameters(c,Z,n)

Zneg=2*Z-Z^2;
if c<n
    [b1]=compute_bhattacharyya_parameters(c+1,Zneg,n);
end

Zpos=Z^2;
if c<n
    [b2]=compute_bhattacharyya_parameters(c+1,Zpos,n);
end

if c<n
    bhatta_p=[b1 b2];
else
    bhatta_p=[Zneg Zpos];
end

