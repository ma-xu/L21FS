clear;clc;
load('../../data/ORL.mat');
data=[];
width=8;
for i=1:size(fea,1)
    person = reshape(fea(i,:),32,32);
    ip=round(rand(1,1)*(31-width))+1;
    jp=round(rand(1,1)*(31-width))+1;
    person(ip:ip+width,jp:jp+width)=0;
    data=[data;person(:)'];
end
data

