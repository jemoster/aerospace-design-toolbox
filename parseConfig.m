function [ mass ] = parseConfig( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Configuration');
    if(length(header)>0)
        mass.Sref = findValue('Sref =', [i,length(file)]);
        mass.Bref = findValue('Bref =', [i,length(file)]);
        mass.Cref = findValue('Cref =', [i,length(file)]);
        mass.Xref = findValue('Xref =', [i,length(file)]);
        mass.Yref = findValue('Yref =', [i,length(file)]);
        mass.Zref = findValue('Zref =', [i,length(file)]);
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


