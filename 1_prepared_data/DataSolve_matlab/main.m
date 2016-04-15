dir = '../../2_useful_data/';
pathname = '../prepared_data';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-matrix-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------------mmu-------------------------------------------
%mmu_mp_mgi
%mmu_mp_mgi,row:mp,col:mgi
mmu_mp_mgi_filename = 'Mus_gp_2016_2_21.txt';
[mmu_mp_mgi,mmu_mp_mgi_row,mmu_mp_mgi_col] = build_matrix(mmu_mp_mgi_filename,pathname);
save([dir 'matrix.mat'],'mmu_mp_mgi');
save([dir 'index.mat'],'mmu_mp_mgi_row','mmu_mp_mgi_col');

%mmu_mgi_go
%mmu_mgi_go,row:mgi,col:go
mmu_mgi_go_filename = 'mgi_go_2016_2_18.txt';
[mmu_mgi_go,mmu_mgi_go_row,mmu_mgi_go_col] = build_matrix(mmu_mgi_go_filename,pathname);
mmu_mgi_go = sparse(mmu_mgi_go);
save([dir 'matrix.mat'],'mmu_mgi_go','-append');
save([dir 'index.mat'],'mmu_mgi_go_row','mmu_mgi_go_col','-append');

%mmu_ncbi_ncbi
%mmu_ncbi_ncbi,row:ncbi,col:ncbi
mmu_ncbi_ncbi_filname = 'Mus_ppi_2016_2_21.txt';
[mmu_ncbi_ncbi,mmu_ncbi_ncbi_index] = build_sim(mmu_ncbi_ncbi_filname,pathname);
save([dir 'matrix.mat'],'mmu_ncbi_ncbi','-append');
save([dir 'index.mat'],'mmu_ncbi_ncbi_index','-append');



%----------------------------------------hsa---------------------------------
%hsa_omimg_omimp
%hsa_omimg_omimp,row:omimg,col:omimp
hsa_omimg_omimp_filename = 'human_gp_omim_omim_2016_2_24.txt';
[hsa_omimg_omimp,hsa_omimg_omimp_row,hsa_omimg_omimp_col] = build_matrix(hsa_omimg_omimp_filename,pathname);
save([dir 'matrix.mat'],'hsa_omimg_omimp','-append');
save([dir 'index.mat'],'hsa_omimg_omimp_row','hsa_omimg_omimp_col','-append');

%hsa_ncbi_go
%hsa_ncbi_ncbi,row:ncbi,col:ncbi
hsa_ncbi_go_filename = 'human_ncbi_go_2016_2_22.txt';
[hsa_ncbi_go,hsa_ncbi_go_row,hsa_ncbi_go_col] = build_matrix(hsa_ncbi_go_filename,pathname);
hsa_ncbi_go = sparse(hsa_ncbi_go);
save([dir 'matrix.mat'],'hsa_ncbi_go','-append');
save([dir 'index.mat'],'hsa_ncbi_go_row','hsa_ncbi_go_col','-append');

%hsa_ncbi_ncbi
%hsa_ncbi_ncbi,row:ncbi,col:ncbi
hsa_ncbi_ncbi_filename = 'Human_ppi_2016_2_21.txt';
[hsa_ncbi_ncbi,hsa_ncbi_ncbi_index] = build_sim(hsa_ncbi_ncbi_filename,pathname);
hsa_ncbi_ncbi = sparse(hsa_ncbi_ncbi);
save([dir 'matrix.mat'],'hsa_ncbi_ncbi','-append');
save([dir 'index.mat'],'hsa_ncbi_ncbi_index','-append');

%hsa_hp_ncbi
%hsa_hp_ncbi, rwo:hp, col:ncbi
hsa_hp_ncbi_filename = 'human_hp_ncbi_2016_4_6.txt';
[hsa_hp_ncbi, hsa_hp_ncbi_row, hsa_hp_ncbi_col] = build_matrix(hsa_hp_ncbi_filename, pathname);
save([dir, 'matrix.mat'], 'hsa_hp_ncbi', '-append');
save([dir, 'index.mat'], 'hsa_hp_ncbi_row', 'hsa_hp_ncbi_col', '-append');

%--------------------------------------homo--------------------------------------------
%homo_mmu_hsa
%homo_mmu_hsa,row:ncbi,col:ncbi
homo_mmu_hsa_filename = 'mus_human_ncbi_2016_2_23.txt';
[homo_mmu_hsa,homo_mmu_hsa_row,homo_mmu_hsa_col] = build_matrix(homo_mmu_hsa_filename,pathname);
homo_mmu_hsa = sparse(homo_mmu_hsa);
save([dir 'matrix.mat'],'homo_mmu_hsa','-append');
save([dir 'index.mat'],'homo_mmu_hsa_row','homo_mmu_hsa_col','-append');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-map-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mgi2ncbi_filename = 'mgi_ncbi_2016_2_21.txt';
mgi2ncbi = build_map(mgi2ncbi_filename,pathname);
save([dir 'map.mat'],'mgi2ncbi');

omim2ncbi_filename = 'omim2ncbi_merge_2016_2_24.txt';
omim2ncbi = build_map(omim2ncbi_filename,pathname);
save([dir 'map.mat'],'omim2ncbi','-append');

go_level_filename = 'GO_level_2016_3_28.txt';
go_level = build_map(go_level_filename,pathname);
save([dir 'map.mat'],'go_level','-append');

mp_level_filename = 'MPO_level_2016_4_5.txt';
mp_level = build_map(mp_level_filename,pathname);
save([dir 'map.mat'],'mp_level','-append');

hp_level_filename = 'hpo_level_2016_4_6.txt';
hp_level = build_map(hp_level_filename, pathname);
save([dir 'map.mat'], 'hp_level', '-append');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-pathway-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pathway_mmu_ncbi
pathway_mmu_ncbi_filename = 'pathway_mmu_ncbi_sec_2015_2_24.txt';
pathway_mmu_ncbi = build_pathway(pathway_mmu_ncbi_filename,pathname);
save([dir 'pathway.mat'],'pathway_mmu_ncbi');

%pathway_mmu_mgi
pathway_mmu_mgi_filename = 'pathway_mmu_mgi_sec_2015_2_24.txt';
pathway_mmu_mgi = build_pathway(pathway_mmu_mgi_filename,pathname);
save([dir 'pathway.mat'],'pathway_mmu_mgi','-append');

%pathway_hsa_ncbi
pathway_hsa_ncbi_filename = 'pathway_hsa_ncbi_sec_2015_2_24.txt';
pathway_hsa_ncbi = build_pathway(pathway_hsa_ncbi_filename,pathname);
save([dir 'pathway.mat'],'pathway_hsa_ncbi','-append');

%pathway_hsa_omim
pathway_hsa_omim_filename = 'pathway_hsa_omim_sec_2015_2_24.txt';
pathway_hsa_omim = build_pathway(pathway_hsa_omim_filename,pathname);
save([dir 'pathway.mat'],'pathway_hsa_omim','-append');