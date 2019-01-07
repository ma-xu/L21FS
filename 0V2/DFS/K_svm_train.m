function [ accuracy ] = K_svm_train( label, Inst, gamma,p,feaNum,rdim )
%Label:     tranning labels
%Inst:      tranning instances
%lambd:     parameter for L1FS
%feaNum:    selected features number
%rdmin:     the project matrix dimension

    [ W ] = svc( Inst,gamma,rdim,p,label );
    accuracy = svcerror_cross( W,Inst,label,feaNum);
    

end



