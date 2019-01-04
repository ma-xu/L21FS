clear;clc;
load ../data/usps.mat;
B=[gnd fea];
labels=gnd;
X=fea;
[ U, obj] = rifunc(X,3,gnd);
