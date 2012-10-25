function [value, line] = findValue(file, name, area)
%Check each line in the search area
        for line=area(1):area(2)
            %Get a line
            str = char(file(line));
            %Search the line for the keyword
            header = regexp(str, name);
            %If we found a line with the keyword in it
            if(~isempty(header))
                %Get the remainder of the string after the keyword
                str
                str = str(header+length(name):length(str));
                %Split the string everytime a space is found
                s2 = regexp(str, ' ', 'split');
                %For each element
                for j = 1:length(s2)
                    if(~isempty(s2{j})) % && ~strcmp(s2(j),'=')
                        value = str2double(char(s2(j)));
                        if ~isnan(value)
                            return;
                        end
                    end
                end
            end
        end
        warning(strcat('Did not variable in file: ', name));
        value = 0;

end