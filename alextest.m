%http://www.mathworks.com/help/images/examples/detecting-a-cell-using-image-segmentation.html
%http://www.mathworks.com/help/images/noise-removal.html
clear
clc

im = imread('img/IMG_0013.JPG');
gray = rgb2gray(im);

%-----noise filter-----
K = wiener2(gray,[5 5]);
imshow(K)
gray = K;
%-----aplying sobel-----
[~, threshold] = edge(gray, 'sobel');
fudgeFactor =2;
BWs = edge(gray,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('binary gradient mask');
%-----dilatating the edges------
se90 = strel('line', 5, 90);
se0 = strel('line', 5, 0);
BWsdil = imdilate(BWs, [se90 se0]);
figure, imshow(BWsdil), title('dilated gradient mask');
%-----fill the holes----- ONLY WORKS FOR KEYHOLDER
BWdfill = imfill(BWsdil, 'holes');
figure, imshow(BWdfill);
title('binary image with filled holes');
%-----smothing the edges-----
seD = strel('diamond',1);
BWfinal = imerode(BWdfill,seD);
BWfinal = imerode(BWfinal,seD);
figure, imshow(BWfinal), title('segmented image');
%------shows edges in the pic-----
BWoutline = bwperim(BWfinal);
Segout = gray;
Segout(BWoutline) = 255;
figure, imshow(Segout), title('outlined original image');
