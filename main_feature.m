%% ****** DATA PROCESSING AND FEATURE EXTRACTION ******
% Dictionary Creation
files = dir('M:\Desktop\Pattern Project\dictionary_processing\*.txt');
len = length(files);
data{len} = [];
for k = 1:len
data{k} =  textread(fullfile('M:\Desktop\Pattern Project\dictionary_processing\',files(k).name), '%s', 'delimiter', ' ');
if (k == 1)
    temp = data{k};
else
    temp = vertcat(temp,data{k});
end
end
[uv,~,idx] = unique(temp);
n = accumarray(idx(:),1);
[value,index]=sort(n(:),'descend');
words = uv(index);
count = num2cell(value);
dict = [words,count];
% Training Set Feature creation
[feature_train] = train_process(dict);
% Testing Set Feature creation
[feature_test] = test_process(dict);