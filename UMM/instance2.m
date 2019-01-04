function [ Accuracy ] = instance2( B,feaNum )
%B:        the input data, including label+data
%feaNum:   selected features number
%rdmin:    the project matrix dimension
    
    
    %% gui yi hua 
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
    %mm=floor(0.3*size(d,1));
    %Result=hibiscus(d(1:mm,:),A(1:mm,:),feaNum);
    Result=hibiscus(d,A,feaNum);
    alpha = Result.Best_alpha;
    
    [~, feature_idx, ~] = UMMFSSC(A, 2, alpha, feaNum);
    A = A(:,feature_idx);
    Accuracy = svmtrain(d,A,'-v 5 -q');
    
    
   
end

