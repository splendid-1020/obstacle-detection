function [lowerThreshold, upperThreshold] = thresholdRGB(imageRGB, lower, upper)
    if lower > upper 
        lower = upper;
    end
    maxVal = max(max(imageRGB));
    minVal = min(min(imageRGB));
    lowerThreshold = minVal + lower * (maxVal - minVal);
    upperThreshold = minVal + upper * (maxVal - minVal);
end