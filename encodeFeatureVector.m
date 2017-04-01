%%load training data
allImages = imageDatastore('training_images', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
[trainingImages,testingImages] = splitEachLabel(allImages, 0.7, 0.15, 'randomize');

%% 
xTestImages = [];
tTest = [];
for j = 1:numel(testingImages.Files)
    [img, fileinfo] = readimage(testingImages, j);
   img = clean(img);
    xTestImages{1,j} = img;
    tTest = horzcat(tTest, processLabel(fileinfo.Label));
end
%%
%Make testing and training data
xTrainImages = [];
tTrain = [];
for i = 1:numel(trainingImages.Files)
    [img, fileinfo] = readimage(trainingImages, i);
    img = clean(img);
    xTrainImages{1,i} = img;
    tTrain = horzcat(tTrain, processLabel(fileinfo.Label));
end

%%
% 
% clf
% for i = 100:120
%     subplot(4,5,i);
%     imshow(xTrainImages{i});
% end

%Build autoencoder #1
rng('default')
hiddenSize1 = 100;
autoenc1 = trainAutoencoder(xTrainImages,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);
figure()
plotWeights(autoenc1);
feat1 = encode(autoenc1,xTrainImages);

%Train second autoencoder
hiddenSize2 = 50;
autoenc2 = trainAutoencoder(feat1,hiddenSize2, ...
    'MaxEpochs',100, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);
feat2 = encode(autoenc2,feat1);

%Train the final softmax layer
softnet = trainSoftmaxLayer(feat2,tTrain,'MaxEpochs',400);

%Form the stacked neural network
view(autoenc1)
view(autoenc2)
view(softnet)
deepnet = stack(autoenc1,autoenc2,softnet);

save deepnet;


%% Quick lil plot and test
% Get the number of pixels in each image
imageWidth = 28;
imageHeight = 28;
inputSize = imageWidth*imageHeight;

load deepnet;

% Turn the test images into vectors and put them in a matrix
xTest = zeros(inputSize,numel(xTestImages));
for k = 1:numel(xTestImages)
    xTest(:,k) = xTestImages{k}(:);
end

y = deepnet(xTest);
y = processClassification(y(1,1));
disp(y);
% plotconfusion(tTest,y);