function y = parseEFmat( filename )
% Copyright 2017 by Gypaets

file = textread(filename, '%s', 'delimiter', '\n','whitespace', '');

linesNumber = length(file);

% Preallocate matrices of unknown size
surfaces(floor(linesNumber/25),13) = 0;
strips(linesNumber,19) = 0;
vertices(linesNumber,7) = 0;

% Loop over file lines
for i = 1:linesNumber
    % 
    str = file{i};
    
    % Surface data
    if regexp(str, '^  Surface #.*')
        lSurf = sscanf(str, '  Surface # %i');
    elseif regexp (str, '^     # C')
        surfaces(lSurf,1:3) = sscanf(str, ' # Chordwise = %i # Spanwise = %i First strip = %i');
    elseif regexp(str, '^     Sur')
        surfaces(lSurf,4:5) = sscanf(str, ' Surface area = %f Ave. chord = %f');
    elseif regexp(str, '^     CLsurf')
        surfaces(lSurf,6:7) = sscanf(str, ' CLsurf = %f Clsurf = %f');
    elseif regexp(str, '^     CYsurf')
        surfaces(lSurf,8:9) = sscanf(str, ' CYsurf = %f Cmsurf = %f');
    elseif regexp(str, '^     CDsurf')
        surfaces(lSurf, 10:11) = sscanf(str, ' CDsurf  = %f Cnsurf  = %f');
    elseif regexp(str, '^     CDisurf')
        surfaces(lSurf, 12:13) = sscanf(str, ' CDisurf = %f CDvsurf = %f');
    end
    
    % Strip data
    if regexp(str, '^ Strip #')
       lStrip = sscanf(str, ' Strip # %i');
       ld = sscanf(str, ' Strip #  %i     # Chordwise =  %i   First Vortex =   %i');
       strips(lStrip,1:2) = ld(2:3);
    elseif regexp(str, '^    Xle')
        strips(lStrip,[3,6,9]) = sscanf(str, ' Xle = %f Ave. Chord = %f Incidence = %f');
    elseif regexp(str, '^    Yle')
        strips(lStrip, [4,7,10]) = sscanf(str, ' Yle = %f Strip Width = %f Strip Area = %f');
    elseif regexp(str, '^    Zle')
        strips(lStrip, [5,8]) = sscanf(str, ' Zle = %f Strip Dihed. = %f');        
    elseif regexp(str, '^    cl')
        strips(lStrip, [11,12,13]) = sscanf(str, ' cl = %f cd = %f cdv = %f');
    elseif regexp(str, '^    cn')
        strips(lStrip, [14,15,16,17]) = sscanf(str, ' cn  = %f ca = %f cnc = %f wake dnwsh = %f');
    elseif regexp(str, '^    cmLE')
        strips(lStrip, [18,19]) = sscanf(str, ' cmLE= %f cm c/4 = %f');
    end
    
    % Vortex data
    if regexp(str, '^s* \d*')
        lVortex = sscanf(str, ' %i .*');
        vertices(lVortex,:) = sscanf(str, ' %i %f %f %f %f %f %f');
    end
end

% Resize matrices to right size
surfaces(all(surfaces==0,2),:) = [];
strips(all(strips==0,2),:) = [];
vertices(all(vertices==0,2),:) = [];

% Assign matrices to output-struct
y.surfaces = surfaces;
y.strips = strips;
y.vertices = vertices(:,2:7);
        
end
