function Feature11Extraction()
[input1, input2, input3] = textread('Char_Index_kuochong.txt','%d %d %s',2000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature11.txt','w+');%��feature1.txt�����Դ�������1�����ݣ�fid���ڴ洢�ļ����ֵ��������صľ��ֵ����0����˵���ļ��򿪳ɹ�
for k=1001:2000 %��1000��ͼƬ
    A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));%����ͼƬ
    t=graythresh(A); %ȡ��ֵ
    B=im2bw(A,t);%��ֵ����BΪ��ֵ�����ͼ�����ÿ��Ԫ�ص�ֵΪ0��1
    [a,b]=size(B);
    C=zeros(1,a+b);%����������������a+bά

    for i=1:a
        for j=1:b
            if(B(i,j)==0)
                C(1,i)=C(1,i)+1;%������е�Ԫ��Ϊ��ɫ��������1�����ս��Ϊÿһ�еİ׵���
            end
        end
%         C(1,i)=C(1,i)/b;%��һ������Ϊ�и�����������
    end

    for j=1:b
        for i=1:a
            if(B(i,j)==0)
                C(1,a+j)=C(1,a+j)+1;%���ս��Ϊÿһ�еĺڵ���
            end
        end
%         C(1,a+j)=C(1,a+j)/a;%��һ������Ϊ�и�����������
    end


    fprintf(fid,'%d',k);
    fprintf(fid,'%s','       ');
    for i=1:a+b-1
      fprintf(fid,'%d',C(1,i));%����������д���ı�
      fprintf(fid,'%s',',');%�ö��Ÿ���
    end
    if k~=2000
    fprintf(fid,'%d\n',C(1,a+b));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
    else
    fprintf(fid,'%d',C(1,a+b)); %���һ���򲻼�
    end

end
fclose(fid);%�ر��ļ�
