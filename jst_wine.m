[x,t] = wine_dataset;
size(x)
size(t)
setdemorandstream(491218382) %seed
net = patternnet(10);   %patternnet utk klasifikasi
view(net)
[net,tr] = train(net,x,t);
nntraintool
plotperform(tr)
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testIndicies = vec2ind(testY)
plotconfusion(testT,testY)
[c,cm] = confusion(testT,testY)

fprintf('Percentage Correct Classification  : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification  : %f%%\n', 100*c);
plotroc(testT,testY)