%The plot of variance vs number of principle components
PCAplots(1);
%The first 4 eigenfaces
figure;
PCAplots(2);
%The 50th, 100th, 150th and 200th eigenfaces
figure;
PCAplots(3);
%Facereconstruction
figure;
PCAplots(4);
%Face recognition with KNN
KNN_Classification(1);
%Face identification with KNN
KNN_Classification(2);