[x,t] = bodyfat_dataset;
net = fitnet(10,'trainbr'); %trainbr = bayesian regularization %defaultnya = trainlm 
[net,tr] = train(net,x,t);
plotregression(t,net(x))