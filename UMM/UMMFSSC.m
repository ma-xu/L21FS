% min_{W'*W=I,F'*F=I} trace(W'*X*(I-F*F')*X'*W)-trace(W'*X*(F*F')*X'*W)+alpha*||W||_21
function [W, feature_idx, obj] = UMMFSSC(X, c, alpha, feature_num)
% X: dim*n training data matrix, each column is a data point
% c: cluster number
% alpha: regularization parameter
% feature_num: selected feature number
% W: dim*c projection matrix
% feature_idx: selected feature index
% obj: objective values in the iterations

% Ref: Shizhun Yang, Chenping Hou, Feiping Nie, Yi Wu.
% Unsupervised maximum margin feature selection via L2,1-norm minimization.  
% Neural Computing & Applications (NCA), 21(7):1791-1799, 2012.
 

X=X';% make X each row is a data point
[dim,n] = size(X);
H = eye(n) - 1/n*ones(n,n);
X = X*H;

[U,t,V] = svd(X,'econ');
F = V(:,1:c);
D = eye(dim);
for iter = 1:30
    M = X*(eye(n)-2*F*F')*X'+alpha*D;
    W = eig1(M,c,0);
    [U,t,V] = svd(W'*X,'econ');
    F = V(:,1:c);

    d = sqrt(sum(W.*W,2)+eps);
    D = diag(0.5./d);
    
    obj(iter) = trace(W'*X*(eye(n)-2*F*F')*X'*W)+alpha*sum(d);
end;
[dumb idx] = sort(d,'descend');
feature_idx = idx(1:feature_num);




function [eigvec, eigval, eigval_full] = eig1(A, c, isMax, isSym)

if nargin < 2
    c = size(A,1);
    isMax = 1;
    isSym = 1;
elseif c > size(A,1)
    c = size(A,1);
end;

if nargin < 3
    isMax = 1;
    isSym = 1;
end;

if nargin < 4
    isSym = 1;
end;

if isSym == 1
    A = max(A,A');
end;
[v d] = eig(A);
d = diag(d);
%d = real(d);
if isMax == 0
    [d1, idx] = sort(d);
else
    [d1, idx] = sort(d,'descend');
end;

idx1 = idx(1:c);
eigval = d(idx1);
eigvec = v(:,idx1);

eigval_full = d(idx);