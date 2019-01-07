clear;
clc;
load('../data/ORL_32x32.mat');


num18 = find(gnd==18);
num38 = find(gnd==38);
X = [fea(num18,:);fea(num38,:)];
Y = [gnd(num18,:);gnd(num38,:)];

avg = repmat(mean(X,1), size(X,1), 1);
X = X-avg;



alpha=100;
l=1;
[ A ] = svc(Y,X,alpha,l );
normA=zeros(size(A,1),1);
for i=1:size(A,1)
    normA(i,1)=norm(A(i,:));
end
[~,index]= sort(normA,1,'DESCEND');

sortA=A(index,1);
llvector = [32;64;128;256;354;512;640;768;896;1024];

for i=1:10
    
    ll=llvector(i,1);
    index_new = index(1:ll,:);
    person18 = fea(num18(1,1),:);
    person18_0=255*ones(size(person18));
    person18_0(1,index_new) = person18(1,index_new);
    person18_0 = reshape(person18_0,32,32);
    %subplot(2,5,i);
    
    positionVector = [0.1*(i-1) 0.75 0.095 0.2];
    
    
    subplot('Position',positionVector);
    
    imshow(person18_0/256);
    title(ll);
    
end

for i=1:10
    
    ll=llvector(i,1);
    index_new = index(1:ll,:);
    person18 = fea(num38(1,1),:);
    person18_0=255*ones(size(person18));
    person18_0(1,index_new) = person18(1,index_new);
    person18_0 = reshape(person18_0,32,32);
    %subplot(2,5,i);
    
    positionVector = [0.1*(i-1) 0.55 0.095 0.2];
    
    
    subplot('Position',positionVector);
    
    imshow(person18_0/256);
    title(ll);
    
end


