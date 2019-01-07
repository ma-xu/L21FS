function [ accuracy ] = K_svm_train( label, Inst, alpha,feaNum )
%Label:     tranning labels
%Inst:      tranning instances
%lambd:     parameter for L1FS
%feaNum:    selected features number
%rdmin:     the project matrix dimension
    [~, feature_idx, ~] = UMMFSSC(Inst, 2, alpha, feaNum);
    
    accuracy = svcerror_cross( feature_idx,Inst,label);
    

end



