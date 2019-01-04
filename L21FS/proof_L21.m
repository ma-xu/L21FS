
%%  proof L21=L_formula
X=rand(5,6);

X_21= X.*X;
X_21=sum(X_21,2);
X_21=sqrt(X_21);
X_21= sum(X_21)


%X_formula = tr(X'*Dx*X); 
%Dx=diag(1/||Xi||,....)

Dx=sum(X.*X,2);
Dx=1./sqrt(Dx);
Dx=diag(Dx);
X_formula=trace(X'*Dx*X)


