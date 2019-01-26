clear;
clc;
load('testCorrList_transformation.mat')
load('testCorrList_selection.mat')
y = 80:10:220;
plot(y,testCorrList_transformation(1,8:22)/100,'-*r');
hold on;
plot(y,testCorrList_selection(1,8:22)/100,'-ob');
xlim([80 220]);
ylim([0.87 0.94]);
set(gca,'FontSize',12);
xlabel('Feature numbers','FontSize',14);
ylabel('Accuracy','FontSize',14);
legend({'Transformation','Selection'},'FontSize',16)




