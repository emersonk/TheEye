function cleaned = clean(pic)
    img = pic;

    % Start by converting to black and white obviously
    img = rgb2gray(img);
    img = imbinarize(img, 0.5);
    img = imopen(img,strel('disk',7));
    img = im2double(img);

    %Find the main blob in the image
    props = regionprops(img);

    %Sort by blobs by area. Biggest blob is the one we want 
    [~,idx]=sort([props.Area]);

    %Get bounding box of blob and crop.
    handBB = props(1).BoundingBox;
    img = imcrop(img, handBB);

    % figure, imshow(img)

    %Resize image and return
    img = imresize(img,[56 56]);
    cleaned = img;
end