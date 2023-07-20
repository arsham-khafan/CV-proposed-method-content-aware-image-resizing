clc; clear; close all;
DMap = im2double(imread("Snowman_DMap.png"));
I = im2double(imread("Snowman.png"));
%--------------------------------------------
[J,Enew] = my_seam_carve(I,DMap);
%--------------------------------------------
close all;

subplot(1,3,1)
imshow(I,[])
title("initial image")
subplot(1,3,2)
imshow(J,[])
title("1/2 * width")
subplot(1,3,3)
imshow(Enew,[])
title("1/2 * width Energy map")
