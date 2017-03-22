function [numdocs_wrong,fraction_wrong] = NBtest(prob_spam,prob_spamwords, prob_hamwords, feature_test)
% Create testing matrix
sparse_matrix = sparse(feature_test(:,1), feature_test(:,2), feature_test(:,3));
test_matrix = full(sparse_matrix);
% Find size of test emails
numTestEmail = size(test_matrix, 1);
% log p(Class|y is spam email) + log p(spam emails)
spam_predict = test_matrix*(log(prob_spamwords))' + log(prob_spam);
% log p(Class|y is ham email) + log p(ham emails)
ham_predict = test_matrix*(log(prob_hamwords))'+ log(1 - prob_spam);  
% Predict email as spam or ham
nb_output = spam_predict > ham_predict;
% Specify correct test labels
test_labels = [zeros(130,1);ones(130,1)];
numdocs_wrong = sum(xor(nb_output, test_labels));
fraction_wrong = (numdocs_wrong*100)/numTestEmail;
end
