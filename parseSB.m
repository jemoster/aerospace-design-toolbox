function [ sd ] = parseSB( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Geometry-axis derivatives...');
    if(length(header)>0)
        sd.CXu = findValue(file ,'CXu =', [i,length(file)]);
        sd.CYu = findValue(file ,'CYu =', [i,length(file)]);
        sd.CZu = findValue(file ,'CZu =', [i,length(file)]);
        sd.Clu = findValue(file ,'Clu =', [i,length(file)]);
        sd.Cmu = findValue(file ,'Cmu =', [i,length(file)]);
        sd.Cnu = findValue(file ,'Cnu =', [i,length(file)]);
        
        sd.CXv = findValue(file ,'CXv =', [i,length(file)]);
        sd.CYv = findValue(file ,'CYv =', [i,length(file)]);
        sd.CZv = findValue(file ,'CZv =', [i,length(file)]);
        sd.Clv = findValue(file ,'Clv =', [i,length(file)]);
        sd.Cmv = findValue(file ,'Cmv =', [i,length(file)]);
        sd.Cnv = findValue(file ,'Cnv =', [i,length(file)]);
        
        sd.CXw = findValue(file ,'CXw =', [i,length(file)]);
        sd.CYw = findValue(file ,'CYw =', [i,length(file)]);
        sd.CZw = findValue(file ,'CZw =', [i,length(file)]);
        sd.Clw = findValue(file ,'Clw =', [i,length(file)]);
        sd.Cmw = findValue(file ,'Cmw =', [i,length(file)]);
        sd.Cnw = findValue(file ,'Cnw =', [i,length(file)]);
        
        sd.CXp = findValue(file ,'CXp =', [i,length(file)]);
        sd.CYp = findValue(file ,'CYp =', [i,length(file)]);
        sd.CZp = findValue(file ,'CZp =', [i,length(file)]);
        sd.Clp = findValue(file ,'Clp =', [i,length(file)]);
        sd.Cmp = findValue(file ,'Cmp =', [i,length(file)]);
        sd.Cnp = findValue(file ,'Cnp =', [i,length(file)]);
        
        sd.CXq = findValue(file ,'CXq =', [i,length(file)]);
        sd.CYq = findValue(file ,'CYq =', [i,length(file)]);
        sd.CZq = findValue(file ,'CZq =', [i,length(file)]);
        sd.Clq = findValue(file ,'Clq =', [i,length(file)]);
        sd.Cmq = findValue(file ,'Cmq =', [i,length(file)]);
        sd.Cnq = findValue(file ,'Cnq =', [i,length(file)]);
        
        sd.CXr = findValue(file ,'CXr =', [i,length(file)]);
        sd.CYr = findValue(file ,'CYr =', [i,length(file)]);
        sd.CZr = findValue(file ,'CZr =', [i,length(file)]);
        sd.Clr = findValue(file ,'Clr =', [i,length(file)]);
        sd.Cmr = findValue(file ,'Cmr =', [i,length(file)]);
        sd.Cnr = findValue(file ,'Cnr =', [i,length(file)]);
        
        sd.surface = [];
        rc = parseRunCaseHeader(filename);
        for surf=1:length(rc.surface)
            sd.surface(surf).name = rc.surface(surf).name;
            sd.surface(surf).CX   = findValue(file ,strcat('CXd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CY   = findValue(file ,strcat('CYd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).CZ   = findValue(file ,strcat('CZd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cl   = findValue(file ,strcat('Cld',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cm   = findValue(file ,strcat('Cmd',num2str(surf),' ='), [i,length(file)]);
            sd.surface(surf).Cn   = findValue(file ,strcat('Cnd',num2str(surf),' ='), [i,length(file)]);
        end
        break;
    end
    i=i+1;
end
end

