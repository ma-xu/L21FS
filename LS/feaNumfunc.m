function [ AccuracyList ] = feaNumfunc( B,feaGrid )
    % gui yi hua 
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
    
    AccuracyList=zeros(size(feaGrid));
    for i=1:length(feaGrid)
        feaNum=feaGrid(1,i);
	    [ W ] = svc(A);
	    [~,index]= sort(-W);
	    select_index=index(1:feaNum,:);
	    A1=A(:,select_index);
	    Accuracy = svmtrain(d,A1,'-v 10 -q');
	    AccuracyList(1,i)=Accuracy;
	end 
end