%% parseRunCaseHeader
% Parse the data from a file containing the output of AVL's SB command
%
%% Syntax
% parseRunCaseHeader(filename)
%
%% Description
% desc...

%% Example

runCaseSB = parseRunCaseHeader('../sampleData/plane2243.sb');
fprintf(1,'This next aircraft was analyzed at an alpha of %f \n', runCaseSB.alpha);

%% See also 
% <parseSB_help.html |parseSB|>, <parseST_help.html |parseST|>,
% <parseSF_help.html |parseSF|>,
% <parseConfig_help.html |parseConfig|>,
% <parseRunCaseFile_help.html |parseRunCaseFile|>. 
%
% _Copyright 2012 Joseph Moster_