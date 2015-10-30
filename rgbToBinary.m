function [binary] = rgbToBinary(imageRGB, lower, upper)
    rgb = zeros(size(imageRGB));
    for i = 1:3
        rgb(:, :, i) = (imageRGB(:, :, i) > upper(i)) | ...
            (imageRGB(:, :, i) < lower(i));
    end
    binary = rgb(:, :, 1) | rgb(:, :, 2) | rgb(:, :, 3);
    binary = ~binary;
    
   