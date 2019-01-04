function [ W ] = sva( labels,X,lambd )
    %labels : labels for samples (number*1)
    % X: samples (number*dimension)
    %lambd: parameter, (real number)
    % W: the project vector (dimension*1)
    %求总体样本均值
    mean_all=mean(X,1);
    
    %样本分类，求各样本均值
    unilabel = unique(labels);
    classnum = size(unilabel,1);
    for i=1:classnum
        idx = find(labels==unilabel(i,1));
        n_k=numel(idx);
        mean_k(i,:) = mean(X(idx,:),1);
    end
    %定义M
    M = bsxfun(@minus, mean_all, X);
    %M=X-mean_all;
    %定义N
    N=[];
    for i=1:classnum
        NN=n_k*(mean_k(1,:)-mean_all);
        N=[N;NN];
    end
    
    %循环
    W=ones(size(X,2),1);
    delta = inf;
    itear = 1;
    while delta>0.001 && itear<=40
        %计算E，F，G
        E=diag(1./(2*abs(M*W)+(1e-7)));
        F=diag(1./(2*abs(W)+(1e-7)));
        G=sign(N*W+(1e-7));
        
        %计算alpha
        alpha=(norm(M*W+(1e-7),1)+lambd*(norm(W+(1e-7),1)))/norm(N*W+(1e-7),1);
        W=(2*M'*E*M+2*lambd*F+(1e-7))\(alpha*N'*G);
         %W=W./norm(W,'fro');
        W=W/norm(W,2);
        OBJVAL(1,itear)=(norm(M*W+(1e-7),1)+lambd*(norm(W+(1e-7),1)))/norm(N*W+(1e-7),1);
        if itear >1
            delta = abs(OBJVAL(1,itear)-OBJVAL(1,itear-1));
            deltaVAL(1,itear)=delta;
        end
        itear = itear+1;
    end
    %deltaVAL'
    %W=W*(W'*W)^(-0.5);%%%%%正交化
    itear;
    
end

