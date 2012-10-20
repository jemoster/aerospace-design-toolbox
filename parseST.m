function [ sd ] = parseST( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Stability-axis derivatives...');
    if(length(header)>0)
        sd.CLa = findValue('CLa =', [i,length(file)]);
        sd.CYa = findValue('CYa =', [i,length(file)]);
        sd.Cla = findValue('Cla =', [i,length(file)]);
        sd.Cma = findValue('Cma =', [i,length(file)]);
        sd.Cna = findValue('Cna =', [i,length(file)]);
        
        sd.CLb = findValue('CLb =', [i,length(file)]);
        sd.CYb = findValue('CYb =', [i,length(file)]);
        sd.Clb = findValue('Clb =', [i,length(file)]);
        sd.Cmb = findValue('Cmb =', [i,length(file)]);
        sd.Cnb = findValue('Cnb =', [i,length(file)]);
        
        sd.CLp = findValue('CLp =', [i,length(file)]);
        sd.CYp = findValue('CYp =', [i,length(file)]);
        sd.Clp = findValue('Clp =', [i,length(file)]);
        sd.Cmp = findValue('Cmp =', [i,length(file)]);
        sd.Cnp = findValue('Cnp =', [i,length(file)]);
        
        sd.CLq = findValue('CLq =', [i,length(file)]);
        sd.CYq = findValue('CYq =', [i,length(file)]);
        sd.Clq = findValue('Clq =', [i,length(file)]);
        sd.Cmq = findValue('Cmq =', [i,length(file)]);
        sd.Cnq = findValue('Cnq =', [i,length(file)]);
        
        sd.CLr = findValue('CLr =', [i,length(file)]);
        sd.CYr = findValue('CYr =', [i,length(file)]);
        sd.Clr = findValue('Clr =', [i,length(file)]);
        sd.Cmr = findValue('Cmr =', [i,length(file)]);
        sd.Cnr = findValue('Cnr =', [i,length(file)]);
        
        sd.NP = findValue('Xnp =', [i,length(file)]);
        
        sd.surface = [];
        rc = parseRunCaseHeader(filename);
        for surf=1:length(rc.surface)
            sd.surface(surf).name = rc.surface(surf).name;
            sd.surface(surf).CL   = findValue(strcat('CLd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CY   = findValue(strcat('CYd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cl   = findValue(strcat('Cld',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cm   = findValue(strcat('Cmd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cn   = findValue(strcat('Cnd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CDff   = findValue(strcat('CDffd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).e   = findValue(strcat('ed',num2str(surf),' ='), [i,length(file)]);
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

