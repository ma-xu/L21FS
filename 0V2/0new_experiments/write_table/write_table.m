MethodList = {'LS';'MCFS';'UMM';'URAFS';'LDFS';'DFS';'L21FS';};
datasetList ={'usps';'madelon';'isolet5';'COIL20';
    'lung_discrete';'Isolet';'colon';'lung';'warpPIE10P';'mnist'} ;

folder = '20Data_0.3Noise';
[p_matrix] = p_value(folder,MethodList,datasetList);

txtName = [folder,'.txt'];
delete(txtName);
% write method title
fp=fopen(txtName,'a');
fprintf(fp,'...\t');
for i = 1:length(MethodList)
    fprintf(fp,[MethodList{i},'\t']);
end
fprintf(fp,'\n');

for j = 1:length(datasetList)
    % print accuracy and std
    fprintf(fp,[datasetList{j},'\t']);
    for i = 1:length(MethodList)
        Method = MethodList{i};
        dataset = datasetList{j};
        data_PATH = ['../../',Method,'/',folder,'/Data_',dataset,'.mat'];
        data = cell2mat(struct2cell(load(data_PATH)))
        
        corr = num2str(roundn(data.avg5.testCorr,-2)) ;
        cputime = num2str(roundn(data.avg5.cpu_time,-2));
        std = num2str(roundn(data.avg5.testcorrstd,-2));
        
        fprintf(fp,[corr,'+',std,'\t']);  
    end
    fprintf(fp,'\n');
    
    % print cpu time
    fprintf(fp,'\t');
    for i = 1:length(MethodList)
        Method = MethodList{i};
        dataset = datasetList{j};
        data_PATH = ['../../',Method,'/',folder,'/Data_',dataset,'.mat'];
        data = cell2mat(struct2cell(load(data_PATH)));
        
        corr = num2str(roundn(data.avg5.testCorr,-2)) ;
        cputime = num2str(roundn(data.avg5.cpu_time,-2));
        std = num2str(roundn(data.avg5.testcorrstd,-2));
        
        fprintf(fp,[cputime,'\t']);  
    end
    fprintf(fp,'\n');
    
    % print p_value
    fprintf(fp,'\t');
    for i = 1:length(MethodList)
        pvalue = num2str(p_matrix(j,i));
        fprintf(fp,[pvalue,'\t']);  
    end
    fprintf(fp,'\n');

end
fclose(fp);
