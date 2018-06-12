clc
clear all
close all

feature1 = textread('feature1.txt','%d','delimiter', ',');
feature1 = reshape(feature1,[140 1000]);
feature1 = feature1';%ת��
feature1 = feature1(:,2:end);%ѡȡ��������ȥ��һ��Ϊ���
%98

feature2 = textread('feature2.txt','%d','delimiter', ',');
feature2 = reshape(feature2,[73 1000]);
feature2 = feature2';%ת��
feature2 = feature2(:,2:end);%ѡȡ��������ȥ��һ��Ϊ���
%99.5

feature3 = textread('feature3.txt','%d','delimiter', ',');
feature3 = reshape(feature3,[279 1000]);
feature3 = feature3';%ת��
feature3 = feature3(:,2:end);%ѡȡ��������ȥ��һ��Ϊ���
%97

feature4 = textread('feature4.txt','%d','delimiter', ',');
feature4 = reshape(feature4,[140 1000]);
feature4 = feature4';%ת��
feature4 = feature4(:,2:end);%ѡȡ��������ȥ��һ��Ϊ���
%87

feature5 = textread('feature5.txt','%d','delimiter', ',');
feature5 = reshape(feature5,[277 1000]);
feature5 = feature5';%ת��
feature5 = feature5(:,2:end);%ѡȡ��������ȥ��һ��Ϊ���
%100

feature6 = textread('feature6.txt','%d','delimiter', ',');
feature6 = reshape(feature6,[129 1000]);
feature6 = feature6';%ת��
feature6 = feature6(:,2:end);%ѡȡ��������ȥ��һ��Ϊ���
%100


% feature = [feature1 feature2 feature3 feature4 feature5 10*feature6]


feature = feature3
classification_num = 13;
allclass = [10 11 12 20 22 25 26 28 30 31 32 33 34];
indexInfo = ['��' '��' '��' '0'  '2' '5' '6' '8' 'A' 'B' 'C' 'D' 'Q'];
[~, class, name] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);
% transform_index = zeros(1000, 1);%�洢1-13�����
% for i = 1 : classification_num
%     transform_index( :, 1) = transform_index(:, 1) + (index == class(i)) * i; %��ԭ���Ĵ洢���ӳ�䵽1-13��
% end
train_num = 800;
% selection_index = (randperm (1000) <= train_num);%randperm����1-1000��������ظ����֣�С�ڵ���800��Ϊ1�����ڵ�Ϊ0
% save selection_index.mat selection_index;
load selection_index.mat;
model = svmtrain( class(selection_index,:),feature(selection_index,:),'-t 1 -d 1 -g 0.01 -r 0');
[predict_label, accuracy, dec_values] = svmpredict(class(~selection_index,:),feature(~selection_index,:), model);
% X = class(selection_index,:)
% Y = feature(selection_index,:)
A = class(~selection_index,:);%���Լ�����ʵ�����
B = predict_label;%Ԥ��������
err_index = A~=B;%A����B�����ִ��Ϊ1���ֶԼ�Ϊ0
C = A(err_index);%A�зִ�����
D = B(err_index);%B�зִ�����
err_name = name(~selection_index,:);%������������
N = err_name(err_index);%�ִ�ͼƬ������
for i = 1:length(C)%length����ĳһ��������ά����󳤶ȣ������൱��Python�е�len(C),�ִ����Ŀ
    E = find(allclass == C(i));
    F = find(allclass == D(i));
    [indexInfo(E) ' ����ʶ��� ' indexInfo(F)]
    figure(i);
    imshow(['/Users/mac/Deaplearning/SVM����ʶ��/Feature Extraction/Char_Image/' N{i}]);
    N{i}
end




