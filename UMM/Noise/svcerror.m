function [ accuracy ] = svcerror( feature_idx,xtrain,ytrain,xtest,ytest )
%SVCERROR Summary of this function goes here
%   Detailed explanation goes here
    xtrain = xtrain(:,feature_idx);
    xtest=xtest(:,feature_idx);
    
    %% libsvm cross validate
    model=svmtrain(ytrain,xtrain,'-q');
    [predicted,accuracyList,prob_estimates]= svmpredict(ytest,xtest,model,'-q'); 
    %err = sum(predicted~=ytest);
    accuracy = accuracyList(1,1);


end

