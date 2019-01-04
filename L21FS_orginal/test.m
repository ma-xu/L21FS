clear;clc;
load ../data/usps.mat;
B=[gnd fea];
labels=gnd;
X=fea;
[ U ] = svc2( labels,X,1,10 );