tic;
import containers.Map
xileibie_user=Map()  %�൱�����ĵ�I_i
user_interest=Map()   %�û�����Ȥ��ϸ���
alpha=0.5; %��ֵ,Խ��Խ�ϸ�
p_i=0.05;  %��ֵ��ԽС��Խ�ϸ�
for u=0:50843  %�����û���������50844λ�û�
    tic;
    user_xileibie=Map();  %����һ���û�uӳ�䵽ϸ����������ӳ��Map
    user_index=find(VarName7==u);  %��train�ļ����û�u��ռ��Щ��
    N=sum(VarName9(user_index));  %�û�u���ܷ�����
    cities_id=VarName8(user_index);  %�û�uȥ���ĳ���id������
    for i=1:length(cities_id)           %�����û�uȥ���ĳ���id������
        t=find(VarName1==cities_id(i));  %�ҳ�����id�Ķ�Ӧ��
        xileibie=VarName6(t);   %�û�u���ʵĳ��е�ϸ�������
        xileibie=char(xileibie);
        if u==0 && i==1   %����ǵ�һ��Ҫ����xileibie_user
            xileibie_user(xileibie)=u;                    %sum(cellfun(@(x)isequal(x,{u}),values(xileibie_user)))
        elseif ismember(xileibie,keys(xileibie_user)) &&  sum(cellfun(@(x)isequal(x,u),values(xileibie_user))) %���xileibie_user�Ѿ����ڼ�xileibie������key��
            xileibie_user(xileibie)=[xileibie_user(xileibie);u];  %%%����ܷǳ���ʱ��
            xileibie_user(xileibie)=unique(xileibie_user(xileibie));
        else  %���xileibie_user�����ڼ�xileibie
            xileibie_user(xileibie)=u;
        end
        city=VarName4(t);    %����id��Ӧ�ĳ�������
        if ismember(xileibie,keys(user_xileibie))
            user_xileibie(xileibie)=user_xileibie(xileibie)+VarName9(i);  %�û�u����ϸ���Ĵ���.��Ϊ����һ�����ж��ٴξ���ζ�ŷ���ϸ�����ٴ�
        else
            user_xileibie(xileibie)=VarName9(i);
        end   
    end

    for i=1:length(cities_id)           %�����û�uȥ���ĳ���id������
        t=find(VarName1==cities_id(i));  %�ҳ�����id�Ķ�Ӧ��
        xileibie=VarName6(t);   %�û�u���ʵĳ��е�ϸ�������
        xileibie=char(xileibie);
        if user_xileibie(xileibie)>N*alpha
            u=num2str(u); %�û�u
            if ~sum(cellfun(@(x)isequal(x,u),keys(user_interest)))  %�û�uû�б�user_interest��¼
                1;
                xileibie;
                user_interest(u)=xileibie;
            elseif ~ismember(xileibie,user_interest(u))
                2;
                user_interest(u)=[user_interest(u);xileibie];
                %user_interest(u)=unique(user_interest(u));
            end
        end
    end
    clear user_xileibie;
    clear cities_id;
    clear user_index;
    clear N;
    toc;
end
3
dict_Map=Map();  %���վ���Ч��
dict=[];  %��������
u=0;
clusters=1;  %������
key=keys(xileibie_user);
while u<50843
    if ~ismember(u,dict)  %�����û������û�u������dict����   
        a=length(user_interest(num2str(u)))/p_i;  %����Nu/p_i
        dict=unique([dict,u]);  %��u����dict���棬װ�����ù����û�
        dict1=u;  %����װ��һ��������û�
        parfor i=1:length(xileibie_user)  %����Ii
            if length(xileibie_user(char(key(i))))>=a && ismember(u,xileibie_user(char(key(i))))  %���|Ii|>Nu/p_i,��u��Ii����
                b=xileibie_user(char(key(i)));  %Ii�е��û�
                for vindex=1:length(b)
                    lenv=length(user_interest(num2str(b(vindex))));  %b(vindex)��ʾ�û�v
                    if lenv/p_i<=length(xileibie_user(char(key(i))))  %|Ii|>Nv/p_i
                        dict=unique([dict;b(vindex)]);
                        dict1=unique([dict;b(vindex)]);
                    end
                end
            end
        end
        dict_Map(num2str(clusters))=dict1;
        clusters=clusters+1;
        clear dict1;
    end
    u=u+1;
end
toc;



    
    
