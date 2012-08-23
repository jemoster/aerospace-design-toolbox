%Copyright 2011 Joseph Moster

%% parseProp basic function
%The parseProp function takes a string as its only argument.  This
%references the file to be parsed.  The file should be formated in the same
%fasion as the propeller data in the UIUC propeller database as shown
%below:
%{
J       CT       CP       eta
0.162   0.0936   0.0465   0.327
0.200   0.0875   0.0455   0.385
0.243   0.0809   0.0447   0.440
%}
%Additionally if the name is in the same format as below, the program will
%split the name up into its components as delimited by the underscores

myProp=parseProp('./sampleData/apcsf_9x4.7_kt1033_4008.txt');

%% Accessing the data
%Name:
fprintf(1,'I am a %s, %s.  My run case is %s, %s\n',char(myProp.name{1})...
    ,char(myProp.name{2}),char(myProp.name{3}),char(myProp.name{4}));

%J
%Accessing the first element
fprintf(1,'First J=%f\n',myProp.J(1));
%Accessing the last element
fprintf(1,'Last J=%f\n',myProp.J(length(myProp.J)));

%CT Similar to J
myCT = myProp.CT(1)

%CP Similar to J
myCP = myProp.CP(1)

%eta Similar to J
myEta = myProp.eta(1)
