%The function was made based on "A Face Detection Method Based on Skin
%Color Model"
%which is avaliable from https://download.atlantis-press.com/article/1725.pdf
function value = function_test(Y,cb,cr)  
a = 25.39;  
b = 14.03;  
ecx = 1.60;  
ecy = 2.41;  
theta = 2.53;  
cx = 109.38;  
cy = 152.02;  
A = [cos(theta) sin(theta);-sin(theta) cos(theta)];  
cb = double(cb);  
cr = double(cr);  
t = [(cb-cx);(cr-cy)];  
temp = A*t;  
value = (temp(1) - ecx)^2/a^2 + (temp(2) - ecy)^2/b^2;  
