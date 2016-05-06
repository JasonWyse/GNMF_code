function [U, V , objective_value_set] = Group_NMF_Train(mgi_mp_train_set, pathway_mgi, ...,
    ppi, mp_mp, lambda0, lambda1, lambda2, K, max_ites, epsilon, batch_folds)
%GROUP_NMF_TRAIN Summary of this function goes here
%   Detailed explanation goes here
    [total_gene_num,total_phenotype_num] = size(mgi_mp_train_set);
    %we take batch strategy to update elements, at least we need every
    %genes being updated once, so we use the max() function to set the
    %iteration
    %max_ites = max([max_ites, ceil(total_gene_num/batch_size)]);
    max_ites = max([max_ites, batch_folds]);    
    R = mgi_mp_train_set;
    U = rand(total_gene_num,K);
    V = rand(K,total_phenotype_num);
    ppi = ppi - diag(diag(ppi));
    L1 = diag(sum(ppi))-ppi;
    mp_mp = mp_mp - diag(diag(mp_mp));
    L2 = diag(sum(mp_mp)) - mp_mp;
    batch_size_gene = floor(total_gene_num/batch_folds);
    batch_size_phenotype = floor(total_phenotype_num/batch_folds);
%     total_gene_folds = ceil(total_gene_num/batch_size);
%     total_phenotype_folds = ceil(toal_phenotype_num/batch_size);
    [pathway_num,~ ] = size(pathway_mgi);
    group_center_matrix = zeros(pathway_num,K);
    objective_value_set = zeros(max_ites,1);
    for ite = 1:max_ites
        [objective_value_set(ite,1)] = Objective_Fun(R, pathway_mgi, U, V, ...,
            L1, L2, lambda0, lambda1, lambda2);
        if ite>1 && objective_value_set(ite,1)>objective_value_set(ite-1,1)
            break;
        end
        %\begin{calculate the group centers in each iteration}
        for i = 1:pathway_num
            if sum(pathway_mgi(i,:)>0)
                group_center_matrix(i,:) = mean(U(pathway_mgi(i,:)>0,:));
            end
        end
        %\end
        fold_i = rem(ite, batch_folds);
        %         choose update rows set for U
        if fold_i ==0 
            U_rows_set = batch_size_gene*(batch_folds-1)+1 : total_gene_num;            
        else
            U_rows_set = batch_size_gene*(fold_i-1)+1 : batch_size_gene*fold_i;
        end
%         choose update columns set for V
        if fold_i ==0 
            V_cols_set = batch_size_phenotype*(batch_folds-1)+1 : total_phenotype_num;            
        else
            V_cols_set = batch_size_phenotype*(fold_i-1)+1 : batch_size_phenotype*fold_i;
        end
        [U] = Gradient_Update_U(U_rows_set, group_center_matrix, ...,
            R, pathway_mgi, U, V, ppi, lambda0, lambda1, lambda2, K);
        [V] = Gradient_Update_V(V_cols_set, R, U, V, mp_mp, lambda1, lambda2); 
    end    
end
function [objective_value] = Objective_Fun(R, pathway_mgi, U, V, ...,
    L1, L2, lambda0, lambda1, lambda2)    
    group_loss = 0;
    %filter out the pathways that contain more than one genes, in order
    %to calculate the center of genes
    pathway_mgi_filtered = pathway_mgi(sum(pathway_mgi,2)>1,:);
    [rows,~] = size(pathway_mgi_filtered);    
    for i = 1:rows        
        %tmp = U(pathway_mgi_filtered(i,:)>0,:);        
        genes_in_this_pathway = sum(pathway_mgi_filtered(i,:));
        group_center = mean(U(pathway_mgi_filtered(i,:)>0,:));        
        
%       tmp = repmat(group_center,genes_in_this_pathway,1); 
%       tmp2 = U(pathway_mgi_filtered(i,:)>0,:); 
%       tmp3 = tmp2 - tmp; group_loss = group_loss+ sum(sum(tmp3.^2));
%       the above four code lines can be simplified into one line:
        group_loss = group_loss +sum(sum((U(pathway_mgi_filtered(i,:)>0,:) ...,
            - repmat(group_center,genes_in_this_pathway,1)).^2));          
    end
    objective_value = 0.5*sum(sum((R.*(R-U*V)).^2)) + 0.5*lambda0*group_loss + ..., 
           + 0.5*lambda1* (sum(diag(U'*L1*U)) + sum(diag(V*L2*V'))) ...,
           + 0.5*lambda2* (sum(sum(U.^2)) + sum(sum(V.^2)));   
    
end
function [U] = Gradient_Update_U(U_rows_set, group_center_matrix, ...,
            R, pathway_mgi, U, V, S1, lambda0, lambda1, lambda2, K)
    %parameter 'U_rows_set': it indicates which rows are gonna take gradient
    U_old = U;    
    D1 = diag(sum(S1));
    for i = U_rows_set       
        group_center_sum_contain_gene_i = zeros(1,K);
        c_i = sum(pathway_mgi(:,i));
        %if c_i > 1
            tmp = group_center_matrix(pathway_mgi(:,i)>0,:);
            group_center_sum_contain_gene_i = group_center_sum_contain_gene_i + sum(tmp);        
        %end        
        numerator_vec = R(i,:)*V' + lambda0*group_center_sum_contain_gene_i ...,
            + lambda1*S1(i,:)*U;        
        denominator_vec = (R(i,:).*(U_old(i,:)*V))*V' + lambda0*c_i*U_old(i,:) + ...,
            lambda1*(D1(i,:)*U_old) + lambda2*U_old(i,:);
        if sum(numerator_vec)>0
            U(i,:) = U_old(i,:).*sqrt((numerator_vec./denominator_vec));     
        end
    end
    
end
function [V_new] = Gradient_Update_V(V_cols_set, R, U, V, S2, ...,
    lambda1, lambda2)
    V_new = V;    
    D2 = diag(sum(S2));
    for j = V_cols_set
        numerator_vec = U'*R(:,j)+lambda1*(V*S2(:,j));
        denominator_vec = U'*( R(:,j).*(U*V(:,j)) ) + lambda1*V*D2(:,j) + ...,
            lambda2*V(:,j);
        tmp = V(:,j).*(numerator_vec./denominator_vec);        
        if sum(tmp)>0
            V_new(:,j) = V(:,j).*sqrt((numerator_vec./denominator_vec));
        end
    end
end
