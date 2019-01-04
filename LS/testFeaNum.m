
clear;
clc;
DataName={'usps';'madelon';'lung_discrete';'isolet5';'Isolet';'COIL20';'colon'};
for i=1:length(DataName)
    datapath=['../data/',DataName{i},'.mat'];
    load(datapath);
    if ~exist('FeaNum','dir') 
        mkdir('FeaNum');
    end 
    savePath=['FeaNum/FeaNumACC_',DataName{i},'.mat'];
    B=[gnd fea];
    C_1=length(unique(gnd))-1;
    feaGrid=10:10:100;
    feaGrid=[feaGrid C_1];
    Name = ['FeaNumACC_',DataName{i}];
    eval([Name,'=feaNumfunc( B,feaGrid);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName;
    clc;

end


