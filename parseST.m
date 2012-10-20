function [ sd ] = parseST( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Stability-axis derivatives...');
    if(length(header)>0)
        sd.CLa = findValue(file ,'CLa =', [i,length(file)]);
        sd.CYa = findValue(file ,'CYa =', [i,length(file)]);
        sd.Cla = findValue(file ,'Cla =', [i,length(file)]);
        sd.Cma = findValue(file ,'Cma =', [i,length(file)]);
        sd.Cna = findValue(file ,'Cna =', [i,length(file)]);
        
        sd.CLb = findValue(file ,'CLb =', [i,length(file)]);
        sd.CYb = findValue(file ,'CYb =', [i,length(file)]);
        sd.Clb = findValue(file ,'Clb =', [i,length(file)]);
        sd.Cmb = findValue(file ,'Cmb =', [i,length(file)]);
        sd.Cnb = findValue(file ,'Cnb =', [i,length(file)]);
        
        sd.CLp = findValue(file ,'CLp =', [i,length(file)]);
        sd.CYp = findValue(file ,'CYp =', [i,length(file)]);
        sd.Clp = findValue(file ,'Clp =', [i,length(file)]);
        sd.Cmp = findValue(file ,'Cmp =', [i,length(file)]);
        sd.Cnp = findValue(file ,'Cnp =', [i,length(file)]);
        
        sd.CLq = findValue(file ,'CLq =', [i,length(file)]);
        sd.CYq = findValue(file ,'CYq =', [i,length(file)]);
        sd.Clq = findValue(file ,'Clq =', [i,length(file)]);
        sd.Cmq = findValue(file ,'Cmq =', [i,length(file)]);
        sd.Cnq = findValue(file ,'Cnq =', [i,length(file)]);
        
        sd.CLr = findValue(file ,'CLr =', [i,length(file)]);
        sd.CYr = findValue(file ,'CYr =', [i,length(file)]);
        sd.Clr = findValue(file ,'Clr =', [i,length(file)]);
        sd.Cmr = findValue(file ,'Cmr =', [i,length(file)]);
        sd.Cnr = findValue(file ,'Cnr =', [i,length(file)]);
        
        sd.NP = findValue(file ,'Xnp =', [i,length(file)]);
        
        sd.surface = [];
        rc = parseRunCaseHeader(filename);
        for surf=1:length(rc.surface)
            sd.surface(surf).name = rc.surface(surf).name;
            sd.surface(surf).CL   = findValue(file ,strcat('CLd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CY   = findValue(file ,strcat('CYd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cl   = findValue(file ,strcat('Cld',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cm   = findValue(file ,strcat('Cmd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cn   = findValue(file ,strcat('Cnd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CDff   = findValue(file ,strcat('CDffd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).e   = findValue(file ,strcat('ed',num2str(surf),' ='), [i,length(file)]);
        end
        
        break;
    end
    i=i+1;
end
end

