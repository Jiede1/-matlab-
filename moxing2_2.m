import containers.Map
dict_Map=Map();  %���������û�����
dict=[];  %��������
u=0;
clusters=1;  %������
alpha=0.3; %��ֵ,Խ��Խ�ϸ�
p_i=0.05;  %��ֵ��ԽС��Խ�ϸ�
tic;
while u<10000 
    if ~ismember(u,dict)  %�����û������û�u������dict����  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %����Nu/p_i
        dict=unique([dict,u]);  %��u����dict���棬װ�����ù����û�
        dict1=u;  %����װ��һ��������û�
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %����û�u�и���Ȥ�ĵط�
            inu=user_interest(num2str(u));  %�û�u����Ȥ�ĵص�
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii�е��û�
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)��ʾ�û�v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<20000 
    if ~ismember(u,dict)  %�����û������û�u������dict����  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %����Nu/p_i
        dict=unique([dict,u]);  %��u����dict���棬װ�����ù����û�
        dict1=u;  %����װ��һ��������û�
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %����û�u�и���Ȥ�ĵط�
            inu=user_interest(num2str(u));  %�û�u����Ȥ�ĵص�
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii�е��û�
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)��ʾ�û�v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<30000 
    if ~ismember(u,dict)  %�����û������û�u������dict����  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %����Nu/p_i
        dict=unique([dict,u]);  %��u����dict���棬װ�����ù����û�
        dict1=u;  %����װ��һ��������û�
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %����û�u�и���Ȥ�ĵط�
            inu=user_interest(num2str(u));  %�û�u����Ȥ�ĵص�
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii�е��û�
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)��ʾ�û�v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<40000 
    if ~ismember(u,dict)  %�����û������û�u������dict����  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %����Nu/p_i
        dict=unique([dict,u]);  %��u����dict���棬װ�����ù����û�
        dict1=u;  %����װ��һ��������û�
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %����û�u�и���Ȥ�ĵط�
            inu=user_interest(num2str(u));  %�û�u����Ȥ�ĵص�
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii�е��û�
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)��ʾ�û�v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<50844   %��0��ʼ����5084���û�
    if ~ismember(u,dict)  %�����û������û�u������dict����  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %����Nu/p_i
        dict=unique([dict,u]);  %��u����dict���棬װ�����ù����û�
        dict1=u;  %����װ��һ��������û�
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %����û�u�и���Ȥ�ĵط�
            inu=user_interest(num2str(u));  %�û�u����Ȥ�ĵص�
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii�е��û�
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)��ʾ�û�v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end
toc;