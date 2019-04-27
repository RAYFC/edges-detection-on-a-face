function result = check_rectangle(I,box)
box = round(box);
y = box(2);    
w = box(3);
h = box(4);
potential_area = I(y:y+h,x:x+w);
[~,result] = bwlabel(potential_area,8);
