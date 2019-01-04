%{
load ../../UMM/FeaNum/FeaNumACC_usps.mat;
plot(10:10:100,FeaNumACC_usps(:,1:10),'r*');
hold on;
plot(10:10:100,FeaNumACC_usps(:,1:10),'r');
hold on;
axis([10 100 0 100]);
%}

Methods={'UMM';'MCFS';'LS';'DFS';'L21FS'};
plotcmd={'-r*';'-go';'-mx';'-bs';'-kp'};
datasets={'usps';'madelon';'lung_discrete';'isolet5';'Isolet';'COIL20';'colon';};
for i=1:length(Methods)
    datapath=['../../',Methods{i},'/FeaNum/FeaNumACC_',datasets{7},'.mat'];
    AccList=cell2mat(struct2cell(load(datapath)));
    plot(10:10:100,AccList(:,1:10),plotcmd{i},'MarkerSize',8);
    hold on;
    axis([10 100 40 100]);
    xlabel('Number of selected features','fontsize',18); 
    ylabel('Classification accuracy','fontsize',18);
    clearvars -except Methods plotcmd datasets;
end
legend(Methods, 'location','SouthEast','FontSize',17);
set(gca,'FontSize',16);
set(gca,'linewidth',1.5);
%title(datasets{1},'fontsize',15);