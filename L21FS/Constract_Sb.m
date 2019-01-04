function [ Sb,Db ] = Constract_Sb( Xb,U )
% Compute between-class scatter and the diagonal matrix D for L21-norm.
% Input:  Xb  : the between class data matrix
% Input:  U   : the projection matrix
% Output: Sb  : the between class scatter.
% Output: Db  : the diagonal matrix for L21.
%               Db(ii)=1/[2(Nc*||(mean_Xc-meanX)U||)]



    %% compute Db
    Db=Xb*U;
    %Db(Db==0)=0.0001;
    Db=sum(abs(Db).^2,2).^(1/2);
    Db=1./(2*Db);
    Db=diag(Db);
    Sb=Xb'*Db*Xb;
    Sb=(Sb+Sb')/2;


end

