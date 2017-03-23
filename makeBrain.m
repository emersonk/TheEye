function net = makeBrain();
    [trx,trt,tsx,tst,valx,valt] = brainPreprocessImg; 

    %Create network:
    hiddenLayerSize = 20;
    net = patternnet(hiddenLayerSize);

%     %Train network
%     net.LW{2,1} = net.LW{2,1}*0.01;
%     net.b{2} = net.b{2}*0.01;
%     net.performFcn = 'sse';         
%     net.trainParam.goal = 0.1;    
%     net.trainParam.show = 20;      
%     net.trainParam.epochs = 5000;  
%     net.trainParam.mc = 0.95;      
    [net,tr] = train(net, trx, trt);

    outputs = net(trx);
    errors = gsubtract(trt,outputs);
    performance = perform(net,trt,outputs);

    %figure, plotconfusion(trt,outputs)

    %test it:
%     img = imread('truetest.png');
%     img = im2double(img);
%     img = imresize(img,[20 20]);
%     imgv = img(:);
%     x = net(imgv);
end