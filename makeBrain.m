function net = makeBrain()
    [trx,trt,tsx,tst,valx,valt] = preprocessTrainImg; 

    %Create network:
    net = patternnet(5);
    
    %Train 10 neural networks
%     net.LW{2,1} = net.LW{2,1}*0.01;
%     net.b{2} = net.b{2}*0.01;
%     net.performFcn = 'sse';         
%     net.trainParam.goal = 0.1;    
%     net.trainParam.show = 20;      
%     net.trainParam.epochs = 5000;  
%     net.trainParam.mc = 0.95;      
%     net.trainFcn = 'trainrp';   
    [net,tr] = train(net, trx, trt);

    %If we decide to save the net (run in command window?)
    save net; 

end