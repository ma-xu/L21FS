function Result = hibiscus( Label, Inst,feaNum )
%Label:     tranning labels
%Inst:      tranning instances
%feaNum:    selected features number
   alphaGrid=-5:5;
   [ip] = GridExplore(Label, Inst, alphaGrid,feaNum);
   Best_alpha = 2^alphaGrid(1,ip);
   Result.Best_alpha = Best_alpha;

end

function [ip] = GridExplore(Label,Inst,alphaGrid,feaNum)
    maxACC=0;
    [m1] = size(alphaGrid,2); 
    ip=1;
    
    for i=1:m1
        ACC = K_svm_train(Label,Inst,2^alphaGrid(1,i),feaNum);
        if maxACC<ACC
            maxACC=ACC;
            ip=i;
        end
    end


 
end

