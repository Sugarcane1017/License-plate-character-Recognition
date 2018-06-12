function Feature66Extraction()
[input1, input2, input3] = textread('Char_Index_kuochong.txt','%d %d %s',2000, 'headerlines',1);%��ȡͼƬ�ı�ţ������Ϣ���ļ���
indexFileName = input3;%����ļ���
fid=fopen('feature66.txt','w+');%��feature6.txt�����Դ�������6������
for k=1001:2000
    A=imread(strcat('Char_Image_Binary/',char(indexFileName(k,1))));
    t=graythresh(A); 
    B=im2bw(A,t);
    [a,b]=size(B);
    C=zeros(1,8*16);%������������
    l=1;
    for i=1:6:a
        for j=1:6:b %���Ϊ6��˵�����������СΪ6*6
            for m=i:min(i+5,a) %֮����ȡmin�Ƿ�ֹ����ͼ��
                for n=j:min(j+5,b)
                    if(B(m,n)==0)
                        C(1,l)=C(1,l)+1;%���Ϊ�ڵ㣬�����ܶȼ�1�����ս��Ϊ�����ܶ�
                    end
                end
            end
            l=l+1;%������һ������
        end
    end

    fprintf(fid,'%d',k);
    fprintf(fid,'%s','       ');
    for i=1:8*16-1
      fprintf(fid,'%d',C(1,i));%����������д���ı�
      fprintf(fid,'%s',',');
    end
    if k~=2000
    fprintf(fid,'%d\n',C(1,8*16));%��Ϊ���һ�У���ÿ��ĩβ�ӻس�
    else
    fprintf(fid,'%d',C(1,8*16)); %���һ���򲻼�
    end

end

fclose(fid);%�ر��ļ�





