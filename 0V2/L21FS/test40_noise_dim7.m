clear;
clc;
DataName={'lung_discrete';'colon';'lung';'mnist'};
%DataName={'colon';'lung';'warpPIE10P';'mnist'};
rate=40;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    if ~exist([num2str(rate),'Data_dim7'],'dir') 
        mkdir([num2str(rate),'Data_dim7']);
    end 
    savePath=[num2str(rate),'Data_dim7/Data_',DataName{i},'.mat'];
    
    if outratio >0
        savetemp=[num2str(rate),'Data_dim7_',num2str(outratio),'Noise'];
        if ~exist(savetemp,'dir') 
            mkdir(savetemp);
        end 
        savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    end
    
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=7;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance1( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end

