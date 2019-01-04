clear;clc;
dataset='usps'
load ../data/usps.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_usps=instance( B,feaNum,rdim);
save('Data_usps','Data_usps');

clear;
dataset='ORL_32x32'
load ../data/ORL_32x32.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_ORL_32x32=instance( B,feaNum,rdim);
save('Data_ORL_32x32','Data_ORL_32x32');

clear;
dataset='madelon'
load ../data/madelon.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_madelon=instance( B,feaNum,rdim);
save('Data_madelon','Data_madelon');


clear;
dataset='isolet5'
load ../data/isolet5.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_isolet5=instance( B,feaNum,rdim);
save('Data_isolet5','Data_isolet5');




clear;
dataset='COIL20'

load ../data/COIL20.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_COIL20=instance( B,feaNum,rdim);
save('Data_COIL20','Data_COIL20');


clear;
dataset='CNAE9'
load ../data/CNAE9.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_CNAE9=instance( B,feaNum,rdim);
save('Data_CNAE9','Data_CNAE9');
