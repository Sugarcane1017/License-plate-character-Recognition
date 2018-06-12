function Feature4Extraction()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature4.txt','w+');%��feature4.txt�����Դ�������4������
for k=1:1000
    A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));%����ͼƬ
    t=graythresh(A); %ȡ��ֵ
    B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
    [a,b]=size(B);
    C=zeros(1,a+b);%������������

    for i=1:a
        for j=1:b-1
            if(B(i,j)~=B(i,j+1) && B(i,j+1)==1)
                C(1,i)=C(1,i)+1;%�������߶Σ�������1�����ս��Ϊÿһ�е��߶���
            end
        end
%         C(1,i) = C(1,i) / 4;����ͼ����߶����ֵΪ4
    end

    for j=1:b
        for i=1:a-1
            if(B(i,j)~=B(i+1,j) && B(i+1,j)==1)
                C(1,a+j)=C(1,a+j)+1;%�������߶Σ�������1�����ս��Ϊÿһ�е��߶���
            end
        end
%         C(1,a+j) = C(1,a+j) / 4;
    end

    fprintf(fid,'%d',k);
    fprintf(fid,'%s','       ');
    for i=1:a+b-1
      fprintf(fid,'%d',C(1,i));%����������д���ı�
      fprintf(fid,'%s',',');%�ö��Ÿ���
    end
    if k~=1000
    fprintf(fid,'%d\n',C(1,a+b));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
    else
    fprintf(fid,'%d',C(1,a+b)); %���һ���򲻼�
    end

end

fclose(fid);%�ر��ļ�