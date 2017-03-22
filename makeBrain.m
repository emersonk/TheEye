[trx,trt,tsx,tst,valx,valt] = brainPreprocessImg; 

%Create network:
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

%Train network
[net,tr] = train(net, trx, trt);

outputs = net(trx);
errors = gsubtract(trt,outputs);
performance = perform(net,trt,outputs);


% net = patternnet(10);
% net = train(net,x,t);
% view(net)
% y = net(x);
% perf = perform(net,t,y);
% classes = vec2ind(y);