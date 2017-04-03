% Main Class
close all; clear;

% Create webcam object cam
cam = webcam;

% Bounding box
thisBB = [165 90 315 300];
 
%To construct a new network, step through encodeFeatureVector scrip

% Use previously saved brain
load deepnet.mat;
brain = deepnet;

answ = zeros(24,1);
label = '';
for i = 1:500
   im = snapshot(cam);       % Take a picture, it'll last longer
   im = imcrop(im, thisBB);
   img = clean(im);
   
   %Should convert this to vector in the same way as encodeFeatureVector
   imgv = img(:);
%    answ = answ + brain(imgv);

   answ = brain(imgv);
%    div = mod(i,25);
   label = processClassification(answ);
%    disp(l);
   
%    if div == 0
%     label = strcat(label, l);
%     answ = zeros(24,1);
%    end 
   
   hold on
        subplot(1,2,1), imshow(im);
        subplot(1,2,2), imshow(img);
        title(label);
   hold off
end
clear cam;
