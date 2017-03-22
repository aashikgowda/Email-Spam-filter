%% *********************** SVM CLASSIFIER *********************************
tic
svm_numdocs_wrong1 = zeros(1,7);
svm_percentage_wrong1 = zeros(1,7);
svm_numdocs_wrong2 = zeros(1,7);
svm_percentage_wrong2 = zeros(1,7);
for i=1:1:7
% Training
[SVMModel1,SVMModel2] = SVMtrain(feature_train_size{i},i);
% Testing
[svm_numdocs_wrong1(i),svm_percentage_wrong1(i), ...
 svm_numdocs_wrong2(i),svm_percentage_wrong2(i)] = SVMtest(SVMModel1,SVMModel2,feature_test);
end
toc
