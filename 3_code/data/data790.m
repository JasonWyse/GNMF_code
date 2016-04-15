path(path,'../../2_useful_data')
clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-load-%%%%%%%%%%%%%%%%%%%%%%%%%%
%phenotype-gene association matrix
load('matrix.mat','mmu_mp_mgi');
load('index.mat','mmu_mp_mgi_row','mmu_mp_mgi_col');
%PPI gene-gene relation matrix
load('ppi.mat','ppi','mgi_id');
mmu_ppi_mgi_id = mgi_id;

%Kegg gene pathways
load('pathway.mat','pathway_mmu_mgi');
mmu_genes_pathways_origin = unique(pathway_mmu_mgi);
mmu_pathway_mgi_origin = pathway_mmu_mgi;
%the relation between phenotype and phenotype
load('relation.mat','mmu_mp_mp','mp_id');

[C,~,ib] = intersect(mmu_genes_pathways_origin, mmu_mp_mgi_col);
mmu_mgi_ids = C;
mmu_mp_mgi_origin = mmu_mp_mgi;
mmu_mp_mgi = mmu_mp_mgi(:,ib);
%filter phenotype
[mmu_mp_ids,ia,ib] = intersect(mmu_mp_mgi_row,mp_id);
mmu_mp_mgi = mmu_mp_mgi(ia,:);
mmu_mp_mp_origin = mmu_mp_mp;
mmu_mp_mp = mmu_mp_mp_origin(ib,ib);
%using the new selected genes for each pathway
[rows,~] = size(mmu_pathway_mgi_origin);
mmu_pathway_mgi = zeros(rows,length(mmu_mgi_ids));
for i = 1:rows
    [~,ia,~] = intersect(mmu_mgi_ids, mmu_pathway_mgi_origin(i,:));
    mmu_pathway_mgi(i,ia) = 1;
end
%using the new selected genes for gene PPI
mmu_ppi = zeros(length(mmu_mgi_ids));
[~,ia,ib] = intersect(mmu_mgi_ids, mmu_ppi_mgi_id);
mmu_ppi(ia,ia) = ppi(ib,ib);


save('data790.mat','mmu_mp_mgi');
save('data790.mat','mmu_mgi_ids','mmu_mp_ids','-append');
save('data790.mat','mmu_pathway_mgi','mmu_ppi','-append');
save('data790.mat','mmu_mp_mp','-append');