function [ sd ] = parseSB( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Geometry-axis derivatives...');
    if(length(header)>0)
        sd.CXu = findValue('CXu =', [i,length(file)]);
        sd.CYu = findValue('CYu =', [i,length(file)]);
        sd.CZu = findValue('CZu =', [i,length(file)]);
        sd.Clu = findValue('Clu =', [i,length(file)]);
        sd.Cmu = findValue('Cmu =', [i,length(file)]);
        sd.Cnu = findValue('Cnu =', [i,length(file)]);
        
        sd.CXv = findValue('CXv =', [i,length(file)]);
        sd.CYv = findValue('CYv =', [i,length(file)]);
        sd.CZv = findValue('CZv =', [i,length(file)]);
        sd.Clv = findValue('Clv =', [i,length(file)]);
        sd.Cmv = findValue('Cmv =', [i,length(file)]);
        sd.Cnv = findValue('Cnv =', [i,length(file)]);
        
        sd.CXw = findValue('CXw =', [i,length(file)]);
        sd.CYw = findValue('CYw =', [i,length(file)]);
        sd.CZw = findValue('CZw =', [i,length(file)]);
        sd.Clw = findValue('Clw =', [i,length(file)]);
        sd.Cmw = findValue('Cmw =', [i,length(file)]);
        sd.Cnw = findValue('Cnw =', [i,length(file)]);
        
        sd.CXp = findValue('CXp =', [i,length(file)]);
        sd.CYp = findValue('CYp =', [i,length(file)]);
        sd.CZp = findValue('CZp =', [i,length(file)]);
        sd.Clp = findValue('Clp =', [i,length(file)]);
        sd.Cmp = findValue('Cmp =', [i,length(file)]);
        sd.Cnp = findValue('Cnp =', [i,length(file)]);
        
        sd.CXq = findValue('CXq =', [i,length(file)]);
        sd.CYq = findValue('CYq =', [i,length(file)]);
        sd.CZq = findValue('CZq =', [i,length(file)]);
        sd.Clq = findValue('Clq =', [i,length(file)]);
        sd.Cmq = findValue('Cmq =', [i,length(file)]);
        sd.Cnq = findValue('Cnq =', [i,length(file)]);
        
        sd.CXr = findValue('CXr =', [i,length(file)]);
        sd.CYr = findValue('CYr =', [i,length(file)]);
        sd.CZr = findValue('CZr =', [i,length(file)]);
        sd.Clr = findValue('Clr =', [i,length(file)]);
        sd.Cmr = findValue('Cmr =', [i,length(file)]);
        sd.Cnr = findValue('Cnr =', [i,length(file)]);
        
        sd.surface = [];
        rc = parseRunCase(filename);
        for surf=1:length(rc.surface)
            sd.surface(surf).name = rc.surface(surf).name;
            sd.surface(surf).CX   = findValue(strcat('CXd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CY   = findValue(strcat('CYd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CZ   = findValue(strcat('CZd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cl   = findValue(strcat('Cld',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cm   = findValue(strcat('Cmd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cn   = findValue(strcat('Cnd',num2str(surf),' ='), [i,length(file)]);
        end
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

