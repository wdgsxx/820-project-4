function [train]=get_data()
path = 'att_faces/';
labels = ["s1","s2","s3","s4","s5","s6","s7","s8","s9","s10", "s11","s12","s13","s14","s15","s16","s17","s18","s19","s20","s21","s22","s23","s24","s25","s26","s27","s28","s29","s30","s31","s32","s33","s34","s35","s36","s37","s38","s39","s40","Other_Images"];
train_data = zeros(40*10,92*112);
for k = 1:40      
    updated_path = strcat( path,labels(k));
    image_names = dir (updated_path);
    for i = 3 : length(image_names)
        img_name = image_names(i).name;            
        fullFileName = strcat(strcat(updated_path,'/'), img_name);
        train_data((k-1)*10 + (i-2),:) = reshape(imread (convertStringsToChars(fullFileName)),1,[]);
    end
end
train = train_data;
end