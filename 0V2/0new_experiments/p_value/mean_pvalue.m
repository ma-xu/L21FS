% This file is for calculate the  mean (pvalue )
% over 5 times repeat

clear;clc;
methodsList={'DFS'; 'LS';'MCFS';'UMM';};
feaNum='20';
DataList={'usps';'madelon';'isolet5';'COIL20';'lung_discrete';'Isolet'};

% Five average p-value
p_matrix1 = zeros(length(DataList),length(methodsList));
% Gets p-value using 25 acc
p_matrix2 = zeros(length(DataList),length(methodsList));
for d = 1:length(DataList)
    L21FS_PATH = ['../../L21FS/',feaNum,'Data_sever/Data_',DataList{d},'.mat'];
    L21FS_Data = cell2mat(struct2cell(load(L21FS_PATH)));
    for i=1:length(methodsList)
        data_PATH = ['../../',methodsList{i},'/',feaNum,'Data/Data_',DataList{d},'.mat'];
        data = cell2mat(struct2cell(load(data_PATH)));
       
        plist=zeros(1,5);
        L21FS_acc_list_all = [];
        other_acc_list_all = [];
        for ind = 1:5
            L21FS_acc_list_ind = L21FS_Data.Data5(ind).tmpTestCorr;
            other_acc_list_ind = data.Data5(ind).tmpTestCorr;
            
            L21FS_acc_list_all = [L21FS_acc_list_all;L21FS_acc_list_ind];
            other_acc_list_all = [other_acc_list_all;other_acc_list_ind];
            
            [h,p]=ttest(L21FS_acc_list_ind,other_acc_list_ind);
            plist(1,ind) = p;
        end
        pvalue1=mean(plist);
        p_matrix1(d,i)=pvalue1;
        
        [h2,p2]=ttest(L21FS_acc_list_ind,other_acc_list_ind);
        p_matrix2(d,i)=p2;
        
 
    end
end
p_matrix1
p_matrix2