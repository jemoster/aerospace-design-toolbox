function [ foil ] = parseXFoil( filename )
%This script does not parse the control surface stability data

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
fileLen = length(file);

i=1;

%Read run properties
foil.Mach = findValue(file ,'Mach', [i,fileLen]);
%foil.Re = findValue(file ,'Re', [i,fileLen]);
foil.Ncrit = findValue(file ,'Ncrit', [i,fileLen]);
    
while i<length(file) 
    str = char(file(i));
    
    if(~isempty(regexp(str, 'Re =')))
        foil.Re = str2double(regexprep(regexp(str,'(?<=Re =).*(?=Ncrit)', 'match'),'[\s]',''));
    end
    
    
    if(~isempty(regexp(str, 'Calculated polar for:')))
        foil.name = char(strtrim(regexpi(str,'(?<=Calculated polar for:).*', 'match')));
    end

    header = regexp(str, 'alpha');
    if(length(header)>0)
        
        i=i+2;
        
        j=1;
        while(length(str)>0&&i<=length(file))
            str = char(file(i));
            foil.data(j) = readLine(str);
            j=j+1;
            i=i+1;
        end
        break;
    end
    i=i+1;
end

    function [foil] = readLine(string)
        string = [string ' '];
        s2 = regexp(string, ' ', 'split');
        [foil.alpha, sIndex] = readValue(s2,1);
        [foil.CL, sIndex] = readValue(s2,sIndex+1);
        [foil.CD, sIndex] = readValue(s2,sIndex+1);
        [foil.CDp, sIndex] = readValue(s2,sIndex+1);
        [foil.CM, sIndex] = readValue(s2,sIndex+1);
        [foil.Top_Xtr, sIndex] = readValue(s2,sIndex+1);
        [foil.Bot_Xtr, sIndex] = readValue(s2,sIndex+1);
    end
    function [val,endIndex] = readValue(s2,index)
        while index<length(s2)
            if(length(char(s2(index)))>=1)
                val = str2double(char(s2(index)));
                break;
            end
            index = index+1;
        end
        endIndex = index;
    end
end

