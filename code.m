 Icroporigin = imread('E:\image\plate.jpg');
subplot(2,3,1),imshow(Icroporigin);title('����');

%�Ҷ�ͼת��
gray = rgb2gray(Icroporigin);
subplot(2,3,2),imshow(gray);title('���ƻҶ�ͼ');

%��ֵ��Otus�ָ�
%bw = im2bw(gray,0.9);
level = graythresh(gray);
bw = im2bw(gray, level);
subplot(2,3,3),imshow(bw);title('���ƶ�ֵͼ');

%��̬ѧ�˲�������
se = strel('square',3);
BWCrop = imopen(bw, se);
%ȥ����ͨ�������С��50��Ŀ��
BWCrop = bwareaopen(BWCrop,50);
subplot(2,3,4),imshow(BWCrop);title('��ͨ���������ĳ��ƶ�ֵͼ');
 
%�ָλ
[IBW2, num] = bwlabel(BWCrop, 8);
subplot(2,3,5),imshow(BWCrop);title('���ƶ�ֵͼ���ַ���λ���');
cc = bwconncomp(BWCrop);
stats = regionprops(cc, 'Area','Boundingbox');
hold on
for i=1:cc.NumObjects
      
       rectangle('position',stats(i).BoundingBox,'edgecolor','r');
        bb = stats(i).BoundingBox;
        %status(i).BoundingBox(1)
        %status(i).BoundingBox(2)
        xwidth=stats(i).BoundingBox(3);
        ywith=stats(i).BoundingBox(4);
         Icropletter=imcrop(IBW2,bb);
      
end