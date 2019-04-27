function my_roberts(I)
close all;
%I =imread('test.png'); 
img_gray = rgb2gray(I); 
[m,n] = size(img_gray);
new_img_gray = zeros(m,n); 
pxValue = 0; 
 
for threshold=5:5:90
    for i=1:m-1
        for j=1:n-1
            pxValue = abs(img_gray(i,j)-img_gray(i+1,j+1))+...
            abs(img_gray(i+1,j)-img_gray(i,j+1));
            if(pxValue > threshold)
                new_img_gray(i,j) = 255;
            else
                new_img_gray(i,j) = 0;
            end
        end
    end
    subplot(3,6,threshold/5);
    imshow(new_img_gray);
    title(['thresholdvalue=',num2str(threshold)])
end
end