%% parseRunCaseFile
% Parse the data from a file containing the output of AVL's SB command
%
%% Syntax
% parseRunCaseFile(filename)
%
%% Description
% desc...

%% Example
runCases = parseRunCaseFile('../sampleData/rc43.run');
fprintf(1,'The first run-case is "%s" \n', runCases(1).name);

%% See also 
% <parseSB_help.html |parseSB|>,
% <parseST_help.html |parseST|>, <parseSF_help.html |parseSF|>,
% <parseConfig_help.html |parseConfig|>,
% <parseRunCaseHeader_help.html |parseRunCaseHeader|>, 
%
% _Copyright 2012 Joseph Moster_