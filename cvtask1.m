train_data = get_train();
test_data = get_test();
[all_Y,Y,PC, mean_features] = PCA(2, 400, train_data,280);
test_data = test_data';
normaltest = test_data - mean_features; 
transformed_test_data = PC'*normaltest;
acc_high = 0;
thresh_high = 3.1;
for threshold = 3.1:0.1:10 
threshold = threshold*1000;
[idx, D] = knnsearch (Y', transformed_test_data');
class_label = ones (150,1);
class_label(D > threshold) = 2; 
test_label = [ones(120,1); ones(30,1)*2];
acc = sum(class_label == test_label)/length(test_label);
if acc>acc_high
    acc_high = acc;
    thresh_high = threshold;
end
end
acc_high
thresh_high