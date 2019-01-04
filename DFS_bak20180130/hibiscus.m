function Result = hibiscus( Label, Inst,feaNum,rdim )
%Label:     tranning labels
%Inst:      tranning instances
%feaNum:    selected features number
%rdmin:     the project matrix dimension
   gammaGrid=-7:7;
   pGrid=0.1:0.1:1;
   [igamma,ip] = GridExplore(Label, Inst,gammaGrid,pGrid,feaNum,rdim);
   Best_gamma = 2^gammaGrid(1,igamma);
   Best_p=pGrid(1,ip);
   Result.Best_gamma = Best_gamma;
   Result.Best_p=Best_p;

end

function [igamma,ip] = GridExplore(Label, Inst, gammaGrid,pGrid,feaNum,rdim)
    maxACC=0;
    [m1] = size(gammaGrid,2); 
    [m2]=size(pGrid,2);
    igamma=1;
    ip=1;
    
    for i=1:m1
        for j=1:m2;
            i
            j
            ACC = K_svm_train(Label,Inst,2^gammaGrid(1,i),pGrid(1,j),feaNum,rdim);
            if maxACC<ACC
                maxACC=ACC;
                igamma=i;
                ip=j;
                
            end
        end
    end


 
end

