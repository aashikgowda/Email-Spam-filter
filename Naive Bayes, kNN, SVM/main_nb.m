% Generate different training samples
[feature_train_size] = feature_train_sizes(feature_train);
%% *********************** NAIVE BAYES CLASSIFIER *********************************
tic
nb_numdocs_wrong = zeros(1,7);
nb_percentage_wrong = zeros(1,7);
for i=1:1:7    
% Training
[prob_spam,prob_spamwords, prob_hamwords] = NBtrain(feature_train_size{i},i);
% Testing
[nb_numdocs_wrong(i),nb_percentage_wrong(i)] = NBtest(prob_spam,prob_spamwords, prob_hamwords, feature_test);
end
toc
    