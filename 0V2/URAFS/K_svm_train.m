function [ accuracy ] = K_svm_train( label, Inst, alpha,lambda )
%Label:     tranning labels
%Inst:      tranning instances
%lambd:     parameter for L1FS
%feaNum:    selected features number
%rdmin:     the project matrix dimension
    %[~, feature_idx, ~] = UMMFSSC(Inst, 2, alpha, feaNum);
    [~,~,indx]=URAFS(Inst,4,alpha,alpha,lambda, 20);
    
    accuracy = svcerror_cross( indx,Inst,label);
    

end



