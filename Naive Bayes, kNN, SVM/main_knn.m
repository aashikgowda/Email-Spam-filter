tic
knn_numdocs_wrong = zeros(1,7);
knn_percentage_wrong = zeros(1,7);
for i=1:1:7    
% Training
[KNNModel] = KNNtrain(feature_train_size{i},i);
% Testing
[knn_numdocs_wrong(i),knn_percentage_wrong(i)] = KNNtest(KNNModel, feature_test);
end
toc
%% Plot
training_size = [100,200,300,400,500,600,700];
plot(training_size,nb_percentage_wrong)
xlabel('Number of Training Samples')
ylabel('Percentage of mails wrongly classified')
hold on
plot(training_size,svm_percentage_wrong1)
hold on
plot(training_size,svm_percentage_wrong2)
hold on
plot(training_size,knn_percentage_wrong)
legend('Naive Bayes','SVM Linear','SVM Non-linear','KNN')
ylim([0 55])