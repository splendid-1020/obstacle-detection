bgpath = 'img/IMG_0011.JPG';
imgpath = java.util.ArrayList();
imgpath.add('img/IMG_0010.JPG');
imgpath.add('img/IMG_0013.JPG');
imgpath.add('img/IMG_0019.JPG');

bg = imread(bgpath);
imshow(bg);
[lowerThreshold, upperThreshold] = thresholdRGB(bg, 0.4, 0.99);

itr = imgpath.listIterator();
while itr.hasNext()
    % iterate over foreground images, convert eaach to binary
    fg = imread(itr.next());
    binary = rgbToBinary(fg, lowerThreshold, upperThreshold);
    figure, imshow(binary);
end