close all;
clear all;
I = imread('pepper.jpg');
I = rgb2gray(I);
I = im2double(I);
% times pou xrhsimopoih8hkan ws katwfli ths diasporas, gia th diathrhsh twn
% megaluterwn suntelestwn se kathe periptwsh
% myvar=[0.00027:0.00025: 0.02,0.02:0.0005:0.03];
% myvar=sort(myvar,'descend');
% mse1=zeros(1,size(myvar,1));
% percent=zeros(1,size(myvar,1));
% k=1;
% for v=myvar 
%     [C,rs,ts,pososto]=zone(I,v);
%     percent(k)=pososto(1);
%     mse1(k) = mseIm(I,C);
%     k=k+1;
% end
% % % % % % % figure
% % % % % % % imshow(C)
myvar2=[0.007:0.001:0.09];
myvar2=sort(myvar2,'descend');
mse1=zeros(1,size(myvar2,1));
percent=zeros(1,size(myvar2,1));
k=1;

Costory=zeros(size(I,1),size(I,1),size(myvar2,1));
for v2=myvar2 
    [M,Magns,magnitudes,pososto2]=threshold(I,v2);
    Costory(:,:,k)=M;
    percent(k)=pososto2(1);
    mse2(k) = mseIm(I,M);
    k=k+1;
end

%%Ypologismos MSE anamesa sthn arxikh kai thn telikh eikona
% mse = mseIm(I,C);
% figure; plot(mse1,'b');
% legend('zonalcoding');
% xlabel('percentage of coefficients (%)');
% ylabel('MSE');
% grid on
% xticklabels({0.0:0.05:0.5})
figure;
plot(mse2,'r');
legend('threholding');
xlabel('percentage of coefficients (%)');
ylabel('MSE');
grid on
xticklabels({0.0:0.05:0.5})