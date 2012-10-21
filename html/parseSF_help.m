%% parseSF
% Parse the data from a file containing the output of AVL's ST command
%
%% Description
% parseST and the other functions detailed here get a filename as an
% argument.  The file should contain the data dumped by AVL using the
% ST menu.
%
%% Definitions
%
%
%% Example

mySurfaces = parseSF('../sampleData/plane9001.sf');

%Easily get the index of a particular surface whose name we know
sIndex = getSurfaceByName(mySurfaces,'Wing-Right');

%Get the strip forces for the surface
myStripForces = mySurfaces(sIndex).strip;

%You can then access a particular strip as shown below
myStripForces{1}

%% See also 
% <parseSB_help.html |parseSB|>,
% <parseST_help.html |parseST|>,
% <parseConfig_help.html |parseConfig|>,
% <parseRunCaseHeader_help.html |parseRunCaseHeader|>, 
% <parseRunCaseFile_help.html |parseRunCaseFile|>. 
%
% _Copyright 2012 Joseph Moster_