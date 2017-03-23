function net = makeBrain();
    [trx,trt,tsx,tst,valx,valt] = brainPreprocessImg; 

    %Create network:
      hiddenLayerSize = 15;
      net = patternnet(hiddenLayerSize);

    
%     %Train network
%     net.LW{2,1} = net.LW{2,1}*0.01;
%     net.b{2} = net.b{2}*0.01;
%     net.performFcn = 'sse';         
    net.trainParam.goal = 0.1;    
    net.trainParam.show = 20;      
    net.trainParam.epochs = 5000;  
    net.trainParam.mc = 0.95;      
    net.trainFcn = 'trainrp';   
    [net,tr] = train(net, trx, trt);

    outputs = net(trx);
    errors = gsubtract(trt,outputs);
    performance = perform(net,trt,outputs);
    
    figure, plotconfusion(trt,outputs)

end