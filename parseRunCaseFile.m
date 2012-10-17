function [ rc ] = parseRunCaseFile( filename )
% Copyright 2012 Joseph Moster
% Adapted to parse all necessary data by RJ Gritter, September 2012
% -fileLen mod done

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
fileLen = length(file);
while i<fileLen
    str = char(file(i));
    header = regexpi(str, 'Run case');
    
    if(length(header)>0)
        
        %Skip remainder of header
        i=i+2;
        while(length(char(file(i)))>0)
            i=i+1;
        end
        
        %Read off values
        rc.alpha     =   findValue('alpha', [i,fileLen]);
        rc.beta      =   findValue('beta', [i,fileLen]);
        rc.pb2V     =   findValue('pb/2V', [i,fileLen]);
        rc.qc2V     =   findValue('qc/2V', [i,fileLen]);
        rc.rb2V     =   findValue('rb/2V', [i,fileLen]);
        rc.CL        =  findValue('CL', [i,fileLen]);
        rc.CD0       =  findValue('CDo', [i,fileLen]);
        rc.bank      =   findValue('bank', [i,fileLen]);
        rc.elevation =   findValue('elevation', [i,fileLen]);
        rc.heading   =   findValue('heading', [i,fileLen]);
        rc.Mach      =   findValue('Mach', [i,fileLen]);
        rc.velocity  =   findValue('velocity', [i,fileLen]);
        rc.density   =  findValue('density', [i,fileLen]);
        rc.grav_acc =   findValue('grav.acc.', [i,fileLen]);
        rc.turn_rad =   findValue('turn_rad.', [i,fileLen]);
        rc.load_fac =   findValue('load_fac.', [i,fileLen]);
        rc.X_cg      =   findValue('X_cg', [i,fileLen]);
        rc.Y_cg      =   findValue('Y_cg', [i,fileLen]);
        rc.Z_cg      =   findValue('Z_cg', [i,fileLen]);
        rc.mass      =  findValue('mass', [i,fileLen]);
        rc.Ixx       =   findValue('Ixx', [i,fileLen]);
        rc.Iyy       =   findValue('Iyy', [i,fileLen]);
        rc.Izz       =   findValue('Izz', [i,fileLen]);
        rc.Ixy       =   findValue('Ixy', [i,fileLen]);
        rc.Iyz       =   findValue('Iyz', [i,fileLen]);
        rc.Izx       =   findValue('Izx', [i,fileLen]);
        rc.visc_CL_a =   findValue('visc CL_a', [i,fileLen]);
        rc.visc_CL_u =   findValue('visc CL_u', [i,fileLen]);
        rc.visc_CM_a =   findValue('visc CM_a', [i,fileLen]);
        rc.visc_CM_u =   findValue('visc CM_u', [i,fileLen]);
        
        
        break;
    end
    i=i+1;
end
    function [val] = findValue(name,area)
        %Check each line in the search area
        for z=area(1):area(2)
            %Get a line
            str = char(file(z));
            %Search the line for the keyword
            header = regexp(str, name);
            %If we found something
            if(length(header)>0)
                %Get the remainder of the string after the keyword
                str = str(header+length(name):length(str));
                %Split the string everytime a space is found
                s2 = regexp(str, ' ', 'split');
                %For each element
                for j = 1:length(s2)
                    if(~isempty(s2{j})) % && ~strcmp(s2(j),'=')
                        val = str2double(char(s2(j)));
                        if ~isnan(val)
                            return;
                        end
                    end
                end
                warning(strcat('Could not find value for variable: ',name));
            end
        end
        warning(strcat('Did not variable in file: ',name));
        val = 0;
    end


end