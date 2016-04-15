function[mmu_mgi_mp_weight] = Wiped_Eachline(mmu_mgi_mp,percent)
[row_size,~] = size(mmu_mgi_mp);
mmu_mgi_mp_weight = mmu_mgi_mp;
for i = 1:row_size
    index = find(mmu_mgi_mp(i,:));
    
    num = ceil(length(index)*percent);
    mmu_mgi_mp_weight(i,index(1:num)) = 0;
end
end