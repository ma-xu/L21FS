
try
    clear;clc;run('L21FS/test20_noise_dim7');
catch ErrorInfo
    write_error('L21FS/test20_noise_dim7',ErrorInfo);
end
try
    clear;clc;run('L21FS/test20_noise_dim15');
catch ErrorInfo
    write_error('L21FS/test20_noise_dim15',ErrorInfo);
end

try
    clear;clc;run('L21FS/test40_noise_dim7');
catch ErrorInfo
    write_error('L21FS/test40_noise_dim7',ErrorInfo);
end
try
    clear;clc;run('L21FS/test40_noise_dim15');
catch ErrorInfo
    write_error('L21FS/test40_noise_dim15',ErrorInfo);
end



function write_error(str,ErrorInfo)
    msgText = getReport(ErrorInfo);
    msgText=[msgText, '\n ______________________________\n\n\n'];
    msgText=['[[[',str,']]]','\n',msgText,'\n\n\n\n\n\n'];
    fid = fopen('error_report.txt','w');
    fprintf(fid,msgText);
    fclose(fid);
end



