%%%%���ģ����������%%%%

import containers.Map
key=keys(dict_Map);
alpha1=0.4;
theta=0.3;
gamma=0.3;
zcity=zeros(length(key),2);  %����ѡ���ĳ��о�γ��
citylast=cell(1,length(key));
citylast_distance=zeros(length(key),1); %����ѡ���ĳ��е���̾���
tic;
for i=1:length(key) %��������    
    sum1=0;
    leixing_cishu=Map(); 
    p=char(key(i));
    users=dict_Map(p);  
    for j=1:length(users)  %������Ա
        user=users(1);    %user
        leixing=user_interest(num2str(user));  %user����Ȥ�ĵص����ͣ�ϸ���
        [x5,y5]=size(leixing);
        for k=1:x5  %��������
            num=0;
            t=find(VarName7==user);
            id=VarName8(t);
            [index1,index]=ismember(id,VarName1);
            index(index==0) = [];%ȥ��0
            for r=1:length(index)
                VarName6{index(r)},leixing(k,:);
                if ismember(VarName6{index(r)},leixing(k,:))
                    num=num+1;
                end
            end
            %leixing(k,:)
            %char(VarName6(index));
            %class(leixing(k,:));
            %[x,y]=ismember(leixing(k,:),VarName6(index))
            %num=sum(x);
            
            if ~ismember(char(leixing(k,:)),keys(leixing_cishu))
                leixing_cishu(char(leixing(k,:)))=num;
                sum1=sum1+num;
            else
                leixing_cishu(char(leixing(k,:)))=leixing_cishu(char(leixing(k,:)))+num;
                sum1=sum1+num;
            end
        end
    end
    %��ʼ��Ⱥ��Ϊ��λ����
    key_leixing=keys(leixing_cishu);
    bestlei=0;
    lg=zeros(1,length(key_leixing));
    temp=zeros(1,length(key_leixing));
    for ti=1:length(key_leixing)  %�����ж���������
        pv=(-leixing_cishu(char(key_leixing(ti)))/sum1)*log(leixing_cishu(char(key_leixing(ti)))/sum1);
        pc=exp(-leixing_cishu(char(key_leixing(ti)))/sum1);
        temp(i)=alpha1*pv+theta*pc;
        lg(i)=log10((leixing_cishu(char(key_leixing(ti)))+2)/leixing_cishu(char(key_leixing(ti))));
    end
    pr=zeros(1,length(key_leixing));
    best_lei=0;
    bestnum=-10000;
    for tii=1:length(key_leixing)  %�����ж���������
        pr(tii)=(sum(lg)-lg(tii))/lg(tii)-1;  %%%%%%�Ķ���ʽ
        p=temp(i)+gamma*pr(tii);
        if bestnum<p
            bestnum=p;
            best_lei=tii;
        end
    end
    g=keys(leixing_cishu);
    bestlei=char(g(best_lei));   %���ھ��࣬��õĵص�����
    %�ҳ����������ж�Ӧbestlei�ĳ���
    %all=find(VarName6==bestlei);
    %[al,all]=ismember(bestlei(1:2),VarName6)
    all=[];
    for it=1:90632
        if ismember({bestlei(1:2)},VarName6(it))
            all=[all,it];
        end
    end
    allcity=unique(VarName4(all));
    allcityid=unique(VarName1(all));
    x=VarName2(all);
    y=VarName3(all);
    
    City=unique(VarName4(all));
    %�ο���dist=@(var) sum(sqrt((var(1)-x).^2+(var(2)-y).^2));                
    %dist=@(var)(6400*3.14/180)*(sin(var(2))*sin(y)*cos(var(1)-x)+cos(var(2))*cos(y));
    %dist=@(var) sum(sqrt((var(1)-x).^2+(var(2)-y).^2));
    dist=@(var) 6400*2*real(asin(sum(sqrt(sin((var(1)-x)./2).^2)+cos(x.*pi/180).*cos(var(1)*pi/180).*sin((var(2)-y)./2).^2)));
    %var0=[mean(x),mean(y)];
    %var0=[mean(x),mean(y)];
    var0=[mean(x),mean(y)]+(rand(1,2).*0.1);  %΢������
    options = fminunc(dist,var0);
    [var,minDistance,exitflag]=fminunc(dist,var0,options);
    zcity(i,:)=[var(1),var(2)]; %������õĵ� 
    cityclu=0;
    bestdis=inf;
    worstdis=-inf;
    so=[];
    for o=1:length(City)
        juli=sum(sqrt((zcity(i,1)-x(o)).^2+(zcity(i,2)-y(o)).^2));  %����ŷʽ�������
        if juli<bestdis
            bestdis=juli;
            cityclu=o;
        end
        so(o)=juli;
    end  
    [KL,indexKL]=sort(so);
    if i~=length(key)
        cityworst=indexKL(floor(length(so)/2));  %ģ����֤���е��±�
    else
        cityworst=indexKL(floor(length(so)/2)-2);
    end
    
    citylast{i}=City(cityclu);  %���յ��Ƽ���������
    citylast_distance(i)=6400*2*real(asin(sum(sqrt(sin((zcity(i,1)-x)./2).^2)+cos(x.*pi/180).*cos(zcity(i,1)*pi/180).*sin((zcity(i,2)-y)./2).^2)));
    
    %add1=City(cityworst);
    add1='changzho'      %�˳�������ģ����֤
    [p,g]=ismember(add1,VarName4(all));
    t2=VarName2(all);
    t3=VarName3(all);
    add1x=t2(g);
    add1y=t3(g);
    
    if i==length(key) %��ͼ�������� ���һ������Ⱥ��ͼ
        %plot(x,y,'ro','markersize',6);
        %������γͼ
        h = worldmap('world');
        getm(h,'MapProjection')
        geoshow('landareas.shp','FaceColor', [0.15 0.5 0.15])
        geoshow('worldlakes.shp', 'FaceColor', 'cyan')
        geoshow('worldrivers.shp','Color', 'blue')
        geoshow(add1x,add1y, 'Marker', '.','Color', 'blue')
        
        geoshow(x,y, 'DisplayType','point','Marker' ,'.','Color', 'red')
        
        %text(x,y,City,'FontSize',6)
        hold on;
        %plot(var(1),var(2),'b*','markersize',16)
        %text(var(1),var(2),char(City(cityclu)),'FontSize',18)
        geoshow(var(1),var(2), 'Marker', '.','Color', 'blue','markersize',16)   %�����Ƽ�����
        textm(var(1),var(2),'shanghai','color','blue','FontSize',18);   %�Ƽ����е�����
        
        %geoshow(add1x,add1y, 'Marker', '.','Color', 'blue','markersize',16)   %ģ����֤
        %textm(add1x,add1y,char(add1),'color','blue','FontSize',18);
        hold on;
        %plot(add1x,add1y,'b*','markersize',16)
        %text(add1x,add1y,char(add1),'FontSize',18)
        for i=1:length(x)
            %%%%%%%plot([var(1),x(i)],[var(2),y(i)],':r');
            %plot([add1x,x(i)],[add1y,y(i)],':r');
            %geoshow([var(1),x(i)],[var(2),y(i)],'r:')
            linem([var(1);x(i)],[var(2);y(i)],'r-')   %������Ⱥ�������Ƽ�����
            %linem([add1x,x(i)],[add1y,y(i)],'-r')
            hold on;
        end
        xlabel('Lon');
        ylabel('Lat');
        title('the last cluster(other city)');
    end
    
    clear var0;
    clear x;
    clear y;
    clear allcityid;
    clear cityclu;
    clear bestdis;
end
toc;