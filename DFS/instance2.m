function [ Accuracy ] = instance2( B,feaNum,rdim )
%B:        the input data, including label+data
%feaNum:   selected features number
%rdmin:    the project matrix dimension
    
    A=B(1:end,2:end); % A is the input data
    Max=max(max(A));
    Min=min(min(A));
    A=2*(A-Min)./(Max-Min)-1; 
    %%
    d=B(1:end,1); % d is the labels
    
    %% random the order
    a=11;
    rand('state',a);
    r=randperm(size(d,1));
    d=d(r,:);
    A=A(r,:); 
    
    %% get the best parameter with  40% data
    %mm=floor(0.4*size(d,1));
    %Result=hibiscus(d(1:mm,:),A(1:mm,:),feaNum,rdim);
    Result=hibiscus(d,A,feaNum,rdim);
    gamma = Result.Best_gamma;
    p=0.3;
    
    
    [ W ] = svc( A,gamma,rdim,p,d );
    normW=zeros(size(W,1),1);
    for i=1:size(W,1)
        normW(i,1)=norm(W(i,:));
    end
    [~,index]= sort(normW,1,'DESCEND');
    select_index=index(1:feaNum,:);
    A = A(:,select_index);
    Accuracy = svmtrain(d,A,'-v 5 -q');

   
 
end

