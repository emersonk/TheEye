% Main Class
close all; clear;

% Create webcam object cam
cam = webcam;

% Adjust properties of cam. (if need be) 
% https://www.mathworks.com/help/supportpkg/usbwebcams/ug/acquire-images-from-webcams.html

% Take picture, convert to HSV and display
img = snapshot(cam);
hsv_img = rgb2hsv(img);
imshow(hsv_img);
