clear;clc;
warning off;
load('../../data/usps.mat');
Max=max(max(fea));
Min=min(min(fea));
fea=2*(fea-Min)./(Max-Min)-1; 
[W,index] = LDFS(gnd,fea,2,100);
index