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
    bw1 = edge(binary, 'sobel');
    bw2 = edge(binary, 'canny', [0.0001, 0.001], 'both', 5);
    bw3 = edge(binary, 'prewitt');
    
    [B, L] = bwboundaries(binary, 'noholes');
    figure;
    subplot(1, 2, 1);
    imshow(binary);
    title('original');
    subplot(1, 2, 2);
    imshow(bw1);
    title('Sobel');
    figure
    subplot(1, 2, 1);
    imshow(bw2);
    title('Canny');
    subplot(1, 2, 2);
    imshow(bw3);
    title('Prewitt');

%     figure,
%     imshow(label2rgb(L, @jet, [.5 .5 .5]));
%     hold on
%     for k = 1:length(B)
%         boundary = B{k};
%         plot(boundary(:, 2), boundary(:, 1), 'w', 'LineWidth', 2);
%     end
end