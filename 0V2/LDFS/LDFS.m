function [W,index] = LDFS(label,X,dim,lambda)
%LDFS Summary of this function goes here
% Detailed explanation goes here
% label: the label n*1
% X : the input data n*d
% dim: dimension of W,the size of W is : d*dim
% lambda: the parameter for regularization term 

% objective function:
% min -(W'SbW)/(W'SwW)+ lambda*sum(norm(Wi,inf))
% derivative:
% div(W) = -2[(SbW)/(W'SwW)+(SwW)/(W'SwW)]*[(W'SbW)/(W'SbW)]

    
    %% Initilize W
    mean_X = mean(X, 1);
    [n,d] = size(X);
    Sw=zeros(d,d);
    Sb=zeros(d,d);
    unilabel = unique(label);
    %idx = find(labels==unilabel(i,1))
    
    for i = 1:length(unilabel)
      inx_i = find( label==unilabel(i,1));
      X_i = X(inx_i,:);

      mean_Xi = mean(X_i,1);
      Sw = Sw + cov( X_i, 1);
      Sb = Sb + length(inx_i)*(mean_Xi-mean_X)'*(mean_Xi-mean_X);
    end
    [ Sw ] = Rep_rank( Sw );
    [V,D]=eig( Sw\Sb );
    [D,inx] = sort(diag(real(D)),1,'descend');
    W = V(:,inx(1:dim));
    
    %% Compute objective value
    %-(W'SbW)/(W'SwW)+ lambda*sum(norm(Wi,inf))
    objval_old= -trace(W'*Sw*W)\trace(W'*Sb*W)+lambda*sum(max(abs(W),[],2));
    delta = inf;
    
    %% For loop
    objvalList=[objval_old];
    deltaList=[];
    itear=0;
    lr = 0.001;
    while delta>0.0001 && itear<=25
        % div(W) = -2[(SbW)/(W'SwW)]+[(SwW)/(W'SwW)]*[(W'SbW)/(W'SbW)]
        deri = -2*(Sb*W)/(W'*Sw*W);
        deri = deri+[(Sw*W)/(W'*Sw*W)]*[(W'*Sb*W)/(W'*Sb*W)];
        W = W-lr*deri/norm(deri,'fro');
        objval_new = -trace(W'*Sw*W)\trace(W'*Sb*W)+lambda*sum(max(abs(W),[],2));
        objvalList =[objvalList;objval_new];
        if objval_new>objval_old
            lr = lr/10;
        end
        delta = abs(objval_old-objval_new);
        objval_old=objval_new;
        deltaList=[deltaList;delta];
        itear=itear+1;
    end
    [~,index] = sort(sum(abs(W),2),'descend');
     %deltaList
     %objvalList

end

