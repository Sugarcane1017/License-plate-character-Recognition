function Feature3Extraction()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature3.txt','w+');%��feature3.txt�����Դ�������3������
for k=1:1000
    A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));%����ͼƬ
    t=graythresh(A); 
    B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
    [a,b]=size(B);
    C=zeros(1,a*2+b*2);%������������

    for i=1:a
        for j=1:b
            if(B(i,j)==1)
                C(1,i)=j-1;%������������׵㣬-1�������ַ�����߾���
                break;
            end
            if(j==b && B(i,j)==0)
                C(1,i)=b;%����һ�в������ַ�Ԫ�أ�����Ϊ���ȡb
            end
        end
%         C(1,i) = C(1,i) / b;
    end

    for i=1:a
        for j=b:-1:1 %��������
            if(B(i,j)==1)
                C(1,a+i)=b-j;%���ұ��������׵㣬������ַ����ұ߾���
                break;
            end
            if(j==1 && B(i,j)==0)
                C(1,a+i)=b;%����һ�в������ַ�Ԫ�أ�����Ϊ���ȡb
            end
        end
%         C(1,a+i) = C(1,a+i) / a;
    end

    for j=1:b
        for i=1:a
            if(B(i,j)==1)
                C(1,a*2+j)=i-1;%���ϱ��������׵㣬������ַ����ұ߾���
                break;
            end
            if(i==a && B(i,j)==0)
                C(1,a*2+j)=a;%����һ�в������ַ�Ԫ�أ�����Ϊ���ȡa
            end
        end
%         C(1,a*2+j) = C(1,a*2+j) / a;
    end

    for j=1:b
        for i=a:-1:1
            if(B(i,j)==1)
                C(1,a*2+b+j)=a-i;%���±��������׵㣬������ַ����ұ߾���
                break;
            end
            if(i==1 && B(i,j)==0)
                C(1,a*2+b+j)=a;%����һ�в������ַ�Ԫ�أ�����Ϊ���ȡa
            end
        end
%         C(1,a*2+b+j) = C(1,a*2+b+j) / a;
    end

    fprintf(fid,'%d',k);
    fprintf(fid,'%s','       ');
    for i=1:a*2+b*2-1
      fprintf(fid,'%d',C(1,i));%����������д���ı�
      fprintf(fid,'%s',',');
    end
    if k~=1000
    fprintf(fid,'%d\n',C(1,a*2+b*2));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
    else
    fprintf(fid,'%d',C(1,a*2+b*2)); %���һ���򲻼�
    end

end

fclose(fid);%�ر��ļ�