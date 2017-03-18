function cleaned = clean(pic)
img = pic;
% Start by doing converting to black and white obviously
img = rgb2gray(img);
% img = imbinarize(img, 0.8);
img = rgb2gray(img);
img = imbinarize(img, 0.5);
img = imopen(img,strel('disk',7));
imshow(img);
cleaned = img;