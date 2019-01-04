function [ accuracy ] = K_svm_train( label, Inst, c,feaNum,rdim)
%Label:     tranning labels
%Inst:      tranning instances
%lambd:     parameter for L1FS
%feaNum:    selected features number
%rdmin:     the project matrix dimension
    [ W ] = svc(label, Inst,c,rdim);
    accuracy = svcerror_cross( W,Inst,label,feaNum);
    

end



