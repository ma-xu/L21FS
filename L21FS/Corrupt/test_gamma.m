clear;clc;
gammaGrid=2.^(-5:9);
datasets={'usps';'madelon';'lung_discrete';'isolet5';'Isolet';'COIL20';'colon';};

for i=1:length(datasets)
    datapath=['../data/',datasets{i},'.mat'];
    load(datapath);
    if ~exist('Gamma','dir') 
        mkdir('Gamma');
    end 
    savePath=['Gamma/GammaACC_',datasets{i},'.mat'];
    B=[gnd fea];
 
    Name = ['GammaACC_',datasets{i}];
    eval([Name,'=gammafunc( B,gammaGrid);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except gammaGrid datasets;
    clc;
   
end
