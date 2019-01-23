clear;
clc;
DataName={'usps';'madelon';'isolet5';'COIL20';'lung_discrete';'Isolet';'colon';'lung';'warpPIE10P';'mnist'};
%DataName={'colon';'lung';'warpPIE10P';'mnist'};
rate=40;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    if ~exist([num2str(rate),'Data_dim20'],'dir') 
        mkdir([num2str(rate),'Data_dim20']);
    end 
    savePath=[num2str(rate),'Data_dim20/Data_',DataName{i},'.mat'];
    
    if outratio >0
        savetemp=[num2str(rate),'Data_dim20_',num2str(outratio),'Noise'];
        if ~exist(savetemp,'dir') 
            mkdir(savetemp);
        end 
        savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    end
    
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=20;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance1( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end

