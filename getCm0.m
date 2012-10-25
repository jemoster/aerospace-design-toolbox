function [ Cm0 ] = getCm0( foilArray )
for i=1:length(foilArray.data)
    if(foilArray.data(i).alpha ==0)
        Cm0 = foilArray.data(i).CM;
    end
end
end

