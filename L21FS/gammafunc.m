function [ AccMatrix ] = gammafunc( B,gammaGrid )
    A=B(1:end,2:end); % A is the input data
    Max=max(max(A));
    Min=min(min(A));
    A=2*(A-Min)./(Max-Min)-1; 
    d=B(1:end,1); % d is the labels
    
    % random the order
    a=11;
    rand('state',a);
    r=randperm(size(d,1));
    d=d(r,:);
    A=A(r,:); 
    
    rdim=length(unique(d))-1;
    
    AccMatrix=[];
    feaGrid=10:10:100;
    for i=1:length(gammaGrid)
        gamma=gammaGrid(:,i);
        [ W ] = svc(d,A,gamma,rdim);
        normW=sum(W.^2,2).^(1/2);
        [~,index]= sort(normW,1,'DESCEND');
        accRow=zeros(size(feaGrid));
        for j=1:length(feaGrid)
            feaNum=feaGrid(1,j);
            select_index=index(1:feaNum,:);
            A1 = A(:,select_index);
            Accuracy = svmtrain(d,A1,'-v 5 -q');
            accRow(1,j)=Accuracy;
        end
        AccMatrix(i,:)=accRow;
    end

end

