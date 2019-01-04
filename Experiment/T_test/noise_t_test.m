datasets={'usps';'madelon';'lung_discrete';'isolet5';'Isolet';'COIL20';'colon'};
Methods={'UMM';'MCFS';'LS';'DFS';'L21FS'};
accMatrix={};
feaNum=40;
for i=1:length(Methods)
    for j=1:length(datasets)
        datapath=['../../',Methods{i},'/Noise/',num2str(feaNum),'Data_0.3Noise/Data_',datasets{j},'.mat'];
        A=cell2mat(struct2cell(load(datapath)));
        accMatrix{j,i}=A.tmpTestCorr;
    end  
end
clearvars -except accMatrix;

Ttest=[];
for i=1:size(accMatrix,1)
    for j=1:size(accMatrix,2)
        A=accMatrix{i,j};
        B=accMatrix{i,end};
        [h,p]=ttest2(A,B);
        Ttest(i,j)=p;
    end
end
Ttest