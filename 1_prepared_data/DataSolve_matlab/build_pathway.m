function [matrix] = build_pathway(filename,pathname)
    path(path,pathname)
    matrix = importdata(filename);
    disp([filename '  finished']);
end

