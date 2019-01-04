function [Sw,Dw]=Constract_Sw(Xw,U)
%Compute the within-class scatter matrix and the diagonal matrix for L21-norm.
%Input:  Xw: the within-class data matrix 
%Input:  U:  the projection matrix
%Output: Sw: the within-class matrix
%Output: Dw: the diagonal matrix .
%            Dw(ii)=1/2|| (Xij-mean_Xi)U ||


    %% compute Dw
    Dw=Xw*U;
    %Dw(Dw==0)=0.0001;
    Dw=sum(Dw.^2,2).^(1/2);
    Dw=1./(2*Dw);
    Dw=diag(Dw);
    Sw=Xw'*Dw*Xw;
    Sw=(Sw+Sw')/2;


end

