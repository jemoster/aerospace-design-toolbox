function [ surfIndex ] = getSurfaceByName( Surfaces, name )
% Copyright 2012 Joseph Moster

i=1;
while i<=length(Surfaces)
    if(strcmp(Surfaces(i).name,name))
        surfIndex = i;
        return
    end
    i=i+1;
end
surfIndex=-1;
end