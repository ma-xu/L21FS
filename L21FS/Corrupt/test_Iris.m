load('../data/iris.mat');
c=1;

[ W ] = svc(label',data,c,2);
normW=sum(W.^2,2).^(1/2);
[~,index]= sort(normW,1,'DESCEND');
selected_index=sort(index(1:2,:))

%selected_index=[3;4];

newData=data(:,selected_index);
label=label';
class1_index= find(label==1);
class2_index= find(label==2);
class3_index= find(label==3);

plot(newData(class1_index,1),newData(class1_index,2),'*r','MarkerSize',9);
hold on;
plot(newData(class2_index,1),newData(class2_index,2),'og','MarkerSize',9);
hold on;
plot(newData(class3_index,1),newData(class3_index,2),'^k','MarkerSize',9);
hold on;
xlabel(strcat('Selected feature ',num2str(selected_index(1,:))),'fontsize',20);
ylabel(strcat('Selected feature ',num2str(selected_index(2,:))),'fontsize',20);
legend({'class 1';'class 2';'class 3';}, 'location','SouthEast','FontSize',20);
