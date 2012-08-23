function [ prop ] = parseProp( filename )
%Copyright 2011 Joseph Moster

%Reads a file reference by filename and extracts propeller data from it
%   The file should be formatted in the same fasion as the propeller data
%   in the UIUC propeller data base

%Open the file
fid = fopen(filename);
try
    %Discard the column headers
    prop.name = textscan(filename, '%s %s %s %s','delimiter','_');
    
    %Discard the column headers
    textscan(fid, '%s %s %s %s',1);
    
    %Scan the remainder of the file's four data fields
    D = textscan(fid, '%f %f %f %f');
    
    %Split the data into individual matrices
    prop.J = cell2mat(D(1));
    prop.CT = cell2mat(D(2));
    prop.CP = cell2mat(D(3));
    prop.eta = cell2mat(D(4));
    
catch e    
    %If anything fails make sure the file is closed
    fclose(fid);
    throw(e);
end
%Close the file
fclose(fid);

end