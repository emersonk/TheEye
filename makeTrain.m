close all; clear;
% Create webcam object cam
cam = webcam;
% Create axes control.
handleToAxes = axes();
% Get the handle to the image in the axes.
hImage = image(zeros(480,640,'uint8'));
hold off;
axis auto;
axis on;
% Turn on the live video.
preview(cam, hImage);
hold on
thisBB = [165 90 315 300];
rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)], 'EdgeColor','r','LineWidth',2 )
hold off
fld = 'C:\Users\Emerson\Documents\COSC 445\TheEye\training_images\Y';  %the folder
nametemplate = 'image_%04d.png';  %name pattern
imnum = 0;        %starting image number
for K = 1 : 100    %if you want to do this 100 times
   snap = imcrop(snapshot(cam), thisBB);
   imnum = imnum + 1;
   thisfile = sprintf(nametemplate, imnum);  %create filename
   fullname = fullfile(fld, thisfile);  %folder and all
   imwrite(snap, fullname);
end
