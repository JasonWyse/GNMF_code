function[matrix,row_id,col_id]=build_matrix(filename,pathname)
    path(path,pathname)
    temp = importdata(filename);
    row_id = unique(temp(:,1));
    col_id = unique(temp(:,2));
    matrix = zeros(length(row_id),length(col_id));
    for i = 1:length(temp(:,1))
        x = find(row_id == temp(i,1));
        y = find(col_id == temp(i,2));
        matrix(x, y) = 1;
    end
    disp([filename '  finished']);
end