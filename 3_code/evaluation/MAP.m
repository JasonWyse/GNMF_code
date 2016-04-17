function [map_value, map] = MAP(result, stand , top_n)
[m, ~] = size(stand);
[~, index0] = sort(result, 2, 'descend');
[~, index] = sort(index0, 2);
rank = index.*stand;
%rank = index(stand>0);
map = zeros(m,1);
for i = 1: m
    tmp = rank(i, :);
    t = sort(tmp(tmp > 0));
    for j = 1:length(t)
        if t(j) <= top_n
            map(i) = map(i) + j/t(j);
        else
            break;
        end
    end
    %map(i) = map(i)/length(t);
    map(i) = map(i)/top_n;
end
map_value = mean(map);  
%MAP Summary of this function goes here
%Detailed explanation goes here


end

