function [matrix] = build_map( filename,pathname)
    path(path,pathname)
    matrix = importdata(filename);
    matrix(isnan(matrix(:,2)),:)=[];
    disp([filename '  finished']);
end

