function [ U ] = svc( labels,X,c,l )
%Input:
    %   labels: sample labels
    %   X:      samples ,size*dimension
    %   c:      the ragular term
    %   l:      reduced dimension
%Output:
    %   U:      project matrix dimension*reduced_dimension
    
%Objective:     min tr(U'*Xw*Dw*Xw'*U)+tr(U'*D*U)
%               st. tr(U'*Xb*Db*Xb'*U)=cons, U'*U=I

    
    %% initialize U, columnly-orthogonal
    [A d v]=svd(X');
    U=A(:,1:l);
     
    %% comupte Xb, 
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
        Xb_k=n_k(i,:)*(mean_k(i,:)-mean_all);
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
    
    %% compute Db
    [Sb,~] = Constract_Sb( Xb,U ); 
    
%     %% s.t.  trace(U'*Xb'*Db*Xb*U)=cons; cons＝1
%     cons=trace(U'*Sb*U);
    
    %% for iteration
    delta = inf;
    deltaVAL(1,1)=delta;
    itear = 1;
    OBJVAL=zeros(25,1);
    while delta>0.01 && itear<=25
    %while itear<=25
        [Sb,~]=Constract_Sb(Xb,U);
        [Sw,~]=Constract_Sw(Xw,U);
         %% compute Du
         Du=sum(U.^2,2).^(1/2);
         Du(Du==0)=0.000001;
         Du=1./(2*Du);
         Du=diag(Du);
        
        
        %% get eig
        %因为Sb必不满秩，rank(Sb)=classnum-1;
        [ Sb ] = Rep_rank( Sb );
       
       % Matrix=(Sb)\(Sw+c*Du);
        Matrix=(Sb)\(Sw+c*Du);
        [V,D] = eig(Matrix); %D:value ;V:vector
        [~,order]=sort(diag(D),'ascend');
        %each cloumn is a vector
        V=real(V(:,order)); %去虚部
        U=V(:,1:l);
%         
%         [Sb,~]=Constract_Sb(Xb,U);
%         
%         traceB=trace(U'*Sb*U);
%         U=U.*(cons/traceB);
        
        [Sb,~]=Constract_Sb(Xb,U);
        [Sw,~]=Constract_Sw(Xw,U);
        
        %% compute Du
        Du=sum(U.^2,2).^(1/2);
        Du(Du==0)=0.000001;
        Du=1./(2*Du);
        Du=diag(Du);
        
        OBJVAL(itear,1)=(trace(U'*(Sw+c*Du)*U));
        if itear >1
            delta = abs(OBJVAL(itear,1)-OBJVAL(itear-1,1))/OBJVAL(itear,1);
            deltaVAL(itear,1)=delta;
        end
        itear = itear+1;
    end
    itear
end

