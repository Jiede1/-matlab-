%%%%ģ��һ��Ƽ����û��ľ�γ�ȣ��Լ�ϸ���%%%%
import containers.Map
key=keys(tuijianall);
tuijianall_wei=Map();
%for i=1:length(tuijianall)
for i=1:1576
   user=char(key(i));
   city=char(tuijianall(user));  %�û�ȥ����city
   index1=find(VarName7==str2num(user));%�û�ȥ���ĵص�id��Ӧ����
   id=VarName8(index1);%�û�ȥ���ĵص�id
   [h,index2]=ismember(id,VarName1);  
   index2=index2(find(index2));
   [h1,index2_1]=ismember(VarName4(index2),{city});  %�����Ƽ����У��ҳ��û���Ӧ��
   index2_1=find(index2_1);
   if sum(h1)~=0  %����Ƽ�city���û�ȥ����
       length(index2_1)
       tf=VarName6(index2_1);  %�û����Ƽ��������棬ȥ����ϸ���
       %���������Ѱ�ҳ��ִ�������ϸ���
       table=tabulate(tf);  % ����һ�����󣺵�һ��ΪԪ��ֵ���ڶ���Ϊ��ӦԪ�س��ָ�����������Ϊ��ӦԪ�ظ���ռ����Ԫ�ظ����ٷֱ�
       [n,m]=size(table);
       if n==1
            [maxCount,idx]=max(cell2mat(table(:,2)));%��ȡ���ִ�������Ԫ�ص��±꣬idx��ų��ִ������Ԫ����table�е��±꣬���ж��Ԫ���򷵻ص�һ��Ԫ�ص��±�
       else
            [maxCount,idx]=max(cell2mat(table(:,2)));
       end
       bestxi=table(idx); %�û�ȥ����ϸ���ص�
       %��γ��
       [h,index3]=ismember(tf,bestxi);
       index3=find(index3==1);
       weizhi=index2_1(index3);
       tuijianall_wei(user)={VarName2(weizhi),VarName3(weizhi),bestxi};
   else   
       table=tabulate(id); 
       [maxCount,idx]=max(table(:,2));
       bestid=table(idx);   %��õĵص�id
       pindex=find(VarName1==bestid)
       tuijianall_wei(user)={VarName2(pindex),VarName3(pindex),VarName6(pindex)}
   end
end
    