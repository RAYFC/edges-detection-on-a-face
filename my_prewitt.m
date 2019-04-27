function my_prewitt(I)
close all
% I =imread('test.png'); 
img_gray = rgb2gray(I); 
[m,n] = size(img_gray);
new_img_gray = zeros(m,n); 

K1 = [-1 0 1;-1 0 1;-1 0 1];
K2 = [1 1 1;0 0 0;-1 -1 -1];
for threshold=5:5:90
    for i=2:m-1
        for j=2:n-1
            Gx = K1 .* double(I(i-1:i+1,j-1:j+1));
            Gy = K2 .* double(I(i-1:i+1,j-1:j+1));
            Gx = sum(sum(Gx));
            Gy = sum(sum(Gy));
            G = sqrt(double(Gx)^2+double(Gy)^2);
            if(G > threshold)
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