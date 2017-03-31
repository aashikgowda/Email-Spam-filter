function [knn_numdocs_wrong,knn_fraction_wrong] = KNNtest(KNNModel, feature_test)
% Create testing matrix
sparse_matrix = sparse(feature_test(:,1), feature_test(:,2), feature_test(:,3));
test_matrix = full(sparse_matrix);
% Find size of test emails
numTestEmail = size(test_matrix, 1);
% Predict email
knn_output = predict(KNNModel,test_matrix);
% Specify correct test labels
test_labels = [zeros(130,1);ones(130,1)];
% Use XOR operation to find missclassified emails
knn_numdocs_wrong = sum(xor(knn_output, test_labels));
% Percentage of wrongly classified emails
knn_fraction_wrong = (knn_numdocs_wrong*100)/numTestEmail;
end

