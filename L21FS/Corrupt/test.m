clear;clc;
load ../../data/ORL.mat;
dimList=[20,10,length(unique(gnd))-1];
Accuracy=zeros(1,3);
for i=1:length(dimList)
    load ../../data/ORL.mat;
    B=[gnd fea];
    feaNum=40;
    rdim=dimList(1,i);
    Accuracy(1,i)=instance( B,feaNum,rdim);
    clearvars -except dimList Accuracy;
end
Accuracy
