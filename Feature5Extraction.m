function Feature5Extraction()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature5.txt','w+');%��feature5.txt�����Դ�������5������
for k=1:1000
    A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));
    t=graythresh(A); 
    B=im2bw(A,t);
    [a,b]=size(B);
    C=zeros(1,12*23);%������������
    l=1;
    for i=1:4:a
        for j=1:4:b %���Ϊ4��˵�����������СΪ4*4
            for m=i:min(i+3,a) %֮����ȡmin�Ƿ�ֹ����ͼ��
                for n=j:min(j+3,b)
                    if(B(m,n)==1)
                        C(1,l)=C(1,l)+1;%���Ϊ�׵㣬�����ܶȼ�1�����ս��Ϊ�����ܶ�
                    end
                end
            end
            l=l+1;%������һ������
        end
    end

    fprintf(fid,'%d',k);
    fprintf(fid,'%s','       ');
    for i=1:12*23-1
      fprintf(fid,'%d',C(1,i));%����������д���ı�
      fprintf(fid,'%s',',');
    end
    if k~=1000
    fprintf(fid,'%d\n',C(1,12*23));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
    else
    fprintf(fid,'%d',C(1,12*23));%���һ���򲻼�
    end

end

fclose(fid);%�ر��ļ�





