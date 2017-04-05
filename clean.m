% function cleaned = clean(pic)
%     img = pic;
     close all; clear;
     img = imread('training_images/B/image_0066.png');
     figure, imshow(img);
    
    % Start by converting to black and white obviously
    img = rgb2gray(img);
    img = imbinarize(img, 0.6); %use to be 0.5
    img = imopen(img,strel('disk',2)); %use to be 7
    img = imerode(img, strel('disk',4)); 
    img = im2double(img);
     figure, imshow(img);
    
    %Find the main blob in the image
    props = regionprops(img, 'Orientation', 'Area', 'BoundingBox');
    %Sort by blobs by area. Biggest blob is the one we want 
    [~,idx]=sort([props.Area]);
    %Get bounding box of blob and crop.
    handBB = props(1).BoundingBox;
    img = imcrop(img, handBB);
     figure, imshow(img);
    
    %Use orientation to rotate an image straight up and down
     theta = props(1).Orientation;
     if theta < 0
         theta = -(90 + theta);
     elseif theta >= 0
         theta = -(90 - theta);
     end  
     img = imrotate(img, theta);
     figure, imshow(img);
%     
%     %Find the main blob in the image
%      props = regionprops(img, 'Orientation', 'Area', 'BoundingBox');
%      %Sort by blobs by area. Biggest blob is the one we want 
%      [~,idx]=sort([props.Area]);
%      %Get bounding box of blob and crop.
%      handBB = props(1).BoundingBox;
%      img = imcrop(img, handBB);
%      figure, imshow(img);
        
    %Resize image and return
    img = imresize(img,[28 28]);    
    cleaned = img;
     figure, imshow(cleaned);
% end