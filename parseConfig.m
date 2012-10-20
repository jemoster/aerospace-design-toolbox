function [ mass ] = parseConfig( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Configuration');
    if(length(header)>0)
        mass.Sref = findValue(file ,'Sref =', [i,length(file)]);
        mass.Bref = findValue(file ,'Bref =', [i,length(file)]);
        mass.Cref = findValue(file ,'Cref =', [i,length(file)]);
        mass.Xref = findValue(file ,'Xref =', [i,length(file)]);
        mass.Yref = findValue(file ,'Yref =', [i,length(file)]);
        mass.Zref = findValue(file ,'Zref =', [i,length(file)]);
        break;
    end
    i=i+1;
end
end


