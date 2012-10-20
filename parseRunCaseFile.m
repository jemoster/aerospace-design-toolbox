function [ rc ] = parseRunCaseFile( filename )
% Copyright 2012 Joseph Moster
% Adapted to parse all necessary data by RJ Gritter, September 2012
% -fileLen mod done

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
runcase = 1;

fileLen = length(file);
while i<fileLen
    str = char(file(i));
    header = regexpi(str, 'Run case');
    
    if(length(header)>0)
        %load run case name
        a = strtrim(regexpi(str,'Run case  \d:', 'split'));
        rc(runcase).name = char(a(2));
        
        %Skip remainder of header
        i=i+2;
        while(length(char(file(i)))>0)
            i=i+1;
        end
        
        %Read off values
        rc(runcase).alpha     =   findValue(file,'alpha', [i,fileLen]);
        rc(runcase).beta      =   findValue(file,'beta', [i,fileLen]);
        rc(runcase).pb2V     =   findValue(file,'pb/2V', [i,fileLen]);
        rc(runcase).qc2V     =   findValue(file,'qc/2V', [i,fileLen]);
        rc(runcase).rb2V     =   findValue(file,'rb/2V', [i,fileLen]);
        rc(runcase).CL        =  findValue(file,'CL', [i,fileLen]);
        rc(runcase).CD0       =  findValue(file,'CDo', [i,fileLen]);
        rc(runcase).bank      =   findValue(file,'bank', [i,fileLen]);
        rc(runcase).elevation =   findValue(file,'elevation', [i,fileLen]);
        rc(runcase).heading   =   findValue(file,'heading', [i,fileLen]);
        rc(runcase).Mach      =   findValue(file,'Mach', [i,fileLen]);
        rc(runcase).velocity  =   findValue(file,'velocity', [i,fileLen]);
        rc(runcase).density   =  findValue(file,'density', [i,fileLen]);
        rc(runcase).grav_acc =   findValue(file,'grav.acc.', [i,fileLen]);
        rc(runcase).turn_rad =   findValue(file,'turn_rad.', [i,fileLen]);
        rc(runcase).load_fac =   findValue(file,'load_fac.', [i,fileLen]);
        rc(runcase).X_cg      =   findValue(file,'X_cg', [i,fileLen]);
        rc(runcase).Y_cg      =   findValue(file,'Y_cg', [i,fileLen]);
        rc(runcase).Z_cg      =   findValue(file,'Z_cg', [i,fileLen]);
        rc(runcase).mass      =  findValue(file,'mass', [i,fileLen]);
        rc(runcase).Ixx       =   findValue(file,'Ixx', [i,fileLen]);
        rc(runcase).Iyy       =   findValue(file,'Iyy', [i,fileLen]);
        rc(runcase).Izz       =   findValue(file,'Izz', [i,fileLen]);
        rc(runcase).Ixy       =   findValue(file,'Ixy', [i,fileLen]);
        rc(runcase).Iyz       =   findValue(file,'Iyz', [i,fileLen]);
        rc(runcase).Izx       =   findValue(file,'Izx', [i,fileLen]);
        rc(runcase).visc_CL_a =   findValue(file,'visc CL_a', [i,fileLen]);
        rc(runcase).visc_CL_u =   findValue(file,'visc CL_u', [i,fileLen]);
        rc(runcase).visc_CM_a =   findValue(file,'visc CM_a', [i,fileLen]);
        rc(runcase).visc_CM_u =   findValue(file,'visc CM_u', [i,fileLen]);
        
        runcase = runcase+1;
    end
    i=i+1;
end
end