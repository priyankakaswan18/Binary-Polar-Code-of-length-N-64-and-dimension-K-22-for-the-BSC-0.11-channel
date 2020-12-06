function [u]=permute_input(uo)
%uo- un-ordered vector of inputs. we permute its coordinates to apply
%to the generator matrix
N=length(uo);
u=uo;

v = bitrevorder((0:N-1)')+1;

for i=1:N
    u(v(i))=uo(i);
end

