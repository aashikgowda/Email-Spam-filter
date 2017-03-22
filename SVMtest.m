function [svm_numdocs_wrong1,svm_fraction_wrong1, ...
  svm_numdocs_wrong2,svm_fraction_wrong2] = SVMtest(SVMModel1,SVMModel2, feature_test)
% Create testing matrix
sparse_matrix = sparse(feature_test(:,1), feature_test(:,2), feature_test(:,3));
test_matrix = full(sparse_matrix);
% Find size of test emails
numTestEmail = size(test_matrix, 1);
% Predict email
svm_output1 = predict(SVMModel1,test_matrix);
svm_output2 = predict(SVMModel2,test_matrix);
% Specify correct test labels
test_labels = [zeros(130,1);ones(130,1)];
% Use XOR operation to find missclassified emails
svm_numdocs_wrong1 = sum(xor(svm_output1, test_labels));
svm_numdocs_wrong2 = sum(xor(svm_output2, test_labels));
% Percentage of wrongly classified emails
svm_fraction_wrong1 = (svm_numdocs_wrong1*100)/numTestEmail;
svm_fraction_wrong2 = (svm_numdocs_wrong2*100)/numTestEmail;
end