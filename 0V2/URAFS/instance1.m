function [ Result ] = instance5( B,feaNum,outratio )
%B:        the input data, including label+data
%feaNum:   selected features number
 randSeedList=[11];
 Data5=[];
 
 avg_trainCorr_list=[];
 avg_testCorr_list=[];
 avg_cpu_time_list=[];
 avg_testcorrstd_list=[];
 
 for i =1:size(randSeedList,1)
     randSeed= randSeedList(i,1);
     [ Data ] = instance( B,feaNum,randSeed,outratio );
     
     avg_trainCorr_list=[avg_trainCorr_list Data.avg.trainCorr];
     avg_testCorr_list=[avg_testCorr_list Data.avg.testCorr];
     avg_cpu_time_list=[avg_cpu_time_list Data.avg.cpu_time];
     avg_testcorrstd_list=[avg_testcorrstd_list Data.avg.testcorrstd];
     
     Data5=[Data5;Data]  
 end
 Result.Data5=Data5;

 Result.avg5.trainCorr= mean(avg_trainCorr_list);
 Result.avg5.testCorr= mean(avg_testCorr_list);
 Result.avg5.cpu_time= mean(avg_cpu_time_list);
 Result.avg5.testcorrstd= mean(avg_testcorrstd_list);
 

end

