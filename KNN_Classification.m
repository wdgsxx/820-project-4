function KNN_Classification(task)
    %get data
    train_data = get_train();
    test_data = get_test();
    %transform training data
    [all_Y,Y,PC, mean_features] = PCA(2, 200, train_data,280);
    %transform test data with the same PCs
    test_data = test_data';
    normaltest = test_data - mean_features; 
    transformed_test_data = PC'*normaltest;
    %task 1: face recognition
    if task ==1
        %apply CV to get the optimal threshold in cvtask1.m
        threshold = 3600;  
        [idx, D] = knnsearch (Y', transformed_test_data');
        %predicted label
        class_label = ones (150,1);
        class_label(D > threshold) = 2; 
        %true label
        test_label = [ones(120,1); ones(30,1)*2];
        acc = sum(class_label == test_label)/length(test_label);
        fprintf('Accuracy of face recognition: %f \n',acc)  
    %task 2: face identification
    else
        %remove non-face data
        transformed_test_data (:,121:150) = [];
        %apply CV to get the optimal threshold incvtask2.m
        threshold =  2500;
        test_label1 = [1:35]';
        test_label1 = repelem(test_label1,2);
        test_label2 = ones(50,1)*36;
        %true label
        test_label = [test_label1; test_label2];
        train_labels = [1:35]';
        train_labels = repelem (train_labels,8);         
        [idx, D] = knnsearch (Y', transformed_test_data');
        class_label = train_labels(idx);
        %predicted label
        class_label(D > threshold) = 36;
        acc = sum(class_label == test_label)/length(test_label);
        fprintf('Accuracy of face identification: %f \n',acc)          
    end
end

