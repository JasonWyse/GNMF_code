function [Mean_AUC_result , AUC_result] = AUC(Result , mmu_mgi_mp , top_n)

[m,~] = size(Result);

[~,index]=sort(Result,2,'descend');

AUC_result = zeros(m,1);

for i = 1:m
    
    ranked = mmu_mgi_mp(i,(index(i,:)));
    AUC_result(i,1) = ROC(ranked,top_n);
    
end

Mean_AUC_result = sum(AUC_result)/m;

end