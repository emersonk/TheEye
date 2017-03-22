function [trainX, trainT, testX, testT, valX, valT] = brainPreprocessImg()
    % Load Training Images
    allImages = imageDatastore('training_images', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

    % Split data into training, testing and validation sets
    % trainingImages = 70% of images
    % testImages = 15% of images
    % validationImages = 15% of images
    [trainingImages, testImages, validationImages] = splitEachLabel(allImages, 0.7, 0.15, 'randomize');

    %For each set of images: 
    %convert each image to 2d matrix (greyscale)
    %resize each image down to 20 x 20
    %convert each image to a vector
    %Concatonate vector to matrix
    %Store label
    
    
    trainX=[];
    trainT=[];
    for i = 1:numel(trainingImages.Files)
        [img, fileinfo] = readimage(trainingImages, i);

        img = rgb2gray(img);
        img = imresize(img,[20 20]);
        imgv = img(:);
        trainX = horzcat(trainX,imgv);

        trainT = horzcat(trainT, fileinfo.Label);
    end

    testX=[];
    testT=[];
    for i = 1:numel(testImages.Files)
        [img, fileinfo] = readimage(testImages, i);

        img = rgb2gray(img);
        img = imresize(img,[20 20]);
        imgv = img(:);
        testX = horzcat(testX,imgv);

        testT = horzcat(testT, fileinfo.Label);
    end

    valX=[];
    valT=[];
    for i = 1:numel(validationImages.Files)
        [img, fileinfo] = readimage(validationImages, i);

        img = rgb2gray(img);
        img = imresize(img,[20 20]);
        imgv = img(:);
        valX = horzcat(valX,imgv);

        valT = horzcat(valT, fileinfo.Label);
    end

end

