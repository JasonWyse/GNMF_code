function [Mean_AUC_result , AUC_result] = AUC_new(Result , mmu_mgi_mp_wiped , mmu_mgi_mp , top_n)

[m,~] = size(Result);
[~,index]=sort(Result,2,'descend');
AUC_result = zeros(m,1);
mmu_mgi_mp_all = mmu_mgi_mp_wiped + mmu_mgi_mp;
%iterate all genes
for i = 1:m    
    ranked = mmu_mgi_mp_all(i,(index(i,:)));
%     index_2 = find(ranked == 2);
%     ranked(index_2)=[];
    ranked(ranked == 2) = 0;
    AUC_result(i,1) = ROC(ranked,top_n);    
end

Mean_AUC_result = sum(AUC_result)/m;

end