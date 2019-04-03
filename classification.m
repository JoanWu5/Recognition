xlswrite('E:\recognition\number.xlsx',idx);
label=xlsread('E:\recognition\number.xlsx');
x=[x,label];
data=[x(:,1:2),x(:,4),x(:,6)];
traindata=data(1:138,:);%训练数据
testdata=data(139:172,:);%测试数据
trainlabel=label(1:138,:);%训练分类
%朴素贝叶斯分类器（Naive Bayes）  
testlabel=label(139:172,:);
nb = fitcnb(traindata, trainlabel); 
predictlabel   = predict(nb, testdata);  
accuracy = length(find(predictlabel == testlabel))/length(testlabel)*100;  
accuracy
accuracy =
   91.1765
%K近邻分类器 （KNN）  
mdl = ClassificationKNN.fit(traindata,trainlabel,'NumNeighbors',1); 
predictlabel2   = predict(mdl, testdata); 
accuracy2  =length(find(predictlabel2 == testlabel))/length(testlabel)*100
accuracy2 =
    94.1176
%随机森林分类器（Random Forest）     
B = TreeBagger(4,traindata,trainlabel);  
predictlabel3 = predict(B,testdata); 
m=0;  
n=0;  
for i=1:17  
     if predictlabel3{i,1}>0  
         m=m+1;  
     end  
     if predictlabel3{i+17,1}<0  
        n=n+1;  
     end  
 end 
s=m+n;
accuracy3=s/34*100 
accuracy3=
50


