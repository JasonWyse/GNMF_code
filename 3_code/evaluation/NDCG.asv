function [ndcg_value, ndcg] = NDCG(result, stand, top_n)
[genes, phens] = size(stand);
[~, rank0] = sort(result, 2, 'descend');
[~, rank] = sort(rank0, 2);
rank = rank .* stand;
%put element with zero to the last
rank(rank == 0) = phens + 1;

rank = sort(rank, 2);
%ground_truth is a binary matrix
ground_truth = sort(stand, 2, 'descend');
ground_truth_top_n = ground_truth(:, 1:top_n);
normalizer = zeros(1, genes);
dcg = zeros(1, genes);
for i = 1:genes
    for j = 1:top_n
        normalizer(i) = normalizer(i) + ground_truth_top_n(i, j)/log2(j+1);
        if rank(i, j) <= top_n
            dcg(i) = dcg(i) + 1/log2(rank(i, j)+1);
        end
    end
end
ndcg = dcg./normalizer;
ndcg_value = mean(ndcg);
%NDCG Summary of this function goes here
%   Detailed explanation goes here
end

