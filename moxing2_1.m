tic;
import containers.Map
xileibie_user=Map()  %�൱�����ĵ�I_i
user_interest=Map()   %�û�����Ȥ��ϸ���
alpha=0.2; %��ֵ,Խ��Խ�ϸ�
p_i=0.05;  %��ֵ��ԽС��Խ�ϸ�
for u=0:10000
    user_index=find(VarName7==u);  %��train�ļ����û�u��ռ��Щ��
    N=sum(VarName9(user_index));  %�û�u���ܷ�����
    cities_id=VarName8(user_index);  %�û�uȥ���ĳ���id������
    [duiying1,duiying]=ismember(cities_id,VarName1);  %�ҵ��û�u�Ķ�Ӧ���±�
    duiying(duiying==0) = []; %ȥ����Щ�û�uûȥ���ĵط�
    hang=VarName6(duiying);%�û�u��ӦVarName6����
    xileibie=unique(hang); %�û�uȥ����ϸ���
    p=tabulate(hang);  %ͳ�Ƹ�Ԫ�س��ֵ�Ƶ��
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %�û�u����Ȥ�ĵص�С��
    [x,y]=size(p_index);
    if x>0&&y==1
        num2str(u)
        user_interest(num2str(u))=p1(p_index,:);  %�û�u����Ȥ�ĵط�
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;  
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=10001:20000
    user_index=find(VarName7==u);  %��train�ļ����û�u��ռ��Щ��
    N=sum(VarName9(user_index));  %�û�u���ܷ�����
    cities_id=VarName8(user_index);  %�û�uȥ���ĳ���id������
    [duiying1,duiying]=ismember(cities_id,VarName1);  %�ҵ��û�u�Ķ�Ӧ���±�
    duiying(duiying==0) = []; %ȥ����Щ�û�uûȥ���ĵط�
    hang=VarName6(duiying);%�û�u��ӦVarName6����
    xileibie=unique(hang); %�û�uȥ����ϸ���
    p=tabulate(hang);  %ͳ�Ƹ�Ԫ�س��ֵ�Ƶ��
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %�û�u����Ȥ�ĵص�С��
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=20001:30000
    user_index=find(VarName7==u);  %��train�ļ����û�u��ռ��Щ��
    N=sum(VarName9(user_index));  %�û�u���ܷ�����
    cities_id=VarName8(user_index);  %�û�uȥ���ĳ���id������
    [duiying1,duiying]=ismember(cities_id,VarName1);  %�ҵ��û�u�Ķ�Ӧ���±�
    duiying(duiying==0) = []; %ȥ����Щ�û�uûȥ���ĵط�
    hang=VarName6(duiying);%�û�u��ӦVarName6����
    xileibie=unique(hang); %�û�uȥ����ϸ���
    p=tabulate(hang);  %ͳ�Ƹ�Ԫ�س��ֵ�Ƶ��
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %�û�u����Ȥ�ĵص�С��
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=30001:40000
    user_index=find(VarName7==u);  %��train�ļ����û�u��ռ��Щ��
    N=sum(VarName9(user_index));  %�û�u���ܷ�����
    cities_id=VarName8(user_index);  %�û�uȥ���ĳ���id������
    [duiying1,duiying]=ismember(cities_id,VarName1);  %�ҵ��û�u�Ķ�Ӧ���±�
    duiying(duiying==0) = []; %ȥ����Щ�û�uûȥ���ĵط�
    hang=VarName6(duiying);%�û�u��ӦVarName6����
    xileibie=unique(hang); %�û�uȥ����ϸ���
    p=tabulate(hang);  %ͳ�Ƹ�Ԫ�س��ֵ�Ƶ��
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %�û�u����Ȥ�ĵص�С��
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=40001:50843
    user_index=find(VarName7==u);  %��train�ļ����û�u��ռ��Щ��
    N=sum(VarName9(user_index));  %�û�u���ܷ�����
    cities_id=VarName8(user_index);  %�û�uȥ���ĳ���id������
    [duiying1,duiying]=ismember(cities_id,VarName1);  %�ҵ��û�u�Ķ�Ӧ���±�
    duiying(duiying==0) = []; %ȥ����Щ�û�uûȥ���ĵط�
    hang=VarName6(duiying);%�û�u��ӦVarName6����
    xileibie=unique(hang); %�û�uȥ����ϸ���
    p=tabulate(hang);  %ͳ�Ƹ�Ԫ�س��ֵ�Ƶ��
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %�û�u����Ȥ�ĵص�С��
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

toc;

