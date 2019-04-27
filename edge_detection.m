function edge_detection()
clear all
close all
I=imread('test.png');
I = rgb2gray(I);
%% Part1 ------built_in functions---------------
subplot(2,3,1);
imshow(I);
title('original');
%The first 1 is Roberts cross
Im1=edge(I,'Roberts');
subplot(2,3,2);
imshow(Im1);
title('Robert');
Im2=edge(I,'Sobel');
subplot(2,3,3);
imshow(Im2);
title('Sobel')
Im3=edge(I,'Prewitt');
subplot(2,3,4);
imshow(Im3);
title('Prewitt');
Im4=edge(I,'LOG');
subplot(2,3,5);
imshow(Im4);
title('LOG')
Im5=edge(I,'Canny');
subplot(2,3,6);
imshow(Im5);
title('Canny')
%% Part2 ------self_defined functions-----------------
pause;
I=imread('test.png');
my_roberts(I);
pause;
my_sobel(I);
pause;
my_prewitt(I);
pause;
my_log(I)
end