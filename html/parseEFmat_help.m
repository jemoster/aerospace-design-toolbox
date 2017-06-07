%% parseEFmat
% Parse the data from a file containing the output of AVL's FE
% command. 
%
%% Description
% parseEF and the other functions detailed here get a filename as an
% argument.  The file should contain the data dumped by AVL using the
% FE menu (element forces).
%
% The output is a struct with three matrices:
%
% * output.surfaces: [N1 x 13] matrix.
%   Number of elements chordwise
% Number of elements spanwise
% Firt strip
% Surface area
% Average chord
% CL
% CY
% CD
% CDi
% CDv
% Cl
% Cm
% Cn
% * output.strips: [N2 x 19] matrix.
%
%   Number of strip elements chordwise
%   Index of first vortex in surface
%   Xle (Leading edge X coordinate)
%   Yle (Leading edge Y coordinate)
%   Zle (Leading edge Z coordinate)
%   Average chord length
%   Strip width
%   Strip dihedral angle
%   Incidence angle
%   Strip area
%   Cl
%   Cd
%   Cdv
%   Cn
%   Ca
%   Cnc
%   Wake downwash
%   cmLE
%   cm c/4
% * output.elements: [N3 x 6] matrix.
% X
% Y
% Z
% Dx
% Slope
% dCp
%
%% Definitions
%
%
%% Example

myEF = parseEFmat('../sampleData/plane0102.ef');

% Acces matrices with aerodynamic and geometric data like this:
surfacesData = myEF.surfaces;
stripsData = myEF.strips;
verticesData = myEF.vertices;

%% See also
%
% _Copyright 2017 Gypaets_
