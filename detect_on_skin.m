function detect_on_skin(filename)
%In this version, only 1 face will be detected, but the algorithm could
%give multiple faces.
close all
%filename = 'griz.jpg';

I = imread(filename);
I_g = imgaussfilt(I,2); %reduce noise by gussian filter
heigth = size(I,1);
width = size(I,2);
ycbcr = rgb2ycbcr(I_g);
hsv = rgb2hsv(I_g);
gray = ones(heigth,width)*255; 
%HSV filter
%HSV filter information was from "Human Skin Detection Using RGB, HSV and YCbCr Color Models"
for i = 1:heigth  
    for j = 1:width
        h = hsv(i,j,1);
        s = hsv(i,j,2);
        if (s > 0.68)
            gray(i,j) = 0;
        elseif (s < 0.23)
            gray(i,j) = 0; 
        elseif (h > 0.872) %(50 degrees)
             gray(i,j) = 0; 
        end
    end
end
%YCBCR filter
for i = 1:heigth  
    for j = 1:width  
        y = ycbcr(i,j,1);  
        cb = ycbcr(i,j,2);  
        cr = ycbcr(i,j,3);  
        if(y < 80)  
            gray(i,j) = 0;
        elseif (cb < 77)
            gray(i,j) = 0;
        elseif (cb > 127)
            gray(i,j) = 0;
        elseif (cr < 133)
            gray(i,j) = 0;
        elseif (cr > 174)
            gray(i,j) = 0;
        %All filter information up is from "Explicit Image Detection using YCbCr Space Color Model as Skin Detection"
        elseif(function_test(y,cb,cr) >= 1)  
            gray(i,j) = 0;
        %This filter is from "Explicit Image Detection using YCbCr Space
        %Color Model as Skin Detection"
        end  
    end  
end  
imshow(gray);  
[L,num] = bwlabel(gray,8); %connections in 8 directions
boxes = regionprops(L,'BoundingBox');   
hold on;  
for i = 1:num  
    box = boxes(i).BoundingBox;  
    x = box(1);    
    y = box(2);     
    w = box(3); 
    h = box(4);
    ratio = h/w;
    N = ((2*(w+h))^2)/(w*h);
    if w < 20 || h < 20 || ratio > 2 || ratio < 0.5 || N<4 || N > 18 %% easy check here
        continue
    end
    if check_rectangle(gray,box) < 2
        continue
    end
    rect = [x y w h];  
end  
figure;
imshow(I);
rectangle('Position',[rect(1),rect(2),rect(3),rect(4)],'EdgeColor','r','LineWidth', 3);
hold off
new_I = imcrop(I, [rect(1),rect(2),rect(3),rect(4)]);
new_I = imresize(new_I,3);
imwrite(new_I,"test.png");
end


