%tidak bisa dipakai
clc
clear all
close all

load rubber.dat

[row,col] = size(rubber)
[NormX,minval,maxval]=premmx(rubber)

Datatrain=NormX(:,1:8)';
Datatarget=NormX(:,9)';

pp=Datatrain(:,1:8);
mnmx = minmax(pp)

net = newff(mnmx, [6 10 5 4 1],{'tansig' 'tansig' 'tansig' 'purelin' 'tansig'});
net.trainParam.goal=0.0;
net.trainParam.lr=0.2;
net.trainParam.performFcn='mse';
net.trainParam.mc=0.7;
net.trainParam.train='learnlm';

[net,tr]=train(net,Datatrain,Datatarget);

net.IW{1,1}
net.LW{2,1}

out=sim(net,Datatrain);

figure;

plot(Datatarget,'b');hold on;
plot(out,'r');title('train data');
legend('target output','network output');

Testdata = NormX(:,2:9)';
Testtarget = NormX(:,10);

output = sim(net,Testdata);

figure;plot(Testtarget,'b');hold on;
plot(output,'r');title('test data');
legend('target output','network output');

denormX = postmnmx(Testtarget,'b');hold on;
plot(denormX,'b');hold on;
plot(denormOut,'r');title('test data');
legend('target output','network output');

