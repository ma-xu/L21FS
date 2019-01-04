clear;
clc;
DataName={'usps';'madelon';'isolet5';'COIL20';'lung_discrete';'Isolet';'CNAE9';'colon'};

rate=40;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../data/',DataName{i},'.mat'];
    if ~exist([num2str(rate),'Data_15'],'dir') 
        mkdir([num2str(rate),'Data_15']);
    end 
    savePath=[num2str(rate),'Data_15/Data_',DataName{i},'.mat'];
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=15;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum,rdim);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum;
    clc;
end

