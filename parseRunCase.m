function [ rc ] = parseRunCase( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Run case:');
    if(length(header)>0)
        rc.alpha = findValue('Alpha =', [i,length(file)]);
        rc.beta = findValue('Beta  =', [i,length(file)]);
        rc.mach = findValue('Mach  =', [i,length(file)]);
        rc.pb2v = findValue('pb/2V =', [i,length(file)]);
        rc.qc2v = findValue('qc/2V =', [i,length(file)]);
        rc.rb2v = findValue('rb/2V =', [i,length(file)]);
        rc.ppb2v = findValue('p''b/2V =', [i,length(file)]);
        rc.rpb2v = findValue('r''b/2V =', [i,length(file)]);
        
        rc.CXtot = findValue('CXtot =', [i,length(file)]);
        rc.CYtot = findValue('CYtot =', [i,length(file)]);
        rc.CXtot = findValue('CZtot =', [i,length(file)]);
        rc.Cltot = findValue('Cltot =', [i,length(file)]);
        rc.Cmtot = findValue('Cmtot =', [i,length(file)]);
        rc.Cntot = findValue('Cntot =', [i,length(file)]);
        rc.Clptot = findValue('Cl''tot', [i,length(file)]);
        rc.Cnptot = findValue('Cn''tot', [i,length(file)]);
        
        rc.CLtot = findValue('CLtot =', [i,length(file)]);
        rc.CDtot = findValue('CDtot =', [i,length(file)]);
        rc.CDvis = findValue('CDvis =', [i,length(file)]);
        rc.CLff = findValue('CLff  =', [i,length(file)]);
        rc.CYff = findValue('CYff  =', [i,length(file)]);
        rc.CDind = findValue('CDind =', [i,length(file)]);
        rc.CDff = findValue('CDff  =', [i,length(file)]);
        rc.e = findValue('e =', [i,length(file)]);
        
        %Detect surfaces
        %     elevator        =   0.00000
        rc.surface = [];
        j=z+2;
        s=1;
        while j<length(file)
            str = char(file(j));
            name = regexpi(str, '[a-z]', 'match');
            name = [name{:}];
            if(~isempty(name))
                rc.surface(s).name = name;
                s1 = regexpi(str, '=', 'split');
                rc.surface(s).angle = str2double(s1(2));
                s=s+1;
            elseif(isempty(str))
                break;
            end
            j=j+1;
        end
        break;
    end
    i=i+1;
end

    function [value] = findValue(string, area)
        for z=area(1):area(2)
            str = char(file(z));
            header = regexp(str, string);
            if(~isempty(header))
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

