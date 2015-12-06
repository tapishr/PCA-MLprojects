clear all
clc
load('facesdata.mat');
%Ih=II(:,1:5152);
%bat=imread('subject.gif');
%bat=rgb2gray(bat);
%batd=im2double(bat);
normI=normalization(X);
s=size(normI,1);
temp=1/s.*normI'*normI;
[U,S,~]=svd(temp);
evnum=200;
projection=zeros(size(normI,1),evnum);
for i = 1:size(normI,1)
    x = normI(i,:);
    for j = 1:evnum
        projection_j = x * U(:, j);
        projection(i, j) = projection_j;
    end 
end
recI=zeros(size(projection,1),size(U,1));
for i=1:size(projection, 1),
    for j=1:size(U,1),
        ev = projection(i, :);
        recj = ev * U(j, 1:evnum)';
        recI(i, j) = recj;
    end
end
subplot(1, 2, 1);
displayData(X(30:45,:));
title('Actual Data');
axis square;

subplot(1, 2, 2);
displayData(recI(30:45,:));
title('Recovered Data');
axis square;
