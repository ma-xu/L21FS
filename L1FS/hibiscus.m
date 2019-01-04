function Result = hibiscus( Label, Inst,feaNum,rdim )
%Label:     tranning labels
%Inst:      tranning instances
%feaNum:    selected features number
%rdmin:     the project matrix dimension
   lambdGrid=-7:7;
   [ip] = GridExplore(Label, Inst, lambdGrid,feaNum,rdim);
   Best_lambd = 2^lambdGrid(1,ip);
   Result.Best_lambd = Best_lambd;

end

function [ip] = GridExplore(Label, Inst, lambdGrid,feaNum,rdim)
    maxACC=0;
    [m1] = size(lambdGrid,2); 
    TErr =0;
    VErr =0;
    ip=1;
    
    for i=1:m1
        ACC = K_svm_train(Label,Inst,2^lambdGrid(1,i),feaNum,rdim);
        if maxACC<ACC
            maxACC=ACC;
            ip=i;
        end
    end


 
end

