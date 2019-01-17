function [W,score,indx]=URAFS(X,c,alpha,beta,lambda, NITER)
%       Reference:"Generalized Uncorrelated Regression with Adaptive Graph
%                 for Unsupervised Feature Selection", Xuelong Li, Han Zhang, Rui
%                 Zhang, Yun Liu, and Feiping Nie, TNNLS, 2018.
%       View online: https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8474999.
%       Input:
%             X: d by n matrix, n samples with d dimensions.
%             c: the desired cluster number.
%             alpha, beta, lambda: parameters refer to paper.
%             NITER�� the number of iteration.
%       Output:
%             W: d by c projection matrix.
%             score: d-dimensional vector, preserves the score for each
%                    dimensions.
%             indx: the sort of features for selection.
X=X'; % translate n by d to d by n
[d,n]=size(X);
H=eye(n)-ones(n,n)./n;
F=orth(rand(n,c));
W = rand(d,c);
err=1; iter=1;
while (err > 0.1 & iter< NITER)
% for iter=1:NITER
%while iter<25
D_weight = diag( 0.5./sqrt(sum(W.*W,2)+eps));
for i=1:n
    for j=1:n
       S(i,j)=exp(-norm(F(i,:)-F(j,:),2)^2/(2*beta));
    end
   S(i,:)=S(i,:)./sum(S(i,:));
end
S=(S+S')./2;
D=diag(sum(S,2));
L=D-S;
[W,~]=gen_orth(X,F,D_weight,lambda);
A=H+2*alpha.*L;
B=H*X'*W;
F=gpi(A,B,1);
tran=0;
for i1=1:n
    for j1=1:n
    tran=tran+S(i1,j1)*log(S(i1,j1));
    end
end
obj(iter)=norm(H*(X'*W-F),'fro')^2+lambda*trace(W'*D_weight*W)+2*alpha*(trace(F'*L*F)+beta*tran);
if iter>1
    err = abs(obj(iter-1)-obj(iter));
end
iter = iter+1;
end
score=sum((W.*W),2);
[~,indx]=sort(score,'descend');
% figure;
% imagesc(S)
% figure;
% plot(obj)
%Title: A generalized power iteration method for solving quadratic problem on the Stiefel manifold
%% Authors: Feiping Nie, Rui Zhang, and Xuelong Li.
%Citation: SCIENCE CHINA Information Sciences 60, 112101 (2017); doi: 10.1007/s11432-016-9021-9
%View online: http://engine.scichina.com/doi/10.1007/s11432-016-9021-9
%View Table of Contents:http://engine.scichina.com/publisher/scp/journal/SCIS/60/11
%Published by the Science China Press
%% Generalized power iteration method (GPI) for solving min_{W��W=I}Tr(W��AW-2W^TB)
%Input: A as any symmetric matrix with dimension m*m; B as any skew matrix with dimension m*k,(m>=k);
%In particular, s can be chosen as 1 or 0, which stand for different ways of determining relaxation parameter alpha. 
%i.e. 1 for the power method and 0 for the eigs function.
%Output: solution W and convergent curve.
function W=gpi(A,B,s)
if nargin<3
    s=1;
end
[m,k]=size(B);
if m<k 
    disp('Warning: error input!!!');
    W=null(m,k);
    return;
end
A=max(A,A');

if s==0
    alpha=abs(eigs(A,1));
else if s==1
    ww=rand(m,1);
    for i=1:10
        m1=A*ww;
        q=m1./norm(m1,2);
        ww=q;
    end
    alpha=abs(ww'*A*ww);
    else disp('Warning: error input!!!');
         W=null(m,k);
         return;
    end
end
        
err1=1;t=1;
W=orth(rand(m,k));
A_til=alpha.*eye(m)-A;
while t<5
    M=2*A_til*W+2*B;
    [U,~,V]=svd(M,'econ');
    W=U*V';
    obj(t)=trace(W'*A*W-2.*W'*B);
    if t>=2
        err1=abs(obj(t-1)-obj(t));
    end
        t=t+1;
end
  
function [W,obj]=gen_orth(X,Y,D,lam)
%min_{W'(XHX'+lam*D)W=I/W'S_tW=I,b}||X'W+1b'-Y||_F^2+lam*||W||_F^2
[~,n]=size(X);
H=eye(n)-ones(n,1)*ones(1,n)./n;
A=(X*H*X'+lam.*D)^.5;
A=max(A,A');
B=real(inv(A)'*X*H*Y);
[U,~,V]=svd(B,'econ');
Q=U*V';
W=real(inv(A)*Q);
obj=norm(H*(X'*W-Y),'fro')^2+lam*trace(W'*D*W);
