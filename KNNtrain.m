function [KNNModel] = KNNtrain(feature_train,i)
% Size of dictionary
dictLimit = 2500;
% Training samples count
numTrainEmail = 100*i;
% Genearate Training Matrix
sparse_matrix = sparse(feature_train(:,1), feature_train(:,2), ...
           feature_train(:,3), numTrainEmail, dictLimit);
train_matrix = full(sparse_matrix);
% Generate training labels
train_labels = [zeros(50*i,1);ones(50*i,1)];
% Create KNN Model
mdl.NumNeighbors = 1;
KNNModel = fitcknn(train_matrix,train_labels);

end

