function PreProcessing()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡ�ļ���ǰ��[A,B,C]���ݱ���Ҫ���ļ������ݸ�ʽ��Ӧ�ϣ�
                                                                                        %��ȡ1000��(��)��headerlines��ͷ��һ�У����Բ���ȡ
indexFileName = input3;%��input��ֵ��indexFileName
for k=1:1000 %forѭ����1~1000������Ҫ��end��β
    A=imread(strcat('Char_Image/',char(indexFileName(k,1))));%char��indexFileName�е�ÿ������ת��Ϊ�ַ�����
                                                             %strcat��·�������������ַ����ϲ���
                                                             %imread��ȡͼ�񣬸�ʽΪ��imread('filename')��ע���������е�����
%     figure(1);
%     imshow(A);
%     A = rgb2gray(A);%ת�Ҷ�ͼ
%     A = medfilt2(A,[5 5])��%��ֵ�˲�
%     A = imfilter(A,h)
    t=graythresh(A); %graythresh��ÿһ��ͼ��������ֵ��ÿ��ͼ��ֵ��ͬ�����Ժ�������ÿ��ͼ�ĻҶ�ֱ��ͼ�Զ�����
    B=im2bw(A,t);%im2bw���Ҷ�ͼת��Ϊ��ֵͼ��ͨ��t��ֵ��ʵ�֣�������ͼ��������ֵ����t�������滻Ϊֵ1 (��ɫ)�������滻Ϊֵ0(��ɫ)��
%     figure(2);
%     imshow(B);
    [a,b]=size(B);
% ����ע�Ϳ�ݼ�cmd+/��ȡ������ע�Ϳ�ݼ�cmd+t
    if(B(1,1)+B(1,b)+B(a,1)+B(a,b)>=2)%��ͼ�����Ͻ�Ϊԭ�㣬����Ϊx�ᣬ����Ϊy�ᣬ�ĸ��ǵ�ֵ���ڵ���2������2������Ϊ�׵�ģ����з�ת
        for i=1:a
            for j=1:b
                B(i,j)=1-B(i,j);
            end
        end
    end
    imwrite(B,strcat('Char_Image_Binary/',char(indexFileName(k,1))));
end