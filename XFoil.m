function [ Cl_max, Cm0] = XFoil( Re, Mach, filename, min, max, inc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[out,err] = dos('del .\temp\myFoil.dat');
% open the file with write permission
fid = fopen('./temp/xfoil.run', 'w');
fprintf(fid, 'PLOP\ng\n\n'); %Disable Graphics
fprintf(fid, '%s%s\n',   'LOAD ',filename); %Load relevant data
fprintf(fid, '%s\n',   'OPER');
fprintf(fid, '%s\n',   'VISC');
fprintf(fid, '%g\n',   Re);
fprintf(fid, '%s\n',   'MACH');
fprintf(fid, '%6.4f\n',   Mach);
fprintf(fid, '%s\n',   'Iter');
fprintf(fid, '%g\n',   500);
fprintf(fid, '%s \n %s\n\n',   'PACC', '.\temp\myFoil.dat');
fprintf(fid, '%s %g %g %g\n',   'Aseq', min, max, inc);
fprintf(fid, '%s\n',   'PACC');
fprintf(fid, '\nQUIT\n');     %Quit Program
fclose(fid);

killTimer = timer('TimerFcn',@(x,y)dos('taskkill /IM xfoil.exe /f'),'StartDelay',180.0);
start(killTimer);
[out,err] = dos('C:\mavl\xfoil.exe < .\temp\xfoil.run');
stop(killTimer);
delete(killTimer);

end

