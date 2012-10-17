function [ rc ] = parseRunCaseFile( filename )
% Copyright 2012 Joseph Moster
% Adapted to parse all necessary data by RJ Gritter, September 2012
% -fileLen mod done

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
fileLen = length(file);
while i<fileLen
    str = char(file(i));
    header = regexpi(str, 'Configuration');
    if(length(header)>0)
        rc.Sref = findValue('Sref =', [i,fileLen]);
        rc.Bref = findValue('Bref =', [i,fileLen]);
        rc.Cref = findValue('Cref =', [i,fileLen]);
        rc.Xref = findValue('Xref =', [i,fileLen]);
        rc.Yref = findValue('Yref =', [i,fileLen]);
        rc.Zref = findValue('Zref =', [i,fileLen]);
        rc.Ixx = findValue('Ixx = ', [i,fileLen]);
        rc.Iyy = findValue('Iyy = ', [i,fileLen]);
        rc.Izz = findValue('Izz = ', [i,fileLen]);
        rc.mass = findValue('mass = ', [i,fileLen]);
        rc.dens = findValue('density = ', [i,fileLen]);
        rc.vel = findValue('velocity = ', [i,fileLen]);     % To use for "initial velocity" stuff 
        rc.elev = findValue('elevation = ', [i,fileLen]);   % To use for "initial angle" stuff 
        rc.CD0 = findValue('CD0 = ', [i,fileLen]);
        rc.grav = findValue('grav.acc. = ', [i,fileLen]);
        break;
    end
    i=i+1;
end

    function [value] = findValue(string, area)
        for z=area(1):area(2)
            str = char(file(z));
            header = regexp(str, string);
            if(length(header)>0)
                str = str(header+length(string):length(str));
                s2 = regexp(str, ' ', 'split');
                for j = 1:length(s2)
                    if(length(char(s2(j)))>1)
                        value = str2double(char(s2(j)));
                        return;
                    end
                end
            end
        end
    end

end


