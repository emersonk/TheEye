[trx,trt,tsx,tst,valx,valt] = brainPreprocessImg; 

%Create network:
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

%Train network
net.performFcn = 'sse';         
net.trainParam.goal = 0.1;    
net.trainParam.show = 20;      
net.trainParam.epochs = 5000;  
net.trainParam.mc = 0.95;      
[net,tr] = train(net, trx, trt);

outputs = net(trx);
errors = gsubtract(trt,outputs);
performance = perform(net,trt,outputs);
