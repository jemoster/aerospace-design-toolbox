%% parseConfig
% Parse the data from a file containing the output of AVL's SB command
%
%% Syntax
% parseConfig(filename)
%
%% Description
% desc...

%% Example

myConfigSB = parseConfig('../sampleData/plane2243.sb');

fprintf(1,'The aircraft has a S reference area of %f \n', myConfigSB.Sref);

%% See also 
% <parseSB_help.html |parseSB|>,
% <parseST_help.html |parseST|>, <parseSF_help.html |parseSF|>,
% <parseRunCaseHeader_help.html |parseRunCaseHeader|>, 
% <parseRunCaseFile_help.html |parseRunCaseFile|>. 
%
% _Copyright 2012 Joseph Moster_