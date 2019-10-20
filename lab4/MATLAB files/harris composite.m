clear
clc
img=cell(1,8);
% 
% img{1} = imread('DSC_P_0151.jpg');
% 
% img{2} = imread('DSC_P_0152.jpg');
% 
% img{3} = imread('DSC_P_0153.jpg');
% 
% img{4} = imread('DSC_P_0154.jpg');
% 
% img{5} = imread('DSC_P_0155.jpg');
% 
% img{6} = imread('DSC_P_0156.jpg');
% 
% img{7} = imread('DSC_P_0157.jpg');
% 
% img{8} = imread('DSC_P_0158.jpg');
% 
% img{9} = imread('DSC_P_0159.jpg');
% 
% img{10} = imread('DSC_P_0160.jpg');
% 
% img{11} = imread('DSC_P_0161.jpg');
% 
% img{12} = imread('DSC_P_0162.jpg');


% img{1} = imread('DSC_W_0164.jpg');
% 
% img{2} = imread('DSC_W_0165.jpg');
% 
% img{3} = imread('DSC_W_0166.jpg');
% 
% img{4} = imread('DSC_W_0167.jpg');
% 
% img{5} = imread('DSC_W_0168.jpg');
% 
% img{6} = imread('DSC_W_0169.jpg');

% img{1} = imread('DSC_0185.jpg');
% 
% img{2} = imread('DSC_0186.jpg');
% 
% img{3} = imread('DSC_0187.jpg');
% 
% img{4} = imread('DSC_0187-1.jpg');
% 
% img{5} = imread('DSC_0188.jpg');
% 
% img{6} = imread('DSC_0189.jpg');
% 
% img{7} = imread('DSC_0190.jpg');

% 
% img{1} = imread('DSC_0191.jpg');
% 
% img{2} = imread('DSC_0192.jpg');
% 
% img{3} = imread('DSC_0193.jpg');
% 
% img{4} = imread('DSC_0194.jpg');
% 
% img{5} = imread('DSC_0195.jpg');
% 
% img{6} = imread('DSC_0196.jpg');


% 
% img{1} = imread('DSC_0058.jpg');
% 
% img{2} = imread('DSC_0059.jpg');
% 
% img{3} = imread('DSC_0060.jpg');
% 
% img{4} = imread('DSC_0061.jpg');
% 
% img{5} = imread('DSC_0062.jpg');
% 
% img{6} = imread('DSC_0063.jpg');
% 
% img{7} = imread('DSC_0064.jpg');
% 
% img{8} = imread('DSC_0065.jpg');

% Gray = imread('DSC_0058_rect.jpg');
% img{1} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0059_rect.jpg');
% img{2} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0060_rect.jpg');
% img{3} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0061_rect.jpg');
% img{4} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0062_rect.jpg');
% img{5} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0063_rect.jpg');
% img{6} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0064_rect.jpg');
% img{7} = cat(3, Gray, Gray, Gray);
% Gray = imread('DSC_0065_rect.jpg');
% img{8} = cat(3, Gray, Gray, Gray);


img{1} = imread('DSC_0058_rect.jpg');

img{2} = imread('DSC_0059_rect.jpg');

img{3} = imread('DSC_0060_rect.jpg');

img{4} = imread('DSC_0061_rect.jpg');

img{5} = imread('DSC_0062_rect.jpg');

img{6} = imread('DSC_0063_rect.jpg');

img{7} = imread('DSC_0064_rect.jpg');

img{8} = imread('DSC_0065_rect.jpg');

I = img{1};

% Initialize features for first image
grayImage = rgb2gray(I);
[y,x]= harris(grayImage,5000,'tile',[2 2],'disp');
points = cornerPoints([x y]);

% deteact the points and use it to generate the features
[features, points] = extractFeatures(grayImage, points);

numImages = 8;
tforms(numImages) = projective2d(eye(3));

% Initialize variable to hold image sizes.
imageSize = zeros(numImages,2);
for n = 2:numImages

    % Store points and features for I(n-1).
    pointsPrevious = points;
    featuresPrevious = features;

    % Read I(n).
    I = img{n};

    % Convert image to grayscale.
    grayImage = rgb2gray(I);
    % Save image size.
    imageSize(n,:) = size(grayImage);

    % Detect and extract harris features for I(n).
    [y,x] = harris(grayImage,5000,'tile',[2 2],'disp');
    points = cornerPoints([x y]);
    [features, points] = extractFeatures(grayImage, points);

    % Find correspondences between I(n) and I(n-1).
    indexPairs = matchFeatures(features, featuresPrevious, 'Unique', true);

    matchedPoints = points(indexPairs(:,1), :);
    matchedPointsPrev = pointsPrevious(indexPairs(:,2), :);

    % Estimate the transformation between I(n) and I(n-1).
    tforms(n) = estimateGeometricTransform(matchedPoints, matchedPointsPrev,...
        'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);

    % Compute T(n) * T(n-1) * ... * T(1)
    tforms(n).T = tforms(n).T * tforms(n-1).T;
end
for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(i,2)], [1 imageSize(i,1)]);
end
avgXLim = mean(xlim, 2);

[~, idx] = sort(avgXLim);

centerIdx = floor((numel(tforms)+1)/2);

centerImageIdx = idx(centerIdx);
Tinv = invert(tforms(centerImageIdx));

for i = 1:numel(tforms)
    tforms(i).T = tforms(i).T * Tinv.T;
end
for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(i,2)], [1 imageSize(i,1)]);
end

maxImageSize = max(imageSize);

% Find the minimum and maximum output limits
xMin = min([1; xlim(:)]);
xMax = max([maxImageSize(2); xlim(:)]);

yMin = min([1; ylim(:)]);
yMax = max([maxImageSize(1); ylim(:)]);

% Width and height of panorama.
width  = round(xMax - xMin);
height = round(yMax - yMin);

% Initialize the "empty" panorama.
panorama = zeros([height width 3], 'like', I);
blender = vision.AlphaBlender('Operation', 'Binary mask', ...
    'MaskSource', 'Input port');

% Create a 2-D spatial reference object defining the size of the panorama.
xLimits = [xMin xMax];
yLimits = [yMin yMax];
panoramaView = imref2d([height width], xLimits, yLimits);

% Create the panorama.
for i = 1:numImages

    I = img{i};

    % Transform I into the panorama.
    warpedImage = imwarp(I, tforms(i), 'OutputView', panoramaView);

    % Generate a binary mask.
    mask = imwarp(true(size(I,1),size(I,2)), tforms(i), 'OutputView', panoramaView);

    % Overlay the warpedImage onto the panorama.
    panorama = step(blender, panorama, warpedImage, mask);
end

figure
imshow(panorama)
