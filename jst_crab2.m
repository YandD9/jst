[x,t] = crab_dataset;
net = patternnet(10,'trainbr'); %trainbr = bayesian regularization %defaultnya = trainlm
%abaikan warning karena menurut matlab tidak cocok menggunakan trainbr
[net,tr] = train(net,x,t);
y = net(x);
plotconfusion(t,y);