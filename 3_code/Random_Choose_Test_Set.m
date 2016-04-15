function [ mmu_mgi_mp_test_set ] = Random_Choose_Test_Set( mmu_mgi_mp , test_set_percent )
%RANDOM_CHOOSE_TEST_SET Summary of this function goes here
%   Detailed explanation goes here
    mmu_mgi_mp_test_set = zeros(size(mmu_mgi_mp));
    [total_gene_num,~] = size(mmu_mgi_mp);
    %for each gene, we randomly choose 'test_set_percent' percent
    %phenotypes as test set, if the number of test phenotypes is 0 for a
    %gene, then we random choose a phenotype as test case.
    for i = 1:total_gene_num
        associate_phenotyps_a_gene = sum(mmu_mgi_mp(i,:)>0);
        test_set_size = ceil(associate_phenotyps_a_gene*test_set_percent);        
        R = unidrnd(associate_phenotyps_a_gene,1,test_set_size);
        [~,cols] = find(mmu_mgi_mp(i,:));
        mmu_mgi_mp_test_set(i,cols(R)) = 1;  
        
    end
    
end

