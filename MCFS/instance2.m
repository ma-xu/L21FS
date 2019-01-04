function [ Accuracy ] = instance2( B,feaNum )
%B:        the input data, including label+data
%feaNum:   selected features number
%rdmin:    the project matrix dimension
    %% if print out 
    output=1;
    
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
   
    options = [];
    options.gnd = d;
    [FeaIndex,~] = MCFS_p(A, feaNum,options);
    SelectFeaIdx = FeaIndex{1};
    A = A(:,SelectFeaIdx);
    Accuracy = svmtrain(d,A,'-v 5 -q');
    
end

