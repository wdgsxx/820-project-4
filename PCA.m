function [all_Y,Y,PC, mean_features] = PCA(type, numofvec, data,n)    
    data = data';
    mean_features = mean(data,2);    
    normaldata = data - mean_features;
    %eigen-decomposition
    if type == 1   
        cov_train = (normaldata*normaldata')./(n-1); 
        [all_PC,D] = eig(cov_train);
        eig_values = diag (D);
        [eig_values, index] = sort (eig_values, 'descend');
        all_PC = all_PC(:,index);        
        PC = all_PC(:,1:numofvec);
        Y = PC'*normaldata;
        all_Y = all_PC'*normaldata;
    % SVD
    else       
        cov_train = normaldata./sqrt(n-1);        
        [all_PC,S,V] = svd(cov_train);
        PC = all_PC(:,1:numofvec);
        Y = PC'*normaldata;
        all_Y = all_PC'*normaldata;
    end 
end
