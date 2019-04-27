function my_sobel(I)
close all
% I =imread('test.png'); 
img_gray = rgb2gray(I); 
[m,n] = size(img_gray);
new_img_gray = zeros(m,n); 
 
for threshold=5:5:90
    for i=2:m-1
        for j=2:n-1
            Dx = (I(i+1,j-1) - I(i-1,j+1)) + (2 * (I(i+1,j)-I(i-1,j))) +  (I(i+1,j+1) - I(i-1,j+1));
            Dy = (I(i-1,j+1) - I(i-1,j-1)) + (2 * (I(i,j+1)-I(i,j-1))) +  (I(i+1,j+1) - I(i+1,j-1));
            temp = sqrt(double(Dx)^2+double(Dy)^2);
            if(temp > threshold)
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