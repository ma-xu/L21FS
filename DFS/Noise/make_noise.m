function [ dtrain,Ctrain ] = make_noise( dtrain,Ctrain,outratio)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a=11;
    rand('state',a);
    uniqued = unique(dtrain);
    %outratio=0;
    nf=0.1;
    for jjk=1:size(uniqued,1) %%%%%%partion points of each class into k parts.
        Inde=(find(dtrain==uniqued(jjk,1)));
        randn('state',jjk*1000);
        % randn('state',a);
        outn=fix(size(Inde,1)*outratio);
        Mm= sqrt(1)*randn(outn,size(Ctrain,2));  
        Ctrain(Inde(1:outn,:),:)=Ctrain(Inde(1:outn,:),:)+nf*(norm(Ctrain(Inde(1:outn,:),:),'fro')/(norm(Mm,'fro')+eps))*Mm;       
    end
    r=randperm(size(Ctrain,1));
    dtrain=dtrain(r,:);
    Ctrain=Ctrain(r,:);
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

