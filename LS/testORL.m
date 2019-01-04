
clear;clc;
warning off;
load ../data/ORLcorrupt8.mat;
B=[gnd fea];
feaNum=40;
acc=instance2( B,feaNum)


