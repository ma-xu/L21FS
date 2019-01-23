
try
    clear;clc;run('L21FS/test20_dim10');
catch ErrorInfo
    write_error('URAFS/test20_dim10',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_dim20');
catch ErrorInfo
    write_error('URAFS/test20_dim20',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_dim40');
catch ErrorInfo
    write_error('URAFS/test20_dim40',ErrorInfo);
end




try
    clear;clc;run('L21FS/test40_dim10');
catch ErrorInfo
    write_error('URAFS/test40_dim10',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_dim20');
catch ErrorInfo
    write_error('URAFS/test40_dim20',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_dim40');
catch ErrorInfo
    write_error('URAFS/test40_dim40',ErrorInfo);
end




try
    clear;clc;run('L21FS/test20_noise_dim10');
catch ErrorInfo
    write_error('URAFS/test20_noise_dim10',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_noise_dim20');
catch ErrorInfo
    write_error('URAFS/test20_noise_dim20',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_noise_dim40');
catch ErrorInfo
    write_error('URAFS/test20_noise_dim40',ErrorInfo);
end


try
    clear;clc;run('L21FS/test40_noise_dim10');
catch ErrorInfo
    write_error('URAFS/test40_noise_dim10',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_noise_dim20');
catch ErrorInfo
    write_error('URAFS/test40_noise_dim20',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_noise_dim40');
catch ErrorInfo
    write_error('URAFS/test40_noise_dim40',ErrorInfo);
end
%{
try
    clear;clc;run('URAFS/test');
catch ErrorInfo
    write_error('URAFS/test',ErrorInfo);
end
try
    clear;clc;run('URAFS/test20_Noise');
catch ErrorInfo
    write_error('URAFS/test20_Noise',ErrorInfo);
end
try
    clear;clc;run('URAFS/test40');
catch ErrorInfo
    write_error('URAFS/test40',ErrorInfo);
end
try
    clear;clc;run('URAFS/test40_Noise');
catch ErrorInfo
    write_error('URAFS/test40_Noise',ErrorInfo);
end
%}


%{
try
    clear;clc;run('LDFS/test20');
catch ErrorInfo
    write_error('LDFS/test20',ErrorInfo);
end

try
    clear;clc;run('LDFS/test20_noise');
catch ErrorInfo
    write_error('LDFS/test20_noise',ErrorInfo);
end

try
    clear;clc;run('LDFS/test40_noise');
catch ErrorInfo
    write_error('LDFS/test40_noise',ErrorInfo);
end

%--------LS----------
try
    clear;clc;run('LS/test20_big');
catch ErrorInfo
    write_error('LS/test20_big',ErrorInfo);
end
try
    clear;clc;run('LS/test20_big_noise');
catch ErrorInfo
    write_error('LS/test20_big_noise',ErrorInfo);
end
try
    clear;clc;run('LS/test40_big_noise');
catch ErrorInfo
    write_error('LS/test40_big_noise',ErrorInfo);
end

%---------MCFS----------
try
    clear;clc;run('MCFS/test20_big');
catch ErrorInfo
    write_error('MCFS/test20_big',ErrorInfo);
end
try
    clear;clc;run('MCFS/test20_big_noise');
catch ErrorInfo
    write_error('MCFS/test20_big_noise',ErrorInfo);
end
try
    clear;clc;run('MCFS/test40_big_noise');
catch ErrorInfo
    write_error('MCFS/test40_big_noise',ErrorInfo);
end


%--------------UMM---------------

try
    clear;clc;run('UMM/test20_big');
catch ErrorInfo
    write_error('UMM/test20_big',ErrorInfo);
end
try
    clear;clc;run('UMM/test20_big_noise');
catch ErrorInfo
    write_error('UMM/test20_big_noise',ErrorInfo);
end
try
    clear;clc;run('UMM/test40_big_noise');
catch ErrorInfo
    write_error('UMM/test40_big_noise',ErrorInfo);
end

%--------------DFS---------------

try
    clear;clc;run('DFS/test20_big');
catch ErrorInfo
    write_error('DFS/test20_big',ErrorInfo);
end
try
    clear;clc;run('DFS/test40_big');
catch ErrorInfo
    write_error('DFS/test40_big',ErrorInfo);
end
try
    clear;clc;run('DFS/test20_big_noise');
catch ErrorInfo
    write_error('DFS/test20_big_noise',ErrorInfo);
end
try
    clear;clc;run('DFS/test40_big_noise');
catch ErrorInfo
    write_error('DFS/test40_big_noise',ErrorInfo);
end

%--------------URAFS---------------
try
    clear;clc;run('URAFS/test20_big');
catch ErrorInfo
    write_error('URAFS/test20_big',ErrorInfo);
end
try
    clear;clc;run('URAFS/test40_big');
catch ErrorInfo
    write_error('URAFS/test40_big',ErrorInfo);
end
try
    clear;clc;run('URAFS/test20_big_noise');
catch ErrorInfo
    write_error('URAFS/test20_big_noise',ErrorInfo);
end
try
    clear;clc;run('URAFS/test40_big_noise');
catch ErrorInfo
    write_error('URAFS/test40_big_noise',ErrorInfo);
end
%}








function write_error(str,ErrorInfo)
    msgText = getReport(ErrorInfo);
    msgText=[msgText, '\n ______________________________\n\n\n'];
    msgText=['[[[',str,']]]','\n',msgText,'\n\n\n\n\n\n'];
    fid = fopen('error_report.txt','w');
    fprintf(fid,msgText);
    fclose(fid);
end



