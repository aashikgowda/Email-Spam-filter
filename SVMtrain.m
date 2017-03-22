function [SVMModel1, SVMModel2] = SVMtrain(feature_train,i)
% Size of dictionary
dictLimit = 2500;
% Training samples count
numTrainEmail = 100*i;
% Genearate Training Matrix
spmatrix = sparse(feature_train(:,1), feature_train(:,2), ...
           feature_train(:,3), numTrainEmail, dictLimit);
train_matrix = full(spmatrix);
% Generate training labels
train_labels = [zeros(50*i,1);ones(50*i,1)];
% Create SVM Models
SVMModel1 = fitcsvm(train_matrix,train_labels,'KernelFunction','linear','Standardize',true,...
                   'ClassNames',[1,0]);
SVMModel2 = fitcsvm(train_matrix,train_labels,'KernelFunction','rbf','Standardize',true,...
                  'ClassNames',[1,0]);
end