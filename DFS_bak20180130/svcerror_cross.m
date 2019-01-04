function [ Accuracy ] = svcerror_cross(W,A,d,feaNum )
%SVCERROR_CROSS Summary of this function goes here
%   Detailed explanation goes here
    %% projected new data
    normW=zeros(size(W,1),1);
    for i=1:size(W,1)
        normW(i,1)=norm(W(i,:));
    end
    [~,index]= sort(normW,1,'DESCEND');
    select_index=index(1:feaNum,:);
    A = A(:,select_index);
    
    %% libsvm cross validate
    Accuracy = svmtrain(d,A,'-v 10 -q');

end

