% Load Training Images
% In order for imageDataStore to parse the folder names as category labels,
% you would have to store image categories in corresponding sub-folders.
allImages = imageDatastore('training_images', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Split data into training and test sets 
[trainingImages, testImages] = splitEachLabel(allImages, 0.8, 'randomize');
  
net = alexnet;

layersTransfer = net.Layers(1:end-3);

%Currently only have the training info for 2 classes (A,B)
numClasses = 2;

layers = [...
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

% 'ExecutionEnvironment','cpu',...

options = trainingOptions('sgdm',...
    'MiniBatchSize',5,...
    'MaxEpochs',10,...
    'InitialLearnRate',0.0001);

netTransfer = trainNetwork(trainingImages,layers,options);