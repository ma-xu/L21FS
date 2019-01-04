clear;clc;
load ../data/Isolet1.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_Isolet1=instance( B,feaNum,rdim);
save('Data_Isolet1','Data_Isolet1');

clear;clc;
load ../data/Isolet2.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_Isolet2=instance( B,feaNum,rdim);
save('Data_Isolet2','Data_Isolet2');

clear;clc;
load ../data/Isolet3.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_Isolet3=instance( B,feaNum,rdim);
save('Data_Isolet3','Data_Isolet3');

clear;clc;
load ../data/Isolet4.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=feaNum;
Data_Isolet4=instance( B,feaNum,rdim);
save('Data_Isolet4','Data_Isolet4');



%{
clear;clc;
load ../data/COIL20.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_COIL20=instance( B,feaNum,rdim);
save('Data_COIL20','Data_COIL20');

clear;clc;
load ../data/colon.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_colon=instance( B,feaNum,rdim);
save('Data_colon','Data_colon');

clear;clc;
load ../data/Isolet.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_Isolet=instance( B,feaNum,rdim);
save('Data_Isolet','Data_Isolet');

clear;clc;
load ../data/lung_discrete.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_lung_discrete=instance( B,feaNum,rdim);
save('Data_lung_discrete','Data_lung_discrete');

clear;clc;
load ../data/ORL.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_ORL=instance( B,feaNum,rdim);
save('Data_ORL','Data_ORL');

clear;clc;
load ../data/Yale.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_Yale=instance( B,feaNum,rdim);
save('Data_Yale','Data_Yale');

clear;
dataset='isolet5'
load ../data/isolet5.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_isolet5=instance( B,feaNum,rdim);
save('Data_isolet5','Data_isolet5');

clear;clc;
load ../data/usps.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_usps=instance( B,feaNum,rdim);
save('Data_usps','Data_usps');

clear;
load ../data/madelon.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_madelon=instance( B,feaNum,rdim);
save('Data_madelon','Data_madelon');

clear;
load ../data/CNAE9.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_CNAE9=instance( B,feaNum,rdim);
save('Data_CNAE9','Data_CNAE9');
%}