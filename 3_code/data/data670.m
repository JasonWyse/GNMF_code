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
%filter out genes, which both occur in gene-phenotype matrix and PPI
[C,ia,ib] = intersect(mmu_ppi_mgi_id, mmu_mp_mgi_col);
mmu_mgi_ids = C;
mmu_ppi = ppi(ia,ia);
mmu_mp_mgi_origin = mmu_mp_mgi;
mmu_mp_mgi = mmu_mp_mgi(:,ib);

%filter out phenotypes, which both occur in gene-phenotype matrix and
%phenotype-phenotype matrix
[mmu_mp_ids,ia,ib] = intersect(mmu_mp_mgi_row,mp_id);
mmu_mp_mgi = mmu_mp_mgi(ia,:);
mmu_mp_mp_origin = mmu_mp_mp;
mmu_mp_mp = mmu_mp_mp(ib,ib);
%filter the empty genes and phenotypes
mmu_mp_mgi = mmu_mp_mgi(sum(mmu_mp_mgi,2)>0,sum(mmu_mp_mgi,1)>0);
mmu_mgi_ids = mmu_mgi_ids(sum(mmu_mp_mgi,1)>0);
mmu_mp_ids = mmu_mp_ids(sum(mmu_mp_mgi,2)>0);
mmu_ppi = mmu_ppi(sum(mmu_mp_mgi,1)>0,sum(mmu_mp_mgi,1)>0);
mmu_mp_mp = mmu_mp_mp(sum(mmu_mp_mgi,2)>0,sum(mmu_mp_mgi,2)>0);
%using the new selected genes for each pathway
[rows,~] = size(mmu_pathway_mgi_origin);
mmu_pathway_mgi = zeros(rows,length(mmu_mgi_ids));
for i = 1:rows
    [C2,ia2,~] = intersect(mmu_mgi_ids, mmu_pathway_mgi_origin(i,:));
    mmu_pathway_mgi(i,ia2) = 1;
end
save('data670.mat','mmu_mp_mgi');
save('data670.mat','mmu_mgi_ids','mmu_mp_ids','-append');
save('data670.mat','mmu_pathway_mgi','mmu_ppi','-append');
save('data670.mat','mmu_mp_mp','-append');



