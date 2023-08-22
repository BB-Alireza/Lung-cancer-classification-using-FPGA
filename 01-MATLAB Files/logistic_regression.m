clc;
clear;
tic;

load('data.mat');
X_train=double(x_train);         
Y_train=double(y_train);
X_test=double(x_test);
Y_test=double(y_test);

%%
[lentrain,n0] = size(X_train);
[lentest,~]   = size(X_test);

[~,n2] = size(Y_train);


%Initialize Parameter
w1 = [0.1;0.1];
b1 = 0.1;

eta1 = 1; 

epoch = 1;
maxEpoch=60;
disp('Step 1');

%Train
while(epoch<=maxEpoch)
    for i=1:1:lentrain
        %Feed Forward
        d = Y_train(i,:);
        X = X_train(i,:);
        net1 = X*w1+b1;            
        o1 = sigmoid(net1);
        e = d - o1;
        %BP
        delta_1 = e.*dsigmoid(o1);
        
        w1 = w1 + eta1*X'*delta_1;
        b1 = b1 + eta1*delta_1;


    end

    epoch = epoch + 1
    
    
end
disp('Step 2');

%Test
e_tst = [];

%netPlot=[];
%oPlot=[];

for i=1:1:lentest
    d = Y_test(i,:);
    X = X_test(i,:);
    net1 = X*w1+b1;
    o1 = sigmoid(net1);
    e = d - o1;
    e_tst = [e_tst; e ];     % e_tst = [e_tst;mse(e)];
    
  %  netPlot=[netPlot,net1];
  %  oPlot=[oPlot,o1];
end
error_tst = mse(e_tst);
toc;
fprintf('Error in Test dataset is %f\n',error_tst);


%figure
%plot(netPlot,oPlot,'.');
%saveas(gcf,'MLP2Layer.jpg');
%save('natije.mat','b1','w1');
%T=table(w11,b11,net11,o11,e11,delta11);
%writetable(T,'taghirat.csv');


