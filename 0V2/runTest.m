try
    clear;clc;run('L21FS/test');
catch ErrorInfo
    write_error('L21FS',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_data_big');
catch ErrorInfo
    write_error('test20_data_big',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_noise_big');
catch ErrorInfo
    write_error('test20_noise_big',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_data_big');
catch ErrorInfo
    write_error('test40_data_big',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_noise_big');
catch ErrorInfo
    write_error('test40_noise_big',ErrorInfo);
end
%{
try
    clear;clc;run('LS/test');
catch ErrorInfo
    write_error('LS',ErrorInfo);
end
try
    clear;clc;run('UMM/test');
catch ErrorInfo
    write_error('UMM',ErrorInfo);
end
try
    clear;clc;run('MCFS/test');
catch ErrorInfo
    write_error('MCFS',ErrorInfo);
end
try
    clear;run('L21FS/test');
catch ErrorInfo
    write_error('L21FS',ErrorInfo);
end
try
    clear;run('DFS/test');
catch ErrorInfo
    write_error('DFS',ErrorInfo);
end
try
    clear;run('URAFS/test');
catch ErrorInfo
    write_error('URAFS',ErrorInfo);
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



