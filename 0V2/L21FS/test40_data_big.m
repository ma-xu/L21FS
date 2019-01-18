clear;
clc;
%DataName={'usps';'madelon';'isolet5';'COIL20';'lung_discrete';'Isolet'};
DataName={'lung';'warpPIE10P';'mnist'};
rate=40;
outratio=0;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    if ~exist([num2str(rate),'Data'],'dir') 
        mkdir([num2str(rate),'Data']);
    end 
    savePath=[num2str(rate),'Data/Data_',DataName{i},'.mat'];
    
    if outratio >0
        savetemp=[num2str(rate),'Data_',num2str(outratio),'Noise'];
        if ~exist(savetemp,'dir') 
            mkdir(savetemp);
        end 
        savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    end
    
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=length(unique(gnd))-1;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance1( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end

