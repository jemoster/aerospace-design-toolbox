clc;

 str = 'Mach =   0.010     Re =     0.120 e 6     Ncrit =   9.000';
 
 p1 = 'Mach =\s+(?<mach>\W+)';
p2 = '';
p3 = '';

expr = [p1  ]; %', ' p2 ', ' p3
 dat = regexp(str,expr,'names')
 
 
 %mine = regexp(str,'(?<=Re =).*(?=Ncrit)', 'match')
 %regexp(char(mine),'[^\S'']','match')
 %val = str2double(regexprep(mine,'[\s]',''))
 
 %(?:.*)\S*(?:.*)
 
 