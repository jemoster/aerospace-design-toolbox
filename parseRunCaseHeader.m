function [ rc ] = parseRunCaseHeader( filename )
% Copyright 2012 Joseph Moster

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');
i=1;
while i<length(file)
    str = char(file(i));
    header = regexpi(str, 'Run case:');
    if(length(header)>0)
        rc.alpha = findValue(file, 'Alpha =', [i,length(file)]);
        rc.beta = findValue(file, 'Beta  =', [i,length(file)]);
        rc.mach = findValue(file, 'Mach  =', [i,length(file)]);
        rc.pb2v = findValue(file, 'pb/2V =', [i,length(file)]);
        rc.qc2v = findValue(file, 'qc/2V =', [i,length(file)]);
        rc.rb2v = findValue(file, 'rb/2V =', [i,length(file)]);
        rc.ppb2v = findValue(file, 'p''b/2V =', [i,length(file)]);
        rc.rpb2v = findValue(file, 'r''b/2V =', [i,length(file)]);
        
        rc.CXtot = findValue(file, 'CXtot =', [i,length(file)]);
        rc.CYtot = findValue(file, 'CYtot =', [i,length(file)]);
        rc.CZtot = findValue(file, 'CZtot =', [i,length(file)]);
        rc.Cltot = findValue(file, 'Cltot =', [i,length(file)]);
        rc.Cmtot = findValue(file, 'Cmtot =', [i,length(file)]);
        rc.Cntot = findValue(file, 'Cntot =', [i,length(file)]);
        rc.Clptot = findValue(file, 'Cl''tot', [i,length(file)]);
        rc.Cnptot = findValue(file, 'Cn''tot', [i,length(file)]);
        
        rc.CLtot = findValue(file, 'CLtot =', [i,length(file)]);
        rc.CDtot = findValue(file, 'CDtot =', [i,length(file)]);
        rc.CDvis = findValue(file, 'CDvis =', [i,length(file)]);
        rc.CLff = findValue(file, 'CLff  =', [i,length(file)]);
        rc.CYff = findValue(file, 'CYff  =', [i,length(file)]);
        rc.CDind = findValue(file, 'CDind =', [i,length(file)]);
        rc.CDff = findValue(file, 'CDff  =', [i,length(file)]);
        [rc.e, lineNum] = findValue(file, 'e =', [i,length(file)]);
        
        rc.surface = [];
        j=lineNum+2;
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
end

