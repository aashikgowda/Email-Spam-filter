% Naive Bayes train.m
function [spam_prob,prob_spamwords, prob_hamwords] = NBtrain(feature_train,i)
% Size of dictionary
dictLimit = 2500;
% Training samples count
numTrainEmail = i*100;
% Genearate Training Matrix
sparse_matrix = sparse(feature_train(:,1), feature_train(:,2), feature_train(:,3), numTrainEmail, dictLimit);
train_matrix = full(sparse_matrix);
% Generate training labels
train_labels = [zeros(50*i,1);ones(50*i,1)];
% Store indices of spam and ham emails
ham_index = find(train_labels == 0);
spam_index = find(train_labels);
% Find probability of spam emails
spam_prob = length(spam_index) / numTrainEmail;
% Number of words in each email
email_words = sum(train_matrix, 2);
% Spam and Ham word count
spam_count = sum(email_words(spam_index));
ham_count = sum(email_words(ham_index));
% Spam and Ham word probability
prob_spamwords = (sum(train_matrix(spam_index, :)) + 1) ./(spam_count + dictLimit);
prob_hamwords = (sum(train_matrix(ham_index, :)) + 1)./(ham_count + dictLimit);
end