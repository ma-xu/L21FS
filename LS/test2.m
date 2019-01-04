clear;
clc;
%DataName={'usps';'madelon';'isolet5';'COIL20';'lung_discrete';'Isolet'};
DataName={'colon';};
rate=40;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../data/',DataName{i},'.mat'];
    if ~exist([num2str(rate),'Data'],'dir') 
        mkdir([num2str(rate),'Data']);
    end 
    savePath=[num2str(rate),'Data/Data_',DataName{i},'.mat'];
    load(datapath);
    warning off;
    B=[gnd fea];
    feaNum=rate;
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum;
    clc;
end

