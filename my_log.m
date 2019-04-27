function my_log(I)
close all;
m=11;
sigma=2;
w = fspecial('log',m,sigma); 
img= imread('test.png');
img = double(rgb2gray(img)); 
imgn=imfilter(img,w,'replicate');
[r,c]= size(img);
new_img = zeros(size(img));
for threshold = 0.5:0.1:1.4
    for i = 3:r-2
        for j = 3:c-2
            if zero_crossing(imgn,i,j,threshold)
                new_img(i,j) = 255;
            else
                new_img(i,j) = 0;
            end
        end
    end
    subplot(2,5,round((threshold-0.4)/0.1));
    imshow(new_img);
end
end
function result = zero_crossing (I,i,j,threshold)
    result = 0;
    if I(i,j) * I(i-1,j) < 0 && abs(I(i,j) - I(i-1,j)) > threshold
        result = 1;
    elseif I(i,j) * I(i+1,j) < 0 && abs(I(i,j) - I(i+1,j)) > threshold
        result = 1;
    elseif I(i,j) * I(i,j+1) < 0 && abs(I(i,j) - I(i,j+1)) > threshold
        result = 1;
    elseif I(i,j) * I(i,j-1) < 0 && abs(I(i,j) - I(i,j-1)) > threshold
        result = 1;
    end  
end