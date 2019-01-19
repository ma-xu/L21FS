function [p_matrix1] = p_value(folder,methodsList,DataList)
% This file is for calculate the  mean (pvalue )
% over 5 times repeat


% Five average p-value
p_matrix1 = zeros(length(DataList),length(methodsList));
% Gets p-value using 25 acc
p_matrix2 = zeros(length(DataList),length(methodsList));
for d = 1:length(DataList)
    L21FS_PATH = ['../../L21FS/',folder,'/Data_',DataList{d},'.mat'];
    L21FS_Data = cell2mat(struct2cell(load(L21FS_PATH)));
    for i=1:length(methodsList)
        data_PATH = ['../../',methodsList{i},'/',folder,'/Data_',DataList{d},'.mat'];
        data = cell2mat(struct2cell(load(data_PATH)));
       
        plist=zeros(1,5);
        L21FS_acc_list_all = [];
        other_acc_list_all = [];
        
        L21FS_acc_list_ind = L21FS_Data.Data5(1).tmpTestCorr;
        other_acc_list_ind = data.Data5(1).tmpTestCorr;
            
           
        [h,p]=ttest(L21FS_acc_list_ind,other_acc_list_ind);
            
   
       
        p_matrix1(d,i)=p;
        
%         [h2,p2]=ttest(L21FS_acc_list_ind,other_acc_list_ind);
%         p_matrix2(d,i)=p2;
        
 
    end
end
p_matrix1
p_matrix2
end

