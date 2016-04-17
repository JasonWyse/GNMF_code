% directory='../4_result/GNMF/';
% path(path,directory);
% allfiles = dir(directory);
% mat_name = allfiles(length(allfiles)).name;

% result = [directory 'result_' t '.mat'];
% save(result,'lambda0','lambda1','lambda2','experiment_times');
% save(result,'batch_folds','max_ites','epsilon','-append');
% save(result,'K','top_n_set','-append');
% save(result,'evaluate_result','obj_val_result','mean_evaluate_result','-append');
% save(result,'test_set_percent','train_set_percent','-append');
% save(result,'U_result','V_result','-append');
lambda0 = [0,0.001];%[0,0.001,0.01,0.1,1,10,100]
lambda1 = [0,0.001,0.01];% [0,0.001,0.01,0.1,1,10,100]
lambda2 = [1,10];
top_n_set = [200,400,600,800,1000];
evaluate_result = cell(experiment_times, length(lambda0), length(lambda1), length(lambda2));
obj_val_result = cell(experiment_times, length(lambda0), length(lambda1), length(lambda2));
U_result =  cell(experiment_times, length(lambda0), length(lambda1), length(lambda2));
V_result =  cell(experiment_times, length(lambda0), length(lambda1), length(lambda2));
for i = 1:length(lambda0)
    for j = 1:length(lambda1)
        for k = 1:length(lambda2)
        %for a set of parameter combination, we repeat the exp
                       
            for ite = 1:experiment_times
                %we use variable 'test_set_percent' to set the test set
                %percentage
                evaluate_result{}
            end 
          
            
        end
    end
end