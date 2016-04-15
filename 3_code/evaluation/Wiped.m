function [ mmu_mgi_mp_wiped , gene_begin , gene_end ] = Wiped( mmu_mgi_mp , num , n )

[row_size,~] = size(mmu_mgi_mp);

k = floor(row_size/n);

if num ~= n
    gene_begin = (num-1)*k+1;
    gene_end = num*k;
else
    gene_begin = (num-1)*k+1;
    gene_end = row_size;
end

mmu_mgi_mp_wiped = mmu_mgi_mp;
mmu_mgi_mp_wiped(gene_begin:gene_end,:) = 0;
end

