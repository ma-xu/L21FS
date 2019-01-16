function [ Accuracy ] = svcerror_cross(feature_idx,A,d )
%SVCERROR_CROSS Summary of this function goes here
%   Detailed explanation goes here
    
    A = A(:,feature_idx);
    
    %% libsvm cross validate
    Accuracy = libsvmtrain(d,A,'-v 10 -q');

end

