 Icroporigin = imread('E:\image\plate.jpg');
subplot(2,3,1),imshow(Icroporigin);title('车牌');

%灰度图转换
gray = rgb2gray(Icroporigin);
subplot(2,3,2),imshow(gray);title('车牌灰度图');

%二值化Otus分割
%bw = im2bw(gray,0.9);
level = graythresh(gray);
bw = im2bw(gray, level);
subplot(2,3,3),imshow(bw);title('车牌二值图');

%形态学滤波开运算
se = strel('square',3);
BWCrop = imopen(bw, se);
%去掉连通分量面积小于50的目标
BWCrop = bwareaopen(BWCrop,50);
subplot(2,3,4),imshow(BWCrop);title('连通分量处理后的车牌二值图');
 
%分割定位
[IBW2, num] = bwlabel(BWCrop, 8);
subplot(2,3,5),imshow(BWCrop);title('车牌二值图的字符定位结果');
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