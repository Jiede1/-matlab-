function [y] = distance_similarity(LAT1,LON1,LAT2,LON2,alpha)
%�����������
%ELLIPSOID=6378.137,����뾶�����Ǹ�����Ĳ���
%LAT1,LON1,LAT2,LON2���Ǿ�γ��
%alphaΪ���Ų���
p= distance(LAT1,LON1,LAT2,LON2,6378.137);
y=1/(p^alpha+1);
%y=1/(p^alpha+1);
end

