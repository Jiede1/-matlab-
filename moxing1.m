%�û���50844,����90632

%%�㷨���̣�
%%1.�½�һ������dict�������Ѿ������ھ���ĵص�
%%2.�����ص�
%%3.����һ���ص��ҵص㲻��dict��
%%  ����������������ص��Sd��l_i,l_j��---�ص�������ƶ�
%%  ����õص��������ص��Sm��l_i,l_j��---�������ƶ�
%%  ȡ��1000����õص����ƶ���ߵĵص�      
%%4.����ص�ɹ����γ��ˡ��ص��顱
%%5.������һ�û�
%%  ������һ�ص���
%%  ����û��ڸõص����ǩ������
%%  �γɸ��û��ĵص�������
%%6.������һ�û�
%%  �������������û�
%%  ���S��u,v��
%%  ����S��u,v���Ĵ�С������û����Ƽ��û�top3
%%  ����Ƽ��û�ȥ���ĳ��м���
%%  ������Щ���м���
%%      ���S��u,i��
%%      �����ߵ�S��u,i����i�����û�u���Ƽ�����

tic;
import containers.Map
%D=length(VarName1); % �ص���
%ͳ���û�ȥ������Щ����
%for i=1:50843
%    t=find(VarName7==i);
%    
%end
%ͳ�����г��ֹ����֣����ִ���
%Z=[cell2mat(VarName5);cell2mat(VarName14)];
%z1=unique(cell2mat(VarName5));
%size(z1)
%z2=unique(cell2mat(VarName14));
%size(z2)
%zi=unique([z1;z2]);
%size(zi)
%zi_cishu=Map();
%for i=1:length(zi)
%    zi_cishu(char(zi(i)))=length(find(Z==zi(i)));
%end
%clear i;
%function d=randnorepeat(m,n)
%����һ����[1,n]��Χ�ڵ�m�����ظ�������
%p=randperm(n);
%d=p(1:m);
%end
%��������
dictcity=[];
dict_city_Map=Map();  %���ڴ�������ĵص㣬�γɵص���
time=1;
R=cat(2,VarName2,VarName3);
id0=unique(VarName1);
for i=1:90632  %�����ص�
    cityid=id0(i);
    if ~ismember(cityid,dictcity)
        simi=zeros(90632,1);  %����ص�cityid�ص��������ص�����ƶ�
        dictcity1=cityid;
        tic;
        for j=1:90632
            %citywait=id0(j);
            LAT1=R(i,1);LON1=R(i,2);
            LAT2=R(j,1);LON2=R(j,2);
            Sd=distance_similarity(LAT1,LON1,LAT2,LON2,1);  %���������ص�������ƶȣ�alpha=1
            Sm=sum(fr(i,:).*fr(j,:))/(sqrt(sum(fr(i,:)))*sqrt(sum(fr(j,:))));%���������ص��������ƶ�
            S=Sd*Sm;  %�����ص����յ����ƶ�
            simi(j)=S;
        end
        toc;
        lenc=floor(0.6*(length(simi)-i));  %ȡ��simi��ȥi����60%��Ԫ��
        lenc       
        [sort_city,indexall]=sort(simi,1,'descend');  %����
        length(indexall) 
        if length(indexall)>=lenc
            index=indexall(1:lenc);
        else
            index=indexall(:);
        end
        tf=ismember(VarName1(index),dictcity); %VarName1(index)�Ƿ���dictcity��
        op=find(tf==0);
        g=VarName1(index);
        dictcity=unique([dictcity;g(op)]);
        dictcity1=unique([dictcity1;g(op)]);
        dict_city_Map(num2str(time))=dictcity1;  %������ǵص�id
        time=time+1;
        dictcity1=[];
        clear simi;
        length(dictcity)
    end
    if length(dictcity)==90632
        break;
    end
end
clear i;
clear j;
clear k;
clear R;
1
%�û��ĵص�������
DZXL=zeros(50844,length(dict_city_Map));
for i=1:50844
    quguo=find(VarName7==i);
    for j=1:length(dict_city_Map)  %�����ص���
        cityuser=dict_city_Map(num2str(j));
        DZXL(i,j)=sum(ismember(cityuser,VarName8(quguo)));
    end
    clear quguo;
end
clear i;
clear j;
clear cityuser;
2

tuijianall=Map();  %���յ��Ƽ��ص�

for u=1:20000
    %�������û�u��ӽ���3���û�
    tic;
    SS=zeros(5,1);
    vall=[u,randi([1,50844],1,4)];
    parfor v_index=1:5
        v=vall(v_index);
        s=sum(DZXL(u,:).*DZXL(v,:))/(sqrt(sum(DZXL(u,:)))*sqrt(sum(DZXL(v,:))));
        if ~isnan(s)
            SS(v_index)=s;
        end
    end
    [Suv,userindex]=sort(SS,1,'descend');  %Suv���û������ƶ���ֵ
    lenu=3;  %ȡ��S��3��Ԫ��
    usersimi=vall(userindex(1:lenu));  %���Ƶ�3���û�
    bestsui=-inf;  %�û�u��ص�i�����ƶ�,Ҳ�����յ��Ƽ��ص�
    tuijian=[];   %���յ��Ƽ��ص�id
    cv=zeros(3,1);  %�û�v����ǩ������
    cityall=[];  %���Ƶ�3���û�ȥ�������еص����
    ind=ismember(VarName7,usersimi);
    cityall=unique(VarName8(find(ind==1)));
    for v=1:3  %����3���û�
        index=find(VarName7==usersimi(v));
        %cityv=unique(VarName8(index));  %�û�vȥ���ĳ��м���
        cv(v)=length(index);  %�û�v����ǩ������
        %cityall=unique([cityall;cityv]);
    end
    clear index;
    for i=1:length(cityall)  %���������û�ȥ���ĳ���
        sui=0;
        for v=1:3 %�����û�
            index=find(VarName7==usersimi(v));
            cvi=sum(ismember(VarName8(index),cityall(i,:)));
            sui=sui+(Suv(v)*cvi/cv(v))/sum(Suv(1:3));
        end
        if sui>bestsui
            bestsui=sui;
            tuijian=cityall(i,:);
        end
    end
    tuijiancity=unique(VarName4(find(VarName1==tuijian)));
    tuijianall(num2str(u))=tuijiancity;
    clear SS;
    toc;
end

for u=20001:50844
    %�������û�u��ӽ���3���û�
    tic;
    SS=zeros(5,1);
    vall=[u,randi([1,50844],1,4)];
    parfor v_index=1:5
        v=vall(v_index);
        s=sum(DZXL(u,:).*DZXL(v,:))/(sqrt(sum(DZXL(u,:)))*sqrt(sum(DZXL(v,:))));
        if ~isnan(s)
            SS(v_index)=s;
        end
    end
    [Suv,userindex]=sort(SS,1,'descend');  %Suv���û������ƶ���ֵ
    lenu=3;  %ȡ��S��3��Ԫ��
    usersimi=vall(userindex(1:lenu));  %���Ƶ�3���û�
    bestsui=-inf;  %�û�u��ص�i�����ƶ�,Ҳ�����յ��Ƽ��ص�
    tuijian=[];   %���յ��Ƽ��ص�id
    cv=zeros(3,1);  %�û�v����ǩ������
    cityall=[];  %���Ƶ�3���û�ȥ�������еص����
    ind=ismember(VarName7,usersimi);
    cityall=unique(VarName8(find(ind==1)));
    for v=1:3  %����3���û�
        index=find(VarName7==usersimi(v));
        %cityv=unique(VarName8(index));  %�û�vȥ���ĳ��м���
        cv(v)=length(index);  %�û�v����ǩ������
        %cityall=unique([cityall;cityv]);
    end
    clear index;
    for i=1:length(cityall)  %���������û�ȥ���ĳ���
        sui=0;
        for v=1:3 %�����û�
            index=find(VarName7==usersimi(v));
            cvi=sum(ismember(VarName8(index),cityall(i,:)));
            sui=sui+(Suv(v)*cvi/cv(v))/sum(Suv(1:3));
        end
        if sui>bestsui
            bestsui=sui;
            tuijian=cityall(i,:);
        end
    end
    tuijiancity=unique(VarName4(find(VarName1==tuijian)));
    tuijianall(num2str(u))=tuijiancity;
    clear SS;
    toc;
end
3           
    
    
    
        
        
    
