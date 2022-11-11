[x,t] = bodyfat_dataset;
size(x)
size(t)
setdemorandstream(491218382) %seed
%fitnet utk regresi %fitting(pencocokan)
net = fitnet(10); %jumlah di hidden layer
view(net) 
[net,tr] = train(net,x,t); %net = network ,x = data, t = target
%net.inputs %untuk melihat input array
nntraintool %untuk menampilkan train tool
plotperform(tr)
% data diambil secara random %tr.testInd -> data untuk ditest
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

%net adalah model
testY = net(testX); %digunakan untuk menguji data

perf = mse(net,testY,testX) %mse = mean squared error

y = net(x); %utk prediksi

plotregression(t,y)

e = t - y;
ploterrhist(e)
%max(e) untuk melihat persentase error terbesar
%min(abs(e)) untuk melihat persentase error terkecil
%absoluter digunakan agar persentase tidak negatif

%untuk mengecilkan error lakukan training ulang dengan menggunakan
%[net tr] = train(net,x,t)
% y = net(x);
% e = t - y;
% variabel boleh menggunakan yang lain agar data dapat dibandingkan
% untuk train tidak boleh hingga 100% agar tidak overfitting
