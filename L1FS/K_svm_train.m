function [ accuracy ] = K_svm_train( label, Inst, lambd,feaNum,rdim )
%Label:     tranning labels
%Inst:      tranning instances
%lambd:     parameter for L1FS
%feaNum:    selected features number
%rdmin:     the project matrix dimension

    [ W ] = svc( label,Inst,lambd,rdim);
    accuracy = svcerror_cross( W,Inst,label,feaNum);
    

end



