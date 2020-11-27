function PCAplots(type)
train = get_data();
[all_Y,Y,PC, mean_features] = PCA(2, 400, train,400); 
if type==1
    %variance vs number of PCs
    Y_var = diag(all_Y*all_Y'/399);
    sy = sum(Y_var);
    for i=1:length(Y_var)
        pp(i) = sum(Y_var(1:i))/sy;
    end
    ind = linspace(1,length(Y_var),length(Y_var));
    scatter(ind,pp)
    xlabel('number of PCs')
    ylabel('total variance')
elseif type==2
    %The first four eigenfaces
    subplot(2,2,1), imshow(reshape(PC(:,1),[112,92]),[])
	title ('first eigenface')
	subplot(2,2,2), imshow(reshape(PC(:,2),[112,92]),[])
	title ('second eigenface')	
	subplot(2,2,3), imshow(reshape(PC(:,3),[112,92]), [])
	title ('third eigenface')
 	subplot(2,2,4), imshow(reshape(PC(:,4),[112,92]), [])
	title ('forth eigenface')   
elseif type==3
    %The 50th, 100th, 150th and 200th eigenfaces
    subplot(2,2,1), imshow(reshape(PC(:,50),[112,92]),[])
	title ('50th eigenface')
	subplot(2,2,2), imshow(reshape(PC(:,100),[112,92]),[])
	title ('100th eigenface')	
	subplot(2,2,3), imshow(reshape(PC(:,200),[112,92]), [])
	title ('200th eigenface')
 	subplot(2,2,4), imshow(reshape(PC(:,400),[112,92]), [])
	title ('400th eigenface')
else
    %reconstruction
    order = 0;
    for num=[10 20 50 100 150 200 250 400]
        order = order+1;
        [all_Y,Y,PC, mean_features] = PCA(2, num, train,400);
        recons = Y' * PC';
        recons = recons + mean_features';
        subplot(2,4,order), imshow(reshape(recons(1,:),[112,92]),[])
        str = ['Reconstructed from ' num2str(num) ' Eigen Vectors'];
        title (str)		
    end
end