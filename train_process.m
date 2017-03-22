function [feature_train] = train_process(dict)
files_train = dir('M:\Desktop\Pattern Project\train_folder\*.txt');
% files_2 = dir('M:\Desktop\Pattern Project\nonspam-train\*.txt');
len = length(files_train);
data{len} = [];
for k = 1:len
data{k} =  textread(fullfile('M:\Desktop\Pattern Project\train_folder\',files_train(k).name), '%s', 'delimiter', ' ');
if (k == 1)
    temp = data{k};
    [uv,~,idx] = unique(temp);
    n = accumarray(idx(:),1);
    count = num2cell(n);
    txt_id{size(count,1),1} = [];
    [txt_id{:}] = deal(k);
    feat_t = [txt_id, uv, count];
else
    temp = data{k};
    [uv,~,idx] = unique(temp);
    n = accumarray(idx(:),1);
    count = num2cell(n);
    txt_id{size(count,1),1} = [];
    [txt_id{:}] = deal(k);
    feat_t = vertcat(feat_t,[txt_id, uv, count]);
end
clear txt_id; 
end
%% Convert string words into word ID
feature_train = zeros(size(feat_t));
for i=1:1:size(feat_t,1)
    for j=1:1:2500
        tf = strcmp(feat_t(i,2),dict(j,1));
        if tf
           feature_train(i,1) = feat_t{i,1};
           feature_train(i,2) = j;
           feature_train(i,3) = feat_t{i,3};
           break 
        end
    end
end
feature_train( ~any(feature_train,2), : ) = [];
toc
end