
clear;clc;
warning off;
load ../data/CNAE9.mat;
B=[gnd fea];
feaNum=20;
CNAE9=instance( B,feaNum);
save('Data_CNAE9','Data_CNAE9');


clear;clc;
warning off;
load ../data/Isolet1.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_Isolet1=instance( B,feaNum);
save('Data_Isolet1','Data_Isolet1');

clear;clc;
warning off;
load ../data/Isolet2.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_Isolet2=instance( B,feaNum);
save('Data_Isolet2','Data_Isolet2');

clear;clc;
warning off;
load ../data/Isolet3.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_Isolet3=instance( B,feaNum);
save('Data_Isolet3','Data_Isolet3');

clear;clc;
warning off;
load ../data/Isolet4.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_Isolet4=instance( B,feaNum);
save('Data_Isolet4','Data_Isolet4');



%{
clear;clc;
warning off;
load ../data/COIL20.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_COIL20=instance( B,feaNum);
save('Data_COIL20','Data_COIL20');

clear;clc;
warning off;
load ../data/colon.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_colon=instance( B,feaNum);
save('Data_colon','Data_colon');

clear;clc;
warning off;
load ../data/Isolet.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_Isolet=instance( B,feaNum);
save('Data_Isolet','Data_Isolet');

clear;clc;
warning off;
load ../data/lung_discrete.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_lung_discrete=instance( B,feaNum);
save('Data_lung_discrete','Data_lung_discrete');

clear;clc;
warning off;
load ../data/ORL.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_ORL=instance( B,feaNum);
save('Data_ORL','Data_ORL');

clear;clc;
warning off;
load ../data/Yale.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_Yale=instance( B,feaNum);
save('Data_Yale','Data_Yale');

clear;clc;
warning off;
load ../data/usps.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_usps=instance( B,feaNum);
save('Data_usps','Data_usps');

clear;
warning off;
load ../data/ORL_32x32.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_ORL_32x32=instance( B,feaNum);
save('Data_ORL_32x32','Data_ORL_32x32');

clear;
warning off;
load ../data/madelon.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_madelon=instance( B,feaNum);
save('Data_madelon','Data_madelon');

clear;
warning off;
load ../data/isolet5.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_isolet5=instance( B,feaNum);
save('Data_isolet5','Data_isolet5');

clear;
warning off;
load ../data/CNAE9.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
Data_CNAE9=instance( B,feaNum);
save('Data_CNAE9','Data_CNAE9');

%}