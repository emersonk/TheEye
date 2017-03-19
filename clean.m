function cleaned = clean(pic)
img = pic;
% Start by doing converting to black and white obviously
img = rgb2gray(img);
img = imbinarize(img, 0.5);
img = imopen(img,strel('disk',7));
cleaned = img;