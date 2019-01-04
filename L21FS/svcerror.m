function [ accuracy ] = svcerror( W,xtrain,ytrain,xtest,ytest,feaNum )
%SVCERROR Summary of this function goes here
%   Detailed explanation goes here
    %% projected new data
    normW=zeros(size(W,1),1);
    for i=1:size(W,1)
        normW(i,1)=norm(W(i,:));
    end
    [~,index]= sort(normW,1,'DESCEND');
    select_index=index(1:feaNum,:);
    xtrain = xtrain(:,select_index);
    xtest=xtest(:,select_index);
    
    %% libsvm cross validate
    model=svmtrain(ytrain,xtrain,'-q');
    [predicted,accuracyList,~]= svmpredict(ytest,xtest,model,'-q'); 
    %err = sum(predicted~=ytest);
    accuracy = accuracyList(1,1);


end

