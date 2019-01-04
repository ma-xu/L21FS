datasets={'usps';'madelon';'lung_discrete';'isolet5';'Isolet';'COIL20';'colon';};
i=7;



datapath=['../../','L21FS','/Gamma/GammaACC_',datasets{i},'.mat'];
Acc=cell2mat(struct2cell(load(datapath)));
%bar3(Acc','grouped');
bar3(Acc);
set(gca,'YTickLabel',2.^(-5:9));
ylabel('gamma value','fontsize',18);

set(gca,'XTickLabel',10:10:100);
xlabel('feature numbers','fontsize',18);
zlabel('classification accuracy','fontsize',18);

set(gca,'linewidth',1.5);

%title(datasets{i},'fontsize',20);
