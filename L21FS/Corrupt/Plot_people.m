load('../../data/ORL.mat');
selected_people=[1,11,21,31,41,51];
number=length(selected_people);
for i=1:number
    person = fea(selected_people(1,i),:);
    person = reshape(person,32,32);
    %subplot(2,number,i);
     positionVector = [0.15*(i-1) 0.75 0.14 0.25];
     subplot('Position',positionVector);
    imshow(person/256);
end


%clearvars -except selected_people number
load('../../data/ORLcorrupt8.mat');

for i=1:number
    person = fea(selected_people(1,i),:);
    person = reshape(person,32,32);
    %subplot(2,number,number+i);
     positionVector = [0.15*(i-1) 0.5 0.14 0.25];
     subplot('Position',positionVector);
    imshow(person/256);
end


