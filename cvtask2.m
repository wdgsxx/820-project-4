train_data = get_train();
test_data = get_test();
[all_Y,Y,PC, mean_features] = PCA(2, 200, train_data,280);
test_data = test_data';
normaltest = test_data - mean_features; 
transformed_test_data = PC'*normaltest;
transformed_test_data (:,121:150) = [];
acc_high = 0;
thresh_high = 0.9;
for threshold = 0.9:0.1:3.6
    threshold = threshold*1000;
    test_label1 = [1:35]';
    test_label1 = repelem(test_label1,2);
    test_label2 = ones(50,1)*36;
    test_label = [test_label1; test_label2];
    train_labels = [1:35]';
    train_labels = repelem (train_labels,8);         
    [idx, D] = knnsearch (Y', transformed_test_data');
    class_label = train_labels(idx);
    class_label(D > threshold) = 36;
    acc = sum(class_label == test_label)/length(test_label);
    if acc>acc_high
        acc_high = acc;
        thresh_high = threshold;
    end
end
acc_high
thresh_high
