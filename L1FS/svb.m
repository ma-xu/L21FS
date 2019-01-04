function [ w ] = svb( labels,X,lambd,w1)
%A:     m1Xn
%B:     m2Xn
%psi:   real number
%c:     real number
%w1:    nX1 vector
%author: maxu 2017-11-03 

    %求总体样本均值
    mean_all=mean(X,1);
    
    %样本分类，求各样本均值
    unilabel = unique(labels);
    classnum = size(unilabel,1);
    for i=1:classnum
        idx = find(labels==unilabel(i,1));
        n_k(i,:)=numel(idx);
        mean_k(i,:) = mean(X(idx,:),1);
    end
    %定义M
    A = bsxfun(@minus, mean_all, X);
    %M=X-mean_all;
    %定义N
    B=[];
    for i=1:classnum
        BB=n_k(i,:)*(mean_k(1,:)-mean_all);
        B=[B;BB];
    end






    % initalize w
    w=rand(size(w1));
    
    
    %initalize varibale for iterations
    delta = inf;
    itear = 1;
    
    
    %iterations
    while delta>0.0001 && itear<=100
        c=(norm(A*w,1)+lambd*norm(w,1))/norm(B*w,1);
        %compute D,E,F
        %D=diag(1./(2*A*w+(1e-7)));
        D=2*A*w;
        D(D<0.00001)=1e-5;
        D=diag(1./D);
        %E=diag(1./(2*w+(1e-7))); 
        E=2*w;
        E(E<0.00001)=1e-5;
        E=diag(1./E);
        s=B*w./abs(B*w+(1e-7));
        Z=4*A'*D*A+4*lambd*E;
        invZ=Z^(-1);
        U=w1'*invZ*c*B'*s;
        V=w1'*invZ*w1;
        alpha=U*V^(-1);
        w=invZ*c*B'*s-alpha*invZ*w1;
        w=w./norm(w);
        objVAL(1,itear)=norm(A*w,1)+lambd*norm(w,1)-c*norm(B*w,1);
        if itear >1
            delta = abs(objVAL(1,itear)-objVAL(1,itear-1));
        end
        itear = itear+1;
       
    end

end

