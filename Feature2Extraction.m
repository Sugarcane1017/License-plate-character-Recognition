function Feature2Extraction()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature2.txt','w+');%��feature2.txt�����Դ�������2������
for k=1:1000
    A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));
    t=graythresh(A); 
    B=im2bw(A,t);
    [a,b]=size(B);
    C=zeros(1,6*12);%����������������72������
    l=1;
    for i=1:8:a  %���Ϊ8��˵�����������СΪ8*8
        for j=1:8:b  %���Ϊ8��˵�����������СΪ8*8
%             flag = 0;
            for m=i:min(i+7,a)  %֮����ȡmin�Ƿ�ֹ����ͼ��
                for n=j:min(j+7,b)
%                     flag = flag + 1;
                    if(B(m,n)==1)
                        C(1,l)=C(1,l)+1;%���Ϊ�׵㣬�����ܶȼ�1�����ս��Ϊ�����ܶ�
                    end
                end
            end
%             C(1,l) = C(1,l) / flag + 0.01;��һ��������ÿ���������
            l=l+1;%������һ������
        end
    end

    fprintf(fid,'%d',k); %д���к�
    fprintf(fid,'%s','       ');%�ո�
    for i=1:6*12-1
      fprintf(fid,'%d',C(1,i));%����������д���ı�
      fprintf(fid,'%s',',');
    end
    if k~=1000
    fprintf(fid,'%d\n',C(1,6*12));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
    else
    fprintf(fid,'%d',C(1,6*12));%���һ���򲻼�
    end

end

fclose(fid);%�ر��ļ�