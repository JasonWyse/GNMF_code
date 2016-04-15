function[matrix, index_id] = build_sim(filename, pathname)
path(path,pathname)
temp = importdata(filename);
index_id = unique([temp(:, 1); temp(:, 2)]);
matrix = zeros(length(index_id), length(index_id));
for i = 1:length(temp(:,1))
        x = find(index_id == temp(i,1));
        y = find(index_id == temp(i,2));
        matrix(x, y) = 1;
        matrix(y, x) = 1;
end
disp([filename '  finished']);
end