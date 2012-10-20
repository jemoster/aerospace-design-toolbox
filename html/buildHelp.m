
dir = ls;
for i=1:size(dir)
   tmpName = dir(i,:);
   name = char(regexp(tmpName,'\w*(?=_help.m)\w*','match'));
   if(~isempty(name))
       name
       publish(strcat(name,'.m'),'outputDir','./');
   end
end
