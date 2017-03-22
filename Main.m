% Main Class
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

%Get the shot
% pause(3);
% snap = imcrop(snapshot(cam), thisBB);
% snap = clean(snap);
% figure, imshow(snap);

%Classify using the neural network returned by brain

% while true
%     im = snapshot(camera);       % Take a picture
%     image(im);                   % Show the picture
%     im = imresize(im,[227 227]); % Resize the picture for alexnet
%     label = classify(net,im);    % Classify the picture
%     title(char(label));          % Show the class label
%     drawnow
% end