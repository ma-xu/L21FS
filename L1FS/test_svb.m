clear
clc







clear;
dataset='isolet5'
load ../data/isolet5.mat;
B=[gnd fea];
feaNum=ceil(0.4*size(B,2));
rdim=3;
Data_isolet5=instance( B,feaNum,rdim);
save('Data_isolet5','Data_isolet5');





A=load('A.mat');
A=A.A;
B=load('B.mat');
B=B.B;
c=0.1;
lambda=10;
w1=load('w1.mat');
w1=w1.w1;
w1=w1./(norm(w1));
[ w ] = svb_fake( A,B,lambda,w1);


% clear;
% clc;
% 
% % X=rand(500,100);
% % labels=[ones(200,1);2*ones(300,1)];
% A=rand(200,100);
% B=rand(100,100);
% lambd=10;
% w1=rand(100,1);
% w1=w1./(norm(w1));
% [ w ] = svb_fake( A,B,lambd,w1);
% 
% 
% 
% % 
% % 
% % A=rand(100,50);
% % B=rand(80,50);
% % c=0.1;
% % lambda=10;
% % w1=rand(50,1);
% % w1=w1./(norm(w1));
% % [ w ] = svb( A,B,lambda,w1,c );