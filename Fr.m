function [ fr,FC,RC ] = Fr( VarName1,VarName5,VarName6 )
%ͨ��Fr���ÿ���ص��������Ϣ����
%���뵼��ΪVarName1,VarName5,VarName6
clc;
D=length(VarName1)   %���еص�
R=cat(2,VarName5,VarName6 ); %����VarName5,VarName6,��СΪ(length(VarName5),2)�ľ���
FC=zeros(length(VarName1),4);
num_k=zeros(1,4);
RC=zeros(length(VarName1),4);
z=[];  %�����ϸ��������ֵ���������

for i=1:length(VarName1)  
    temp=char(R(i,:));
    for p=1:4
        %temp(p)
        if ~ismember(temp(p),z)  %�ж�ĳԪ���Ƿ���z��
            z=[z,temp(p)];
        end
    end
end
z;
z_num=zeros(1,length(z));  %��Ӧ��z��ÿ�����۳��ֹ��ĵص���
for i=1:length(VarName1)  
    temp=char(R(i,:));
    for p=1:4
        ans=sum(temp(p)==z);
        if ans~=0
            z_num(find((temp(p)==z)))=z_num(find((temp(p)==z)))+1;
        end
    end
end
    
for i=1:length(VarName1)   
    k=char(R(i,:));  %����һ���ص�Ĵ�ϸ�����������
    for k_index=1:4
        a1=find(k==k(k_index)); %һ���ص���ֳ��ֵĴ���
        %length(a1)
        FC(i,k_index)=1/length(a1); 
        find(k(k_index)==z);
        if find(k(k_index)==z)   
            %find(k(k_index)==z)
            RC(i,k_index)=log(D/z_num(find(k(k_index)==z)));
        end
    end
end
fr=FC.*RC;
end

