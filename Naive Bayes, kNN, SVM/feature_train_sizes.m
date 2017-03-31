function [feature_train_size] = feature_train_sizes(feature_train)
% ***** 100 training samples *******
index_h50 = find(feature_train(:,1) == 50, 1, 'last' );
index_s_start = find(feature_train(:,1) == 351, 1, 'first' );
index_s50_end = find(feature_train(:,1) == 400, 1, 'last' );
feature_train_100 = [feature_train(1:index_h50,:); ...
                     feature_train(index_s_start:index_s50_end,:)];
for i=351:1:400
    feature_train_100(feature_train_100(:,1)==i) = i - 300;
end
% ***** 200 training samples *******
index_h100 = find(feature_train(:,1) == 100, 1, 'last' );
index_s100_end = find(feature_train(:,1) == 450, 1, 'last' );
feature_train_200 = [feature_train(1:index_h100,:); ...
                     feature_train(index_s_start:index_s100_end,:)];
for i=351:1:450
    feature_train_200(feature_train_200(:,1)==i) = i - 250;
end
% ***** 300 training samples *******
index_h150 = find(feature_train(:,1) == 150, 1, 'last' );
index_s150_end = find(feature_train(:,1) == 500, 1, 'last' );
feature_train_300 = [feature_train(1:index_h150,:); ...
                     feature_train(index_s_start:index_s150_end,:)];
for i=351:1:500
    feature_train_300(feature_train_300(:,1)==i) = i - 200;
end                 
% ***** 400 training samples *******
index_h200 = find(feature_train(:,1) == 200, 1, 'last' );
index_s200_end = find(feature_train(:,1) == 550, 1, 'last' );
feature_train_400 = [feature_train(1:index_h200,:); ...
                     feature_train(index_s_start:index_s200_end,:)];
for i=351:1:550
    feature_train_400(feature_train_400(:,1)==i) = i - 150;
end
% ***** 500 training samples *******
index_h250 = find(feature_train(:,1) == 250, 1, 'last' );
index_s250_end = find(feature_train(:,1) == 600, 1, 'last' );
feature_train_500 = [feature_train(1:index_h250,:); ...
                     feature_train(index_s_start:index_s250_end,:)];
for i=351:1:600
    feature_train_500(feature_train_500(:,1)==i) = i - 100;
end
% ***** 600 training samples *******
index_h300 = find(feature_train(:,1) == 300, 1, 'last' );
index_s300_end = find(feature_train(:,1) == 650, 1, 'last' );
feature_train_600 = [feature_train(1:index_h300,:); ...
                     feature_train(index_s_start:index_s300_end,:)];
for i=351:1:650
    feature_train_600(feature_train_600(:,1)==i) = i - 50;
end                 
% ****** Store training features in cell ******
feature_train_size = {feature_train_100,feature_train_200,...
    feature_train_300,feature_train_400,feature_train_500,...
    feature_train_600,feature_train};
end