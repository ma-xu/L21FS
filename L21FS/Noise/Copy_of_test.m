clear;
clc;
DataName={'usps';'isolet5';'colon'};

rate=40;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    savetemp=[num2str(rate),'Data_',num2str(outratio),'Noise15'];
    if ~exist(savetemp,'dir') 
        mkdir(savetemp);
    end 
    savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=15;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end

 %% -------------------------------------
 
 clear;
clc;
DataName={'usps';'isolet5';'colon'};

rate=40;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    savetemp=[num2str(rate),'Data_',num2str(outratio),'Noise5'];
    if ~exist(savetemp,'dir') 
        mkdir(savetemp);
    end 
    savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=5;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end

%% -----------------------------------

clear;
clc;
DataName={'usps';'colon'};

rate=20;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    savetemp=[num2str(rate),'Data_',num2str(outratio),'Noise15'];
    if ~exist(savetemp,'dir') 
        mkdir(savetemp);
    end 
    savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=15;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end



%% ---------------------

clear;
clc;
DataName={'usps';'colon'};

rate=20;
outratio=0.3;
DataNum=size(DataName,1);
for i=1:DataNum
    datapath=['../../data/',DataName{i},'.mat'];
    savetemp=[num2str(rate),'Data_',num2str(outratio),'Noise5'];
    if ~exist(savetemp,'dir') 
        mkdir(savetemp);
    end 
    savePath=[savetemp,'/Data_',DataName{i},'.mat'];
    load(datapath);
    B=[gnd fea];
    feaNum=rate;
    rdim=5;
    %data=instance( B,feaNum,rdim);
    Name = ['Data_',DataName{i}];
    eval([Name,'=instance( B,feaNum,rdim,outratio);']);
    eval(['save(savePath,','''',Name,''');']);
    clearvars -except DataName rate DataNum outratio;
    clc;
end