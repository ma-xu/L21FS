function Result = hibiscus( Label, Inst )
%Label:     tranning labels
%Inst:      tranning instances
%feaNum:    selected features number
   alphaGrid=-5:5;
   lambdaGrid = -5:5;
   [ip,il] = GridExplore(Label, Inst, alphaGrid,lambdaGrid);
   Best_alpha = 2^alphaGrid(1,ip);
   Best_lambda = 2^alphaGrid(1,il);
   Result.Best_alpha = Best_alpha;
   Result.Best_lambda = Best_lambda;
end

function [ip,il] = GridExplore(Label,Inst,alphaGrid,lambdaGrid)
    maxACC=0;
    [m1] = size(alphaGrid,2); 
    [m2] = size(lambdaGrid,2); 
    ip=1;
    il = 1;
    
    for i=1:m1
        for j = 1:m2
            ACC = K_svm_train(Label,Inst,2^alphaGrid(1,i),2^lambdaGrid(1,j));
            if maxACC<ACC
                maxACC=ACC;
                ip=i;
                il = j;
            end
        end
    end


 
end

