function [ U ] = svc2( labels,X,c,l )
%Input:
    %   labels: sample labels
    %   X:      samples ,size*dimension
    %   c:      the ragular term
    %   l:      reduced dimension
%Output:
    %   U:      project matrix dimension*reduced_dimension
    
%Objective:     min tr(U'*Xw*Dw*Xw'*U)+tr(U'*E*U)
%               st. tr(U'*Xb*Db*Xb'*U)=cons, U'*U=I

    %gui yi hua 
    Max=max(max(X));
    Min=min(min(X));
    X=2*(X-Min)./(Max-Min)-1;  %归一化，到[-1,1]之间；
    %% initialize U, columnly-orthogonal
    [A d v]=svd(X','econ');
    U=A(:,1:l);
    
    
    %% comupte Xb, Db
    mean_all=mean(X,1);
    [unilabel] = unique(labels);
    classnum = size(unilabel,1);
    for i=1:classnum
        idx = find(labels==unilabel(i,1));
        n_k(i,:)=numel(idx);
        mean_k(i,:) = mean(X(idx,:),1);
    end
    Xb=[]; % classnum*dimension
    
    for i=1:classnum
        Xb_k=n_k(i,:)*(mean_k(1,:)-mean_all);
        Xb=[Xb;Xb_k];
    end
    
    
    %% compute Xw
    Xw=[]; %size*dimension
    for i=1:classnum
        idx = find(labels==unilabel(i,1));
        X_i= X(idx,:);
        mean_i=mean_k(i,:);
        X_i = bsxfun(@minus, X_i,mean_i);
        Xw=[Xw;X_i];
    end
    
    
    % for iteration
    delta = inf;
    deltaVAL(1,1)=delta;
    itear = 1;
    while delta>0.001 && itear<=40
        %compute Db
        Db=Xb*U;
        Db=sum(abs(Db).^2,2).^(1/2);
        Db=1./(2*Db);
        Db=diag(Db);
        
        %compute Dw
        Dw=Xw*U;
        Dw=sum(Dw.^2,2).^(1/2);
        Dw=1./(2*Dw);
        Dw=diag(Dw);
    
        
        %get eig
        Sb=Xb'*Db*Xb;
        Sb=(Sb'+Sb)/2;
        %因为Sb必不满秩，rank(Sb)=classnum-1;
        Sb=Sb+(1e-5)*eye(size(Sb));
        
        Sw=Xw'*Dw*Xw;
        Sw=(Sw+Sw')/2;
        
        alpha=trace(U'*Sb*U)/trace(U'*Sw*U);
        
        
        F=(Xw*U).*repmat(diag(Dw),1,size(U,2));       
        U=0.5*Sb\(Xw'*F);
        U=U./norm(U,'fro');
       
        
        
        OBJVAL(itear,1)=trace(U'*(Sb)*U)-alpha*trace(U'*Sw*U);
        %OBJVAL(itear,1)=norm(U);
        if itear >1
            delta = abs(OBJVAL(itear,1)-OBJVAL(itear-1,1));
            deltaVAL(itear,1)=delta;
        end
        itear = itear+1;
    end
    
    itear
    deltaVAL
    
end

