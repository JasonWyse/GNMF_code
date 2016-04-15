function [ mmu_mgi_mp_train_set ] = Train_set( mmu_mgi_mp, mmu_mgi_mp_test, train_set_percent )
%TRAIN_SET Summary of this function goes here
%   Detailed explanation goes here
    mmu_mgi_mp_train_set = mmu_mgi_mp - mmu_mgi_mp_test;
    [total_gene_num,~] = size(mmu_mgi_mp);
    wipe_train_set_percent = 1 - train_set_percent;
    %for each gene, we randomly choose 'test_set_percent' percent
    %phenotypes as test set, if the number of test phenotypes is 0 for a
    %gene, then we random choose a phenotype as test case.
    for i = 1:total_gene_num
        associate_phenotyps_a_gene = sum(mmu_mgi_mp_train_set(i,:)>0);
        wipe_train_set_size = ceil(associate_phenotyps_a_gene * wipe_train_set_percent); 
        if wipe_train_set_size>0
            R = unidrnd(associate_phenotyps_a_gene,1,wipe_train_set_size);
            [~,cols] = find(mmu_mgi_mp_train_set(i,:));
            mmu_mgi_mp_train_set(i,cols(R)) = 0;  
        end        
    end

end

