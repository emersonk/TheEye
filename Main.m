% Main Class
close all; clear;

% Construct network
brain = makeBrain();
% Create webcam object cam
cam = webcam;
%Bounding box
thisBB = [165 90 315 300];

for i = 1:500
        im = snapshot(cam);       % Take a picture, it'll last longer
        im = imcrop(im, thisBB);
        img = clean(im);
        imgv = img(:);
        answ = brain(imgv);
        label = processClassification(answ);
%         disp(answ);
   % imshow(im);
   hold on
        subplot(1,2,1), imshow(im);
        subplot(1,2,2), imshow(img);
        title(label);
%         rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)], 'EdgeColor','r','LineWidth',2 )
    hold off
end
clear cam;
