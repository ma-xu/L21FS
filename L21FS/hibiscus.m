function Result = hibiscus( Label, Inst,feaNum,rdim )
%Label:     tranning labels
%Inst:      tranning instances
%feaNum:    selected features number
%rdim:     the project matrix dimension
   cGrid=-1:10;
  
   [ic] = GridExplore(Label, Inst,cGrid,feaNum,rdim);
   Best_c = 2^cGrid(1,ic);
   Result.Best_c=Best_c;

end

function [ic] = GridExplore(Label, Inst, cGrid,feaNum,rdim)
    maxACC=0;
    [m1] = size(cGrid,2); 
    
    ic=1;
    
    
    for i=1:m1
           
        ACC = K_svm_train(Label,Inst,2^cGrid(1,i),feaNum,rdim);
        if maxACC<ACC
            maxACC=ACC;
            ic=i;
        end 
    end


 
end

