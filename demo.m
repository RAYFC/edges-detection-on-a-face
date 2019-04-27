clear all
close all
%filename = 'Griz1.jpg';
filename = 'Griz.jpg';
%detect_on_skin(filename); 
detect_on_model(filename);
pause;
edge_detection();
%When the program stops, please press enter to continue.
%Images will appear:
% 1.the result of face detection
% 2. Built-in method for edge detection
% 3. My roberts implementation with different thresholds
% 4. My Sobel implementation with different thresholds(it will take 20-30 seconds)
% 5. My Prewitt implementation with different thresholds
% 6. My LOG implementation with different thresholds