function [ index ] = getLDmax( foilArray )

index = 1;
maxLD = getLD(foilArray.data(1));

for i=2:length(foilArray.data)    
    if(getLD(foilArray.data(i))>maxLD)
        maxLD = getLD(foilArray.data(i));
        index=i;
    end
end

    function [LD] = getLD(entry)
        LD = entry.CL/entry.CD;
    end
end

