clear;
clc;
DataName={'usps';'madelon';'isolet5';'COIL20';'lung_discrete';'Isolet';'colon'};

rate=40;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    savetemp=[num2str(rate),'Data_',num2str(outratio),'NoiseC'];
    if ~exist(savetemp,'dir') 
        mkdir(savetemp);
    end 
    savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=length(unique(gnd))-1;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end

