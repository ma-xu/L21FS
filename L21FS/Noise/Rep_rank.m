function [ Sb ] = Rep_rank( Sb )
%FULL_ Summary of this function goes here
%   Detailed explanation goes here

%% method 3 compute

if rank(Sb)<=size(Sb,1)
    Dvalue=size(Sb,1)-rank(Sb)+1e-7;
    Dvalue=Dvalue/size(Sb,1);
    Sb=Sb+Dvalue*speye(size(Sb));
end

%{
%% method 1 for 
tic
if rank(Sb1)<=size(Sb1,1)
    for jk=-17:-1
        Sb1=Sb1+10^jk*speye(size(Sb1));
        if rank(Sb1)>=size(Sb1)
            break;
        end
    end
end
toc

%% method 2 while
tic
if rank(Sb2)<=size(Sb2,1)
    jk=-17;
    while rank(Sb2)<size(Sb2,1)
        Sb2=Sb2+10^jk*speye(size(Sb2));
        jk=jk+1;
    end
end
toc
%}

end

