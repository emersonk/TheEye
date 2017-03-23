function cleaned = clean(pic)
img = pic;
% Start by doing converting to black and white obviously
img = rgb2gray(img);
img = imbinarize(img, 0.5);
img = imopen(img,strel('disk',7));
img = im2double(img);
img = imresize(img,[30 30]);
cleaned = img;